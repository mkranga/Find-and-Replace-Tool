unit MainU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  System.IniFiles, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, JvCsvData,
  System.IOUtils, System.Types, System.Masks;

type
  TMainF = class(TForm)
    ds1: TDataSource;
    tblfrl: TJvCsvDataSet;
    dgfrl: TDBGrid;
    dgf: TDBGrid;
    pnl1: TPanel;
    ed1: TEdit;
    bt1: TButton;
    bt2: TButton;
    chk1: TCheckBox;
    edExt: TEdit;
    chkRec: TCheckBox;
    tblfl: TJvCsvDataSet;
    ds2: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FillFileList();
    procedure bt2Click(Sender: TObject);
    procedure bt1Click(Sender: TObject);
  private
    { Private declarations }
    function GetFiles(const Path, Masks: string; so: TSearchOption): TStringDynArray;
  public
    { Public declarations }
  end;

var
  MainF: TMainF;

implementation

uses
  System.StrUtils;
{$R *.dfm}

function TMainF.GetFiles(const Path, Masks: string; so: TSearchOption): TStringDynArray;
var
  MaskArray: TStringDynArray;
  Predicate: TDirectory.TFilterPredicate;
begin
  MaskArray := SplitString(Masks, ',');
  Predicate :=
    function(const Path: string; const SearchRec: TSearchRec): Boolean
    var
      Mask: string;
    begin
      for Mask in MaskArray do
        if MatchesMask(SearchRec.Name, Mask) then
          exit(True);
      exit(False);
    end;
  Result := TDirectory.GetFiles(Path, '*.*', so, Predicate);
end;

procedure TMainF.bt1Click(Sender: TObject);
begin
  FillFileList;
end;

procedure TMainF.bt2Click(Sender: TObject);
var
  fl, rl: TStrings;
  s: string;
  rf: TReplaceFlags;
  i: Integer;
begin
  FillFileList;
  fl := TStringList.Create;
  rl := TStringList.Create;
  rf := [rfReplaceAll];
  if chk1.Checked then
    Include(rf, rfIgnoreCase);
  tblfl.First;
  tblfrl.First;
  tblfrl.DisableControls;
  if tblfl.RecordCount < 1 then
    exit;
  while not (tblfrl.eof) do
  begin
    rl.Add(tblfrl.Fields[0].AsString + '=' + tblfrl.Fields[1].AsString);
    tblfrl.next;
  end;
  while not (tblfl.eof) do
  begin
    fl.LoadFromFile(tblfl.Fields[0].AsString);
    s := fl.Text;
    for i := 0 to rl.Count-1 do
      s := StringReplace(s, rl.Names[i], rl.ValueFromIndex[i], rf);
    fl.Text := s;
    fl.SaveToFile(tblfl.Fields[0].AsString + 'n');
    tblfl.Next;
  end;
  tblfrl.EnableControls;
  fl.free;
  rl.free;
end;

procedure TMainF.FillFileList();
var
  s: TStringDynArray;
  I: Integer;
begin

  s := GetFiles(ed1.Text, edExt.Text, TSearchOption(chkRec.Checked));
  tblfl.DisableControls;
  tblfl.EmptyTable;
  for I := 0 to High(s) do
    tblfl.AppendRowString(s[I]);
  tblfl.EnableControls;
end;

procedure TMainF.FormCreate(Sender: TObject);
begin
  ed1.Text := ExtractFilePath(ParamStr(0));
end;

end.

