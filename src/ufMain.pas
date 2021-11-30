unit ufMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.Types, System.UITypes, Vcl.Graphics, Skia, Skia.Vcl, System.UIConsts,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, System.Diagnostics;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnSkia: TButton;
    btnVCLPixel: TButton;
    btnClose: TButton;
    lblSkiaTime: TLabel;
    lblVCLTime: TLabel;
    btnVCLScanline: TButton;
    lblVCLScanLine: TLabel;
    Image1: TImage;
    Panel3: TPanel;
    btnClear: TSpeedButton;
    Button1: TButton;
    lblSkiaPixelMap: TLabel;
    procedure btnSkiaClick(Sender: TObject);
    procedure btnVCLPixelClick(Sender: TObject);
    procedure btnVCLScanlineClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

Uses IOUtils, Math;

// Taken from:
// https://www.swissdelphicenter.ch/en/showcode.php?id=1107

procedure DrawMandelbrotSkia(ACanvas: ISkCanvas; LPaint : ISkPaint; X, Y, au, bu: Double; X2, Y2: Integer);
var
  c1, c2, z1, z2, tmp: Double;
  i, j, Count, rgb : Integer;
  hue, saturation, value : double;
  fr, fg, fb : single;
begin
  c2 := bu;
  for i := 10 to X2 do
  begin
    c1 := au;
    for j := 0 to Y2 do
    begin
      z1 := 0;
      z2 := 0;
      Count := 0;
      // count is deep of iteration of the mandelbrot set
      // if |z| >=2 then z is not a member of a mandelset
      while (((z1 * z1 + z2 * z2 < 4) and (Count <= 50))) do
      begin
        tmp := z1;
        z1 := z1 * z1 - z2 * z2 + c1;
        z2 := 2 * tmp * z2 + c2;
        Inc(Count);
      end;
      // The color depends on the number of iterations
      hue := count / 50;
      saturation := 0.6;
      value := 0.5;

      LPaint.Color := $FF000000 or HSLtoRGB(hue, saturation, value);
      ACanvas.DrawPoint(i, j, LPaint);
      c1 := c1 + X;
    end;
    c2 := c2 + Y;
  end;
end;

procedure DrawMandelbrotSkiaPixmap(APixmap: ISkPixmap; X, Y, au, bu: Double; X2, Y2: Integer);
  var
    c1, c2, z1, z2, tmp: Double;
    i, j, Count, rgb: Integer;
    hue, saturation, value: Double;
  begin
    c2 := bu;
    for i := 10 to X2 - 1 do
    begin
      c1 := au;
      for j := 0 to Y2 - 1 do
      begin
        z1 := 0;
        z2 := 0;
        Count := 0;
        // count is deep of iteration of the mandelbrot set
        // if |z| >=2 then z is not a member of a mandelset
        while (((z1 * z1 + z2 * z2 < 4) and (Count <= 50))) do
        begin
          tmp := z1;
          z1 := z1 * z1 - z2 * z2 + c1;
          z2 := 2 * tmp * z2 + c2;
          Inc(Count);
        end;
        // The color depends on the number of iterations
        hue := count / 50;
        saturation := 0.6;
        value := 0.5;

        PCardinal(APixmap.PixelAddr[i, j])^ := HSLtoRGB(hue, saturation, value);
        c1 := c1 + X;
      end;
      c2 := c2 + Y;
    end;
  end;

procedure DrawMandelbrotVCL(ACanvas: TCanvas; X, Y, au, bu: Double; X2, Y2: Integer);
var
  c1, c2, z1, z2, tmp: Double;
  i, j, Count, rgb : Integer;
  hue, saturation, value : double;
  fr, fg, fb : single;
begin
  c2 := bu;
  for i := 10 to X2 - 1 do
  begin
    c1 := au;
    for j := 0 to Y2 - 1 do
    begin
      z1 := 0;
      z2 := 0;
      Count := 0;
      // count is deep of iteration of the mandelbrot set
      // if |z| >=2 then z is not a member of a mandelset
      while (((z1 * z1 + z2 * z2 < 4) and (Count <= 50))) do
      begin
        tmp := z1;
        z1 := z1 * z1 - z2 * z2 + c1;
        z2 := 2 * tmp * z2 + c2;
        Inc(Count);
      end;
      // The color depends on the number of iterations
      hue := count / 50;
      saturation := 0.6;
      value := 0.5;

      ACanvas.Pixels[i,j] := AlphaColorToColor (HSLtoRGB(hue, saturation, value));
      c1 := c1 + X;
    end;
    c2 := c2 + Y;
  end;
end;

procedure DrawMandelbrotVCLUsingScanLine(bmp: TBitmap; X, Y, au, bu: Double; X2, Y2: Integer);
var
  c1, c2, z1, z2, tmp: Double;
  i, j, Count, rgb: Integer;
  hue, saturation, value : double;
  fr, fg, fb : single;
  ACanvas: TCanvas;
  p, currPixel: PColor;
  bytesPerLine: integer;
begin
  bmp.PixelFormat := pf32bit;
  //nb: should probably test here for the occas. non-inverted image
  p := bmp.ScanLine[0];
  bytesPerLine := bmp.Width;
  c2 := bu;
  for i := 10 to X2 - 1 do
  begin
    c1 := au;
    currPixel := p;
    inc(currPixel, i);
    for j := 0 to Y2 - 1 do
    begin
      z1 := 0;
      z2 := 0;
      Count := 0;
      // count is deep of iteration of the mandelbrot set
      // if |z| >=2 then z is not a member of a mandelset
      while (((z1 * z1 + z2 * z2 < 4) and (Count <= 50))) do
      begin
        tmp := z1;
        z1 := z1 * z1 - z2 * z2 + c1;
        z2 := 2 * tmp * z2 + c2;
        Inc(Count);
      end;
      // The color depends on the number of iterations
      hue := count / 50;
      saturation := 0.6;
      value := 0.5;
      currPixel^ := TColor(HSLtoRGB(hue, saturation, value));
      c1 := c1 + X;
      dec(currPixel, bytesPerLine);
    end;
    c2 := c2 + Y;
  end;
end;


procedure TfrmMain.btnClearClick(Sender: TObject);
begin
  image1.Picture := nil;
end;

procedure TfrmMain.btnSkiaClick(Sender: TObject);
var LBitmap : TBitmap;
    LPaint: ISkPaint;
    LRect: TRectF;
  au, ao: double;
  dX, dY, bo, bu: Double;
  width, height : integer;
  LTimer: TStopwatch;
begin
  LTimer := TStopwatch.StartNew;
  width := Image1.width; height := Image1.height;
  LBitmap := TBitmap.Create(width, height);
  screen.cursor := crHourGlass;
  try
    LBitmap.SkiaDraw(
      procedure (const ACanvas: ISkCanvas)
      begin
        LPaint := TSkPaint.Create;
        LPaint.StrokeWidth := 1;
        ao := -0.5766;
        au := -0.5506;
        bo := 0.6338;
        bu := 0.6534;

        ao := 1;
        au := -2;
        bo := 1.5;
        bu := -1.5;

        dX := (ao - au) / (width);
        dY := (bo - bu) / (Height);
        DrawMandelbrotSkia(ACanvas, LPaint, dX, dY, au, bu, width, height);
      end);
    Image1.Picture.Assign(LBitmap);
  finally
    Lbitmap.free;
    screen.cursor := crDefault;
  end;
  lblSkiaTime.Caption := 'Time: ' + LTimer.ElapsedMilliseconds.ToString + ' ms';
end;


procedure TfrmMain.btnVCLPixelClick(Sender: TObject);
var au, ao: double;
    dX, dY, bo, bu: Double;
    bitmap : TBitmap;
    LTimer: TStopwatch;
begin
  LTimer := TStopwatch.StartNew;
  screen.cursor := crHourGlass;
  bitmap := TBitmap.Create (Image1.Width, Image1.Height);
  try
    ao := 1;
    au := -2;
    bo := 1.5;
    bu := -1.5;
    // direct scaling cause of speed
    dX := (ao - au) / (Image1.width);
    dY := (bo - bu) / (Image1.Height);
    DrawMandelbrotVCL(Bitmap.Canvas, dX, dY, au, bu, Image1.width, Image1.height);
    Image1.Picture.Assign(Bitmap);
  finally
    bitmap.Free;
    screen.cursor := crDefault;
  end;
  lblVCLTime.Caption := 'Time: ' + LTimer.ElapsedMilliseconds.ToString + ' ms';
end;


procedure TfrmMain.btnVCLScanlineClick(Sender: TObject);
var au, ao: double;
    dX, dY, bo, bu: Double;
    bitmap : TBitmap;
    LTimer: TStopwatch;
begin
  LTimer := TStopwatch.StartNew;
  screen.cursor := crHourGlass;
  bitmap := TBitmap.Create (Image1.Width, Image1.Height);
  try
    ao := 1;
    au := -2;
    bo := 1.5;
    bu := -1.5;
    // direct scaling cause of speed
    dX := (ao - au) / (Image1.width);
    dY := (bo - bu) / (Image1.Height);
    DrawMandelbrotVCLUsingScanLine (Bitmap, dX, dY, au, bu, Image1.width, Image1.height);
    Image1.Picture.Assign(Bitmap);
  finally
    bitmap.Free;
    screen.cursor := crDefault;
  end;
  lblVCLScanLine.Caption := 'Time: ' + LTimer.ElapsedMilliseconds.ToString + ' ms';
end;

procedure TfrmMain.Button1Click(Sender: TObject);
var
  au, ao: Double;
  dX, dY, bo, bu: Double;
  LWidth: Integer;
  LHeight: Integer;
  LTimer: TStopwatch;
  LBitmap: TBitmap;
  LSurface: ISkSurface;
begin
  LTimer := TStopwatch.StartNew;
  LWidth := Image1.Width;
  LHeight := Image1.Height;
  LSurface := TSkSurface.MakeRaster(LWidth, LHeight);
  screen.cursor := crHourGlass;

  LBitmap := TBitmap.Create(LWidth, LHeight);
  try
    ao := 1;
    au := -2;
    bo := 1.5;
    bu := -1.5;
    // direct scaling cause of speed
    dX := (ao - au) / (LWidth);
    dY := (bo - bu) / (LHeight);
    DrawMandelbrotSkiaPixmap(LSurface.PeekPixels, dX, dY, au, bu, LWidth, LHeight);
    LBitmap.SkiaDraw(
      procedure (const ACanvas: ISkCanvas)
      begin
        ACanvas.DrawImage(LSurface.MakeImageSnapshot, 0, 0);
      end);
    Image1.Picture.Assign(LBitmap);
  finally
    LBitmap.Free;
    screen.cursor := crDefault;
  end;

  lblSkiaPixelMap.Caption := 'Time: ' + LTimer.ElapsedMilliseconds.ToString +' ms';
end;

end.
