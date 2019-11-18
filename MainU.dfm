object MainF: TMainF
  Left = 0
  Top = 0
  BorderWidth = 2
  Caption = 'Find and Replace'
  ClientHeight = 504
  ClientWidth = 606
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dgfrl: TDBGrid
    Left = 0
    Top = 65
    Width = 606
    Height = 233
    Align = alTop
    DataSource = ds1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'FIND'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REPLACE'
        Width = 270
        Visible = True
      end>
  end
  object dgf: TDBGrid
    Left = 0
    Top = 298
    Width = 606
    Height = 206
    Align = alClient
    DataSource = ds2
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'PATH'
        Width = 590
        Visible = True
      end>
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 606
    Height = 65
    Align = alTop
    TabOrder = 0
    object ed1: TEdit
      Left = 4
      Top = 4
      Width = 461
      Height = 21
      TabOrder = 2
      Text = 'ed1'
    end
    object bt1: TButton
      Left = 471
      Top = 2
      Width = 37
      Height = 25
      Caption = '...'
      TabOrder = 0
      OnClick = bt1Click
    end
    object bt2: TButton
      Left = 522
      Top = 2
      Width = 75
      Height = 25
      Caption = 'GO'
      TabOrder = 1
      OnClick = bt2Click
    end
    object chk1: TCheckBox
      Left = 518
      Top = 35
      Width = 79
      Height = 17
      Caption = 'Ignore Case'
      TabOrder = 5
    end
    object edExt: TEdit
      Left = 4
      Top = 33
      Width = 393
      Height = 21
      TabOrder = 3
      Text = '*.pas,*.dfm'
    end
    object chkRec: TCheckBox
      Left = 422
      Top = 35
      Width = 79
      Height = 17
      Caption = 'Recursive'
      TabOrder = 4
    end
  end
  object ds1: TDataSource
    DataSet = tblfrl
    Left = 184
    Top = 56
  end
  object tblfrl: TJvCsvDataSet
    FieldDefs = <
      item
        Name = 'FIND'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'REPLACE'
        DataType = ftString
        Size = 200
      end>
    Active = True
    FileName = 'FRList'
    CsvFieldDef = 'FIND:$200,REPLACE:$200'
    AutoBackupCount = 0
    StoreDefs = True
    Left = 212
    Top = 56
  end
  object tblfl: TJvCsvDataSet
    FieldDefs = <
      item
        Name = 'PATH'
        DataType = ftString
        Size = 500
      end>
    Active = True
    CsvFieldDef = 'PATH:$500'
    LoadsFromFile = False
    SavesChanges = False
    AutoBackupCount = 0
    StoreDefs = True
    Left = 232
    Top = 192
  end
  object ds2: TDataSource
    DataSet = tblfl
    Left = 180
    Top = 204
  end
end
