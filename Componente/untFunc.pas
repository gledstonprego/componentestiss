unit untFunc;

interface
uses
  Forms, Classes, SysUtils, {SOAPFuncs,} InvokeRegistry, ComObj,Windows;

type
	MD5Count = array[0..1] of DWORD;
	MD5State = array[0..3] of DWORD;
	MD5Block = array[0..15] of DWORD;
	MD5CBits = array[0..7] of byte;
	MD5Digest = array[0..15] of byte;
	MD5Buffer = array[0..63] of byte;
	MD5Context = record
		State: MD5State;
		Count: MD5Count;
		Buffer: MD5Buffer;
	end;

function MD5Print(D: MD5Digest): string;
function CleanXML(xml: String): String;
function CalcHASH(xml: String): String;
function fileValidate(_file: String;xsd: string; const tiss_version: String = '2_01_02'): String;
function MD5String(M: string): MD5Digest;

procedure MD5Init(var Context: MD5Context);
procedure MD5Final(var Context: MD5Context; var Digest: MD5Digest);
procedure MD5Update(var Context: MD5Context; Input: pChar; Length: longword);
procedure Transform(Buffer: pointer; var State: MD5State);
procedure Encode(Source, Target: pointer; Count: longword);
procedure FF(var a: DWORD; b, c, d, x: DWORD; s: BYTE; ac: DWORD);

implementation
var
	PADDING: MD5Buffer = (
		$80, $00, $00, $00, $00, $00, $00, $00,
		$00, $00, $00, $00, $00, $00, $00, $00,
		$00, $00, $00, $00, $00, $00, $00, $00,
		$00, $00, $00, $00, $00, $00, $00, $00,
		$00, $00, $00, $00, $00, $00, $00, $00,
		$00, $00, $00, $00, $00, $00, $00, $00,
		$00, $00, $00, $00, $00, $00, $00, $00,
		$00, $00, $00, $00, $00, $00, $00, $00
	);

procedure Encode(Source, Target: pointer; Count: longword);
var
	S: PByte;
	T: PDWORD;
	I: longword;
begin
	S := Source;
	T := Target;
	for I := 1 to Count div 4 do begin
		T^ := S^;
		inc(S);
		T^ := T^ or (S^ shl 8);
		inc(S);
		T^ := T^ or (S^ shl 16);
		inc(S);
		T^ := T^ or (S^ shl 24);
		inc(S);
		inc(T);
	end;
end;

function F(x, y, z: DWORD): DWORD;
begin
	Result := (x and y) or ((not x) and z);
end;

function G(x, y, z: DWORD): DWORD;
begin
	Result := (x and z) or (y and (not z));
end;

function H(x, y, z: DWORD): DWORD;
begin
	Result := x xor y xor z;
end;

function I(x, y, z: DWORD): DWORD;
begin
	Result := y xor (x or (not z));
end;

procedure rot(var x: DWORD; n: BYTE);
begin
	x := (x shl n) or (x shr (32 - n));
end;

procedure FF(var a: DWORD; b, c, d, x: DWORD; s: BYTE; ac: DWORD);
begin
	inc(a, F(b, c, d) + x + ac);
	rot(a, s);
	inc(a, b);
end;

procedure GG(var a: DWORD; b, c, d, x: DWORD; s: BYTE; ac: DWORD);
begin
	inc(a, G(b, c, d) + x + ac);
	rot(a, s);
	inc(a, b);
end;

procedure HH(var a: DWORD; b, c, d, x: DWORD; s: BYTE; ac: DWORD);
begin
	inc(a, H(b, c, d) + x + ac);
	rot(a, s);
	inc(a, b);
end;

procedure II(var a: DWORD; b, c, d, x: DWORD; s: BYTE; ac: DWORD);
begin
	inc(a, I(b, c, d) + x + ac);
	rot(a, s);
	inc(a, b);
end;


procedure Transform(Buffer: pointer; var State: MD5State);
var
	a, b, c, d: DWORD;
	Block: MD5Block;
begin
	Encode(Buffer, @Block, 64);
	a := State[0];
	b := State[1];
	c := State[2];
	d := State[3];
	FF (a, b, c, d, Block[ 0],  7, $d76aa478);
	FF (d, a, b, c, Block[ 1], 12, $e8c7b756);
	FF (c, d, a, b, Block[ 2], 17, $242070db);
	FF (b, c, d, a, Block[ 3], 22, $c1bdceee);
	FF (a, b, c, d, Block[ 4],  7, $f57c0faf);
	FF (d, a, b, c, Block[ 5], 12, $4787c62a);
	FF (c, d, a, b, Block[ 6], 17, $a8304613);
	FF (b, c, d, a, Block[ 7], 22, $fd469501);
	FF (a, b, c, d, Block[ 8],  7, $698098d8);
	FF (d, a, b, c, Block[ 9], 12, $8b44f7af);
	FF (c, d, a, b, Block[10], 17, $ffff5bb1);
	FF (b, c, d, a, Block[11], 22, $895cd7be);
	FF (a, b, c, d, Block[12],  7, $6b901122);
	FF (d, a, b, c, Block[13], 12, $fd987193);
	FF (c, d, a, b, Block[14], 17, $a679438e);
	FF (b, c, d, a, Block[15], 22, $49b40821);
	GG (a, b, c, d, Block[ 1],  5, $f61e2562);
	GG (d, a, b, c, Block[ 6],  9, $c040b340);
	GG (c, d, a, b, Block[11], 14, $265e5a51);
	GG (b, c, d, a, Block[ 0], 20, $e9b6c7aa);
	GG (a, b, c, d, Block[ 5],  5, $d62f105d);
	GG (d, a, b, c, Block[10],  9,  $2441453);
	GG (c, d, a, b, Block[15], 14, $d8a1e681);
	GG (b, c, d, a, Block[ 4], 20, $e7d3fbc8);
	GG (a, b, c, d, Block[ 9],  5, $21e1cde6);
	GG (d, a, b, c, Block[14],  9, $c33707d6);
	GG (c, d, a, b, Block[ 3], 14, $f4d50d87);
	GG (b, c, d, a, Block[ 8], 20, $455a14ed);
	GG (a, b, c, d, Block[13],  5, $a9e3e905);
	GG (d, a, b, c, Block[ 2],  9, $fcefa3f8);
	GG (c, d, a, b, Block[ 7], 14, $676f02d9);
	GG (b, c, d, a, Block[12], 20, $8d2a4c8a);
	HH (a, b, c, d, Block[ 5],  4, $fffa3942);
	HH (d, a, b, c, Block[ 8], 11, $8771f681);
	HH (c, d, a, b, Block[11], 16, $6d9d6122);
	HH (b, c, d, a, Block[14], 23, $fde5380c);
	HH (a, b, c, d, Block[ 1],  4, $a4beea44);
	HH (d, a, b, c, Block[ 4], 11, $4bdecfa9);
	HH (c, d, a, b, Block[ 7], 16, $f6bb4b60);
	HH (b, c, d, a, Block[10], 23, $bebfbc70);
	HH (a, b, c, d, Block[13],  4, $289b7ec6);
	HH (d, a, b, c, Block[ 0], 11, $eaa127fa);
	HH (c, d, a, b, Block[ 3], 16, $d4ef3085);
	HH (b, c, d, a, Block[ 6], 23,  $4881d05);
	HH (a, b, c, d, Block[ 9],  4, $d9d4d039);
	HH (d, a, b, c, Block[12], 11, $e6db99e5);
	HH (c, d, a, b, Block[15], 16, $1fa27cf8);
	HH (b, c, d, a, Block[ 2], 23, $c4ac5665);
	II (a, b, c, d, Block[ 0],  6, $f4292244);
	II (d, a, b, c, Block[ 7], 10, $432aff97);
	II (c, d, a, b, Block[14], 15, $ab9423a7);
	II (b, c, d, a, Block[ 5], 21, $fc93a039);
	II (a, b, c, d, Block[12],  6, $655b59c3);
	II (d, a, b, c, Block[ 3], 10, $8f0ccc92);
	II (c, d, a, b, Block[10], 15, $ffeff47d);
	II (b, c, d, a, Block[ 1], 21, $85845dd1);
	II (a, b, c, d, Block[ 8],  6, $6fa87e4f);
	II (d, a, b, c, Block[15], 10, $fe2ce6e0);
	II (c, d, a, b, Block[ 6], 15, $a3014314);
	II (b, c, d, a, Block[13], 21, $4e0811a1);
	II (a, b, c, d, Block[ 4],  6, $f7537e82);
	II (d, a, b, c, Block[11], 10, $bd3af235);
	II (c, d, a, b, Block[ 2], 15, $2ad7d2bb);
	II (b, c, d, a, Block[ 9], 21, $eb86d391);
	inc(State[0], a);
	inc(State[1], b);
	inc(State[2], c);
	inc(State[3], d);
end;

procedure MD5Update(var Context: MD5Context; Input: pChar; Length: longword);
var
	Index: longword;
	PartLen: longword;
	I: longword;
begin
	with Context do begin
		Index := (Count[0] shr 3) and $3f;
		inc(Count[0], Length shl 3);
		if Count[0] < (Length shl 3) then inc(Count[1]);
		inc(Count[1], Length shr 29);
	end;
	PartLen := 64 - Index;
	if Length >= PartLen then begin
		CopyMemory(@Context.Buffer[Index], Input, PartLen);
		Transform(@Context.Buffer, Context.State);
		I := PartLen;
		while I + 63 < Length do begin
			Transform(@Input[I], Context.State);
			inc(I, 64);
		end;
		Index := 0;
	end else I := 0;
	CopyMemory(@Context.Buffer[Index], @Input[I], Length - I);
end;
procedure Decode(Source, Target: pointer; Count: longword);
var
	S: PDWORD;
	T: PByte;
	I: longword;
begin
	S := Source;
	T := Target;
	for I := 1 to Count do begin
		T^ := S^ and $ff;
		inc(T);
		T^ := (S^ shr 8) and $ff;
		inc(T);
		T^ := (S^ shr 16) and $ff;
		inc(T);
		T^ := (S^ shr 24) and $ff;
		inc(T);
		inc(S);
	end;
end;
// Finalize given Context, create Digest and zeroize Context
procedure MD5Final(var Context: MD5Context; var Digest: MD5Digest);
var
	Bits: MD5CBits;
	Index: longword;
	PadLen: longword;
begin
	Decode(@Context.Count, @Bits, 2);
	Index := (Context.Count[0] shr 3) and $3f;
	if Index < 56 then PadLen := 56 - Index else PadLen := 120 - Index;
	MD5Update(Context, @PADDING, PadLen);
	MD5Update(Context, @Bits, 8);
	Decode(@Context.State, @Digest, 4);
	ZeroMemory(@Context, SizeOf(MD5Context));
end;

function MD5Print(D: MD5Digest): string;
var
	I: byte;
const
	Digits: array[0..15] of char =
		('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f');
begin
	Result := '';
	for I := 0 to 15 do Result := Result + Digits[(D[I] shr 4) and $0f] + Digits[D[I] and $0f];
end;

function CleanXML(xml: String): String;
var
  i: Integer;
  lRemove: Boolean;
  lSpace: Boolean;
  cXML: String;
begin
  // variables feed
  lRemove := False;
  lSpace := False;
  cXML := EmptyStr;
  XML := Trim( XML );

  // remove all tags
  for i := 0 to ( Length( XML ) ) do
  begin
    case ( XML[i] ) of
      #13,
      #10,
      #0:
      begin
        continue;
      end;
      '<':
      begin
        cXML := Trim( cXML );
        lSpace := (XML[i + 1] <> '/');
        lRemove := True
      end;
      '>':
      begin
        // remove the HASH code
        if ( Copy( XML, (i - 4), 5) <> 'hash>' ) then
        begin
          lRemove := False;
        end;
        continue;
      end;
    end;

    if (lRemove) then
    begin
      continue;
    end;

    if ( (not lSpace) and (XML[i] = ' ') ) then
    begin
      continue;
    end;

    cXML := cXML + XML[i];
  end;

  // returns the content
  Result := cXML;
end;

procedure MD5Init(var Context: MD5Context);
begin
	with Context do begin
		State[0] := $67452301;
		State[1] := $efcdab89;
		State[2] := $98badcfe;
		State[3] := $10325476;
		Count[0] := 0;
		Count[1] := 0;
		ZeroMemory(@Buffer, SizeOf(MD5Buffer));
	end;
end; 

function MD5String(M: string): MD5Digest;
var
	Context: MD5Context;
begin
	MD5Init(Context);
	MD5Update(Context, pChar(M), length(M));
	MD5Final(Context, Result);
end;

function CalcHASH(xml: String): String;
begin
  Result := MD5Print( MD5String( CleanXML( xml ) ) );
end;

function fileValidate(_file: String;xsd: string; const tiss_version: String = '2_01_02'): String;
const
  MSG_ELEMENTEMPTY_PTBR    = 'Existe um elemento que deveria encapsular outro(s).';
  MSG_ENDTAGNOMATCH1_PTBR  = 'A etiqueta ''';
  MSG_ENDTAGNOMATCH2_PTBR  = ''' não confere com a etiqueta inicial ''';
  MSG_MAXLENGHTFAIL_PTBR   = 'O valor fornecido ultrapassa a quantidade máxima de caracteres.';
  MSG_ENUMERATIONFAIL_PTBR = 'O valor fornecido não está na lista.';
  MSG_PATTERNFAIL_PTBR     = 'Falha no padrão.';
  MSG_ELEMENTCONTIVLD_PTBR = 'O conteúdo do elemento é inválido.';
  MSG_VALUEINVALID1_PTBR   = 'O valor ''';
  MSG_VALUEINVALID2_PTBR   = ''' é inválido de acordo com seu tipo de dados.';
  MSG_THEELEMENT_PTBR      = 'O elemento: ''';
  MSG_HASINVALIDVALUE_PTBR = ''' possui um valor inválido de acordo com o seu tipo de dados.';
  MSG_EXPECTING_PTBR       = 'Deveria existir: ';
  MSG_HASHNOMATCH_PTBR     = 'HASH inválido.'#13#10'Fornecido..:'#13#10'%s'#13#10'Encontrado:'#13#10'%s';
  { ALL RIGHTS RESERVED }
  { ... }
var
  base: String;
  XSDL: Variant;
  XML: Variant;
  msg: String;
  sl: TStringList;
  h1: String;
  h2: String;
begin
  // variables feed
  base := ExtractFilePath( Application.ExeName );
  XSDL := CreateOleObject( 'MSXML2.XMLSchemaCache.4.0' );
  XML := CreateOLEObject( 'MSXML2.DOMDocument.4.0' );

  // load schema
  XSDL.validateOnLoad := True;
  XSDL.add( 'http://www.ans.gov.br/padroes/tiss/schemas', (xsd) );

  // validate
  XML.validateOnParse := True;
  XML.resolveExternals := True;
  XML.schemas := XSDL;
  XML.load( _file );
  //=========================================
  msg := Trim( XML.parseError.reason );
  if ( msg <> EmptyStr ) then
  begin
    if ( msg = 'Element cannot be empty according to the DTD/Schema.' ) then
    begin
      msg := MSG_ELEMENTEMPTY_PTBR;
    end
    else
    if (
      ( Pos( 'End tag ''', msg ) > 0 ) and
      ( Pos( ''' does not match the start tag ''', msg ) > 0 ) and
      ( Pos( '''.', msg ) > 0 )
    ) then
    begin
      msg := StringReplace( msg,
        'End tag ''',
        MSG_ENDTAGNOMATCH1_PTBR,
      []);
      msg := StringReplace( msg,
        ''' does not match the start tag ''',
        MSG_ENDTAGNOMATCH2_PTBR,
      []);
    end
    else
    if ( Pos( 'MaxLength constraint failed.', msg ) > 0 ) then
    begin
      msg := StringReplace( msg,
        'MaxLength constraint failed.',
        MSG_MAXLENGHTFAIL_PTBR,
        []);
    end
    else
    if ( Pos( 'Enumeration constraint failed.', msg ) > 0 ) then
    begin
      msg := StringReplace( msg,
        'Enumeration constraint failed.',
        MSG_ENUMERATIONFAIL_PTBR,
        []);
    end
    else
    if ( Pos( 'Pattern constraint failed.', msg ) > 0 ) then
    begin
      msg := StringReplace( msg,
        'Pattern constraint failed.',
        MSG_PATTERNFAIL_PTBR,
        []);
    end
    else
    if ( Pos( 'Element content is invalid according to the DTD/Schema.', msg ) > 0 ) then
    begin
      msg := StringReplace( msg,
        'Element content is invalid according to the DTD/Schema.',
        MSG_ELEMENTCONTIVLD_PTBR,
        []);
    end
    else
    if (
      ( Pos( 'The value of ''', msg ) > 0 ) and
      ( Pos( ''' is invalid according to its data type.', msg ) > 0 )
    ) then
    begin
      msg := StringReplace( msg,
        'The value of ''',
        MSG_VALUEINVALID1_PTBR,
      []);
      msg := StringReplace( msg,
        ''' is invalid according to its data type.',
        MSG_VALUEINVALID2_PTBR,
      []);
    end;

    { ALL RIGHTS RESERVED }
    { ... }

    // common message
    msg := StringReplace( msg,
      'The element: ''',
      MSG_THEELEMENT_PTBR,
    []);
    msg := StringReplace( msg,
      '''  has an invalid value according to its data type.',
      MSG_HASINVALIDVALUE_PTBR,
    []);
    msg := StringReplace( msg,
      'Expecting: ',
      MSG_EXPECTING_PTBR,
    []);
  end
  else
  //=======================================
  begin
    sl := TStringList.Create();
    try
      sl.LoadFromFile( _file );

      h2 := CalcHASH( sl.Text );

      // extract the HASH code
      sl.Text := Copy( sl.Text, (Pos( 'hash>', sl.Text ) + 5), Length( sl.Text ) );
      sl.Text := Copy( sl.Text, 1, (Pos( '</', sl.Text ) - 1) );
      h1 := Trim( sl.Text );

      if ( h1 <> h2 ) then
      begin
        msg := Format( MSG_HASHNOMATCH_PTBR, [ h1, h2 ] );
      end;
    finally
      sl.Free();
    end;
  end;

  // message return
  Result := msg;
end;

end.
