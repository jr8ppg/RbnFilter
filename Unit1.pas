unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Generics.Collections;

type
  TRbnRecord = class
    callsign: string;
    de_pfx: string;
    de_cont: string;
    freq: string;
    band: string;
    dx: string;
    dx_pfx: string;
    dx_cont: string;
    mode: string;
    db: string;
    date: string;
    speed: string;
    tx_mode: string;
  end;

  TRbnList = class(TObjectList<TRbnRecord>)
  public
    constructor Create(OwnsObjects: Boolean = True);
    destructor Destroy(); override;
  end;

  TForm1 = class(TForm)
    buttonStart: TButton;
    Memo1: TMemo;
    editFileName: TEdit;
    buttonFileRef: TButton;
    OpenDialog1: TOpenDialog;
    GroupBox1: TGroupBox;
    checkDateCompare13: TRadioButton;
    checkDateCompare16: TRadioButton;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    radioDxPfx: TRadioButton;
    radioDxCont: TRadioButton;
    procedure buttonStartClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure buttonFileRefClick(Sender: TObject);
  private
    { Private êÈåæ }
  public
    { Public êÈåæ }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
   Memo1.Clear();
end;

procedure TForm1.buttonFileRefClick(Sender: TObject);
begin
   if OpenDialog1.Execute(Self.Handle) <> True then begin
      Exit;
   end;

   editFileName.Text := OpenDialog1.FileName;
end;

procedure TForm1.buttonStartClick(Sender: TObject);
var
   slFile: TStringList;
   slLine: TStringList;
   slFiltered: TStringList;
   dwTick: DWORD;
   i: Integer;
   cnt: Integer;
   nColumnCount: Integer;
   list: TDictionary<string, string>;
   key: string;
   strFiltered: string;
   strExt: string;
   nDateCompare: Integer;
   nDxCompare: Integer;
begin
   slFile := TStringList.Create();
   slLine := TStringList.Create();
   slLine.StrictDelimiter := True;
   slFiltered := TStringList.Create();
   list := TDictionary<string, string>.Create();
   Memo1.Lines.Add('èàóùäJén');
   try
      dwTick := GetTickCount();

      if checkDateCompare13.checked = True then begin
         nDateCompare := 13;
      end
      else begin
         nDateCompare := 16;
      end;

      if radioDxPfx.Checked = True then begin
         nDxCompare := 6;
      end
      else begin
         nDxCompare := 7;
      end;

      strExt := ExtractFileExt(editFileName.Text);
      strFiltered := ExtractFilePath(editFileName.Text) + ExtractFileName(editFileName.Text);
      strFiltered := StringReplace(strFiltered, strExt, '', [rfReplaceAll]);
      strFiltered := strFiltered + '_filtered' + strExt;

      slFile.LoadFromFile(editFileName.Text);

      dwTick := GetTickCount() - dwTick;
      Memo1.Lines.Add('Loading time = ' + IntToStr(dwTick) + ' ms');
      Memo1.Lines.Add(IntToStr(slFile.Count) + ' lines');

      nColumnCount := 0;
      for i := 0 to slFile.Count - 1 do begin
         slLine.CommaText := Trim(slFile[i]);

         if i = 0 then begin
            nColumnCount := slLine.Count;
            slFiltered.Add(slLine.CommaText);
         end
         else begin
            if slLine.Count <> nColumnCount then begin
               Continue;
            end;

            // 0        1      2       3    4    5  6      7       8    9  10   11    12
            // callsign,de_pfx,de_cont,freq,band,dx,dx_pfx,dx_cont,mode,db,date,speed,tx_mode

            // 1234567890123456
            // 2023-11-25 00:00:00
            key := slLine[5] + slLine[4] + slLine[nDxCompare] + Copy(slLine[10], 1, nDateCompare);

            if list.ContainsKey(key) = False then begin
               list.Add(key, slLine.CommaText);
               slFiltered.Add(slLine.CommaText);
               Inc(cnt);
            end;
         end;
      end;

      slFiltered.SaveToFile(strFiltered);
      Memo1.Lines.Add(IntToStr(cnt) + ' records');
   finally
      slFile.Free();
      slLine.Free();
      slFiltered.Free();
      list.Free();
      Memo1.Lines.Add('èàóùèIóπ');
   end;
end;

constructor TRbnList.Create(OwnsObjects: Boolean);
begin
   Inherited;
end;

destructor TRbnList.Destroy();
begin
   //
end;

end.
