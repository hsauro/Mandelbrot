object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Mandelbrot Timings'
  ClientHeight = 1048
  ClientWidth = 1026
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -18
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  PixelsPerInch = 144
  TextHeight = 25
  object Image1: TImage
    Left = 105
    Top = 121
    Width = 921
    Height = 865
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alClient
    ExplicitLeft = 376
    ExplicitTop = 217
    ExplicitWidth = 158
    ExplicitHeight = 157
  end
  object Panel1: TPanel
    Left = 0
    Top = 986
    Width = 1026
    Height = 62
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 1098
    ExplicitWidth = 2001
    DesignSize = (
      1026
      62)
    object btnClose: TButton
      Left = 883
      Top = 12
      Width = 110
      Height = 40
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Anchors = [akTop, akRight]
      Caption = 'Close'
      TabOrder = 0
      ExplicitLeft = 1858
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1026
    Height = 121
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 2001
    object lblSkiaTime: TLabel
      Left = 48
      Top = 67
      Width = 38
      Height = 25
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Time'
    end
    object lblVCLTime: TLabel
      Left = 538
      Top = 67
      Width = 38
      Height = 25
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Time'
    end
    object lblVCLScanLine: TLabel
      Left = 781
      Top = 67
      Width = 38
      Height = 25
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Time'
    end
    object lblSkiaPixelMap: TLabel
      Left = 293
      Top = 67
      Width = 38
      Height = 25
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Time'
    end
    object btnSkia: TButton
      Left = 28
      Top = 13
      Width = 230
      Height = 38
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Using Skia DrawPoint'
      TabOrder = 0
      OnClick = btnSkiaClick
    end
    object btnVCLPixel: TButton
      Left = 517
      Top = 13
      Width = 230
      Height = 38
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Using VCL pixel'
      TabOrder = 1
      OnClick = btnVCLPixelClick
    end
    object btnVCLScanline: TButton
      Left = 761
      Top = 13
      Width = 230
      Height = 38
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Using VCL scanline'
      TabOrder = 2
      OnClick = btnVCLScanlineClick
    end
    object btnSkiaPixelmap: TButton
      Left = 273
      Top = 13
      Width = 230
      Height = 38
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Using Skia pixelmap'
      TabOrder = 3
      OnClick = btnSkiaPixelmapClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 121
    Width = 105
    Height = 865
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alLeft
    TabOrder = 2
    ExplicitHeight = 977
    object btnClear: TSpeedButton
      Left = 16
      Top = 28
      Width = 66
      Height = 33
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Clear'
      OnClick = btnClearClick
    end
  end
end
