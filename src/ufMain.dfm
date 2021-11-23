object frmMain: TfrmMain
  Left = 0
  Top = 0
  Anchors = [akLeft, akTop, akRight]
  Caption = 'Manelbrot'
  ClientHeight = 1160
  ClientWidth = 2001
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -18
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  PixelsPerInch = 144
  TextHeight = 25
  object Panel1: TPanel
    Left = 0
    Top = 1098
    Width = 2001
    Height = 62
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alBottom
    TabOrder = 0
    ExplicitLeft = 680
    ExplicitTop = 1224
    ExplicitWidth = 277
    DesignSize = (
      2001
      62)
    object btnClose: TButton
      Left = 1858
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
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 2001
    Height = 61
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    TabOrder = 1
    ExplicitLeft = -10
    ExplicitTop = -24
    ExplicitWidth = 2237
    object btnSkia: TButton
      Left = 48
      Top = 13
      Width = 193
      Height = 38
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Draw Using Skia'
      TabOrder = 0
      OnClick = btnSkiaClick
    end
    object btnVCL: TButton
      Left = 276
      Top = 13
      Width = 193
      Height = 38
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Draw Using VCL'
      TabOrder = 1
      OnClick = btnVCLClick
    end
  end
  object GridPanel1: TGridPanel
    Left = 0
    Top = 61
    Width = 2001
    Height = 1037
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alClient
    ColumnCollection = <
      item
        Value = 50.000000000000000000
      end
      item
        Value = 50.000000000000000000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = Image1
        Row = 0
      end
      item
        Column = 1
        Control = Image2
        Row = 0
      end>
    RowCollection = <
      item
        Value = 100.000000000000000000
      end>
    TabOrder = 2
    ExplicitLeft = 904
    ExplicitTop = 184
    ExplicitWidth = 457
    ExplicitHeight = 401
    object Image1: TImage
      Left = 1
      Top = 1
      Width = 1000
      Height = 1035
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alClient
      ExplicitLeft = 264
      ExplicitTop = 154
      ExplicitWidth = 105
      ExplicitHeight = 105
    end
    object Image2: TImage
      Left = 1001
      Top = 1
      Width = 999
      Height = 1035
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alClient
      ExplicitLeft = 290
      ExplicitTop = 148
      ExplicitWidth = 105
      ExplicitHeight = 105
    end
  end
end
