{******************************************************************************}
{* DCPcrypt v2.0 written by David Barton (davebarton@bigfoot.com) *************}
{******************************************************************************}
{* Main component definitions *************************************************}
{******************************************************************************}
{* Copyright (c) 1999-2000 David Barton                                       *}
{* Permission is hereby granted, free of charge, to any person obtaining a    *}
{* copy of this software and associated documentation files (the "Software"), *}
{* to deal in the Software without restriction, including without limitation  *}
{* the rights to use, copy, modify, merge, publish, distribute, sublicense,   *}
{* and/or sell copies of the Software, and to permit persons to whom the      *}
{* Software is furnished to do so, subject to the following conditions:       *}
{*                                                                            *}
{* The above copyright notice and this permission notice shall be included in *}
{* all copies or substantial portions of the Software.                        *}
{*                                                                            *}
{* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR *}
{* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,   *}
{* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL    *}
{* THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER *}
{* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING    *}
{* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER        *}
{* DEALINGS IN THE SOFTWARE.                                                  *}
{******************************************************************************}
unit DCPcrypttiss;

interface
uses
  Classes, Sysutils, DCPconsttiss, Base64tiss;



{******************************************************************************}
    { A few predefined types to help out }

type
  Pbyte= ^byte;
  Pword= ^word;
  Pdword= ^dword;
{$IFDEF VER130} { Delphi 5 }
  dword= longword;
{$ELSE}
  {$IFDEF VER120} { Delphi 4 }
  dword= longword;
  {$ELSE}
    {$IFDEF VER125} { C++ Builder 4 }
  dword= longword;
    {$ELSE}
  dword= longint;
    {$ENDIF}
  {$ENDIF}
{$ENDIF}
{$IFDEF FPK}
  Pbytearray= ^Tbytearray;
  Tbytearray= array[0..32767] of byte;
{$ENDIF}
  Pwordarray= ^Twordarray;
  Twordarray= array[0..19383] of word;
  Pdwordarray= ^Tdwordarray;
  Tdwordarray= array[0..8191] of dword;



{******************************************************************************}
    { The base class from which all encryption components will be derived. }
    { Stream ciphers will be derived directly from this class where as     }
    { Block ciphers will have a further foundation class TDCP_blockciphertiss. }

type
  EDCP_ciphertiss= class(Exception);
  TDCP_ciphertiss= class(TComponent)
  protected
    fInitialized: boolean;  { Whether or not the key setup has been done yet }

    procedure DeadInt(Value: longint);   { Knudge to display vars in the object inspector   }
    procedure DeadStr(Value: string);    { Knudge to display vars in the object inspector   }

  public
    property Initialized: boolean
      read fInitialized;

    class function GetId: longint; virtual; abstract;
      { Get the algorithm id }
    class function GetAlgorithm: string; virtual; abstract;
      { Get the algorithm name }
    class function GetMaxKeySize: longint; virtual; abstract;
      { Get the maximum key size (in bits) }
    class function SelfTest: boolean; virtual; abstract;
      { Tests the implementation with several test vectors }

    procedure Init(const Key; Size: longint; InitVector: pointer); virtual;
      { Do key setup based on the data in Key, size is in bits }
    procedure InitStr(const Key: string);
      { Do key setup based on a hash of the key string }
    procedure Burn; virtual;
      { Clear all stored key information }
    procedure Reset; virtual; abstract;
      { Reset any stored chaining information }
    procedure Encrypt(const Indata; var Outdata; Size: longint); virtual; abstract;
      { Encrypt size bytes of data and place in Outdata }
    procedure Decrypt(const Indata; var Outdata; Size: longint); virtual; abstract;
      { Decrypt size bytes of data and place in Outdata }
    function EncryptStream(InStream, OutStream: TStream; Size: longint): longint;
      { Encrypt size bytes of data from InStream and place in OutStream }
    function DecryptStream(InStream, OutStream: TStream; Size: longint): longint;
      { Decrypt size bytes of data from InStream and place in OutStream }
    function EncryptString(const Str: string): string; virtual;
      { Encrypt a string and return Base64 encoded }
    function DecryptString(const Str: string): string; virtual;
      { Decrypt a Base64 encoded string }

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  published
    property Id: longint
      read GetId write DeadInt;
    property Algorithm: string
      read GetAlgorithm write DeadStr;
    property MaxKeySize: longint
      read GetMaxKeySize write DeadInt;
  end;
  TDCP_ciphertissclass= class of TDCP_ciphertiss;



{******************************************************************************}
    { The base class from which all block ciphers are to be derived, this  }
    { extra class takes care of the different block encryption modes.      }

type
  TDCP_ciphertissmodetiss= (cmCBC, cmCFB8bit, cmCFBblock, cmOFB); // cmCFB8bit is equal to DCPcrypt v1.xx's CFB mode
  EDCP_blockciphertiss= class(EDCP_ciphertiss);
  TDCP_blockciphertiss= class(TDCP_ciphertiss)
  protected
    fCipherMode: TDCP_ciphertissmodetiss;  { The cipher mode the encrypt method uses  }
    IV, Chain, Temp: Pbytearray;   { Storage for the chaining information     }
    BS: longint;                   { The block size in bytes for internal use }

  public
    class function GetBlockSize: longint; virtual; abstract;
      { Get the block size of the cipher (in bits) }

    procedure Reset; override;
      { Reset any stored chaining information }
    procedure Burn; override;
      { Clear all stored key information and chaining information }
    procedure SetIV(const Value);
      { Sets the IV to Value and performs a reset }
    procedure GetIV(var Value);
      { Returns the current chaining information, not the actual IV }

    procedure Encrypt(const Indata; var Outdata; Size: longint); override;
      { Encrypt size bytes of data and place in Outdata using CipherMode }
    procedure Decrypt(const Indata; var Outdata; Size: longint); override;
      { Decrypt size bytes of data and place in Outdata using CipherMode }
    function EncryptString(const Str: string): string; override;
      { Encrypt a string and return Base64 encoded }
    function DecryptString(const Str: string): string; override;
      { Decrypt a Base64 encoded string }
    procedure EncryptECB(const Indata; var Outdata); virtual; abstract;
      { Encrypt a block of data using the ECB method of encryption }
    procedure DecryptECB(const Indata; var Outdata); virtual; abstract;
      { Decrypt a block of data using the ECB method of decryption }
    procedure EncryptCBC(const Indata; var Outdata; Size: longint);
      { Encrypt size bytes of data using the CBC method of encryption }
    procedure DecryptCBC(const Indata; var Outdata; Size: longint);
      { Decrypt size bytes of data using the CBC method of decryption }
    procedure EncryptCFB8bit(const Indata; var Outdata; Size: longint);
      { Encrypt size bytes of data using the CFB (8 bit) method of encryption }
    procedure DecryptCFB8bit(const Indata; var Outdata; Size: longint);
      { Decrypt size bytes of data using the CFB (8 bit) method of decryption }
    procedure EncryptCFBblock(const Indata; var Outdata; Size: longint);
      { Encrypt size bytes of data using the CFB (block) method of encryption }
    procedure DecryptCFBblock(const Indata; var Outdata; Size: longint);
      { Decrypt size bytes of data using the CFB (block) method of decryption }
    procedure EncryptOFB(const Indata; var Outdata; Size: longint);
      { Encrypt size bytes of data using the OFB method of encryption }
    procedure DecryptOFB(const Indata; var Outdata; Size: longint);
      { Decrypt size bytes of data using the OFB method of decryption }

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  published
    property BlockSize: longint
      read GetBlockSize write DeadInt;
    property CipherMode: TDCP_ciphertissmodetiss
      read fCipherMode write fCipherMode default cmCBC;
  end;
  TDCP_blockciphertissclass= class of TDCP_blockciphertiss;



{******************************************************************************}
    { The base class from which all hash algorithms are to be derived  }

type
  EDCP_hash= class(Exception);
  TDCP_hashtiss= class(TComponent)
  protected
    fInitialized: boolean;  { Whether or not the algorithm has been initialized }

    procedure DeadInt(Value: longint);   { Knudge to display vars in the object inspector   }
    procedure DeadStr(Value: string);    { Knudge to display vars in the object inspector   }

  public
    property Initialized: boolean
      read fInitialized;

    class function GetId: longint; virtual; abstract;
      { Get the algorithm id }
    class function GetAlgorithm: string; virtual; abstract;
      { Get the algorithm name }
    class function GetHashSize: longint; virtual; abstract;
      { Get the size of the digest produced - in bits }
    class function SelfTest: boolean; virtual; abstract;
      { Tests the implementation with several test vectors }

    procedure Init; virtual; abstract;
      { Initialize the hash algorithm }
    procedure Final(var Digest); virtual; abstract;
      { Create the final digest and clear the stored information.
        The size of the Digest var must be at least equal to the hash size }
    procedure Burn; virtual; abstract;
      { Clear any stored information with out creating the final digest }

    procedure Update(const Buffer; Size: longint); virtual; abstract;
      { Update the hash buffer with Size bytes of data from Buffer }
    procedure UpdateStream(Stream: TStream; Size: longint);
      { Update the hash buffer with Size bytes of data from the stream }
    procedure UpdateStr(const Str: string);
      { Update the hash buffer with the string }

    destructor Destroy; override;

  published
    property Id: longint
      read GetId write DeadInt;
    property Algorithm: string
      read GetAlgorithm write DeadStr;
    property HashSize: longint
      read GetHashSize write DeadInt;
  end;
  TDCP_hashtissclass= class of TDCP_hashtiss;



{******************************************************************************}
type
{ Since relatively few algorithms we can use an unordered linked list }
  PDCP_cipherinfo= ^TDCP_ciphertissinfo;
  TDCP_ciphertissinfo= record
    Next: PDCP_cipherinfo;
    Name: string;
    Id: longint;
    Cipher: TDCP_ciphertissclass;
    Block: boolean;
  end;
  PDCP_hashinfo= ^TDCP_hashtissinfo;
  TDCP_hashtissinfo= record
    Next: PDCP_hashinfo;
    Name: string;
    Id: longint;
    Hash: TDCP_hashtissclass;
  end;
var
  DCPcipherlist: PDCP_cipherinfo;
  DCPhashlist: PDCP_hashinfo;

function DCPcipherfromname(const Value: string; AOwner: TComponent): TDCP_ciphertiss;
  { Create a cipher from the name supplied }
function DCPcipherfromid(Value: longint; AOwner: TComponent): TDCP_ciphertiss;
  { Create a cipher from the id number supplied }
function DCPhashfromname(const Value: string; AOwner: TComponent): TDCP_hashtiss;
  { Create a hash from the name supplied }
function DCPhashfromid(Value: longint; AOwner: TComponent): TDCP_hashtiss;
  { Create a hash from the id number supplied }

{******************************************************************************}
procedure DCPregcipher(Cipher: TDCP_ciphertissclass; Block: boolean);
  { Register a cipher with DCPcrypt }
procedure DCPreghash(Hash: TDCP_hashtissclass);
  { Register a hash with DCPcrypt }

procedure XorBlock(var InData1, InData2; Size: longint);
  { Xor two blocks of data together and place the result in Indata1 }
function CompareMemory(X1, X2: PByteArray; Size: longint): boolean;
  { Compare the data at X1 with the data at X2 }
function SwapDWord(X: dword): dword;
  { Swaps the byte order of a dword }
function LRot16(X: Word; c: longint): Word;
  { Left rotate a 16bit word }
function RRot16(X: Word; c: longint): Word;
  { Right rotate a 16bit word }
function LRot32(X: DWord; c: longint): DWord;
  { Left rotate a 32bit word }
function RRot32(X: DWord; c: longint): DWord;
  { Right rotate a 32bit word }



{******************************************************************************}
{******************************************************************************}
implementation
uses
  SHA1tiss;  { Use SHA1 for hashing the keystring in TDCP_ciphertiss.InitStr }
         { Remember the bit in the initialization below for SHA1 }


{** TDCP_ciphertiss ***************************************************************}

procedure TDCP_ciphertiss.DeadInt(Value: longint);
begin
end;

procedure TDCP_ciphertiss.DeadStr(Value: string);
begin
end;

procedure TDCP_ciphertiss.Init(const Key; Size: longint; InitVector: pointer);
begin
  if fInitialized then
    Burn;
  if (Size <= 0) or ((Size and 3)<> 0) or (Size> GetMaxKeySize) then
    raise Exception.Create('Invalid key size')
  else
    fInitialized:= true;
end;

procedure TDCP_ciphertiss.InitStr(const Key: string);
var
  Hash: TDCP_sha1tiss;
  Digest: array[0..19] of byte;  { SHA1 produces a 20byte digest }
begin
  if fInitialized then
    Burn;
  Hash:= TDCP_sha1tiss.Create(Self);
  Hash.Init;
  Hash.UpdateStr(Key);
  Hash.Final(Digest);
  Hash.Free;
  if MaxKeySize< 160 then
    Init(Digest,MaxKeySize,nil)
  else
    Init(Digest,160,nil);
  FillChar(Digest,Sizeof(Digest),$FF);
end;

procedure TDCP_ciphertiss.Burn;
begin
  fInitialized:= false;
end;

function TDCP_ciphertiss.EncryptStream(InStream, OutStream: TStream; Size: longint): longint;
var
  Buffer: array[0..8191] of byte;
  i, Read: longint;
begin
  Result:= 0;
  for i:= 1 to (Size div Sizeof(Buffer)) do
  begin
    Read:= InStream.Read(Buffer,Sizeof(Buffer));
    Inc(Result,Read);
    Encrypt(Buffer,Buffer,Read);
    OutStream.Write(Buffer,Read);
  end;
  if (Size mod Sizeof(Buffer))<> 0 then
  begin
    Read:= InStream.Read(Buffer,Size mod Sizeof(Buffer));
    Inc(Result,Read);
    Encrypt(Buffer,Buffer,Read);
    OutStream.Write(Buffer,Read);
  end;
end;

function TDCP_ciphertiss.DecryptStream(InStream, OutStream: TStream; Size: longint): longint;
var
  Buffer: array[0..8191] of byte;
  i, Read: longint;
begin
  Result:= 0;
  for i:= 1 to (Size div Sizeof(Buffer)) do
  begin
    Read:= InStream.Read(Buffer,Sizeof(Buffer));
    Inc(Result,Read);
    Decrypt(Buffer,Buffer,Read);
    OutStream.Write(Buffer,Read);
  end;
  if (Size mod Sizeof(Buffer))<> 0 then
  begin
    Read:= InStream.Read(Buffer,Size mod Sizeof(Buffer));
    Inc(Result,Read);
    Decrypt(Buffer,Buffer,Read);
    OutStream.Write(Buffer,Read);
  end;
end;

function TDCP_ciphertiss.EncryptString(const Str: string): string;
begin
  SetLength(Result,Length(Str));
  Encrypt(Str[1],Result[1],Length(Str));
  Result:= Base64EncodeStr(Result);
end;

function TDCP_ciphertiss.DecryptString(const Str: string): string;
begin
  Result:= Base64DecodeStr(Str);
  Decrypt(Result[1],Result[1],Length(Result));
end;

constructor TDCP_ciphertiss.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Burn;
end;

destructor TDCP_ciphertiss.Destroy;
begin
  if fInitialized then
    Burn;
  inherited Destroy;
end;



{** TDCP_blockciphertiss **********************************************************}

procedure TDCP_blockciphertiss.Reset;
begin
  if not fInitialized then
    raise EDCP_blockciphertiss.Create('Cipher not initialized')
  else
    Move(IV^,Chain^,BS);
end;

procedure TDCP_blockciphertiss.Burn;
begin
  if IV<> nil then
  begin
    FillChar(IV^,BS,$FF);
    FillChar(Chain^,BS,$FF);
    FillChar(Temp^,BS,$FF);
  end;
  inherited Burn;
end;

procedure TDCP_blockciphertiss.SetIV(const Value);
begin
  if not fInitialized then
    raise EDCP_blockciphertiss.Create('Cipher not initialized');
  Move(Value,IV^,BS);
  Reset;
end;

procedure TDCP_blockciphertiss.GetIV(var Value);
begin
  if not fInitialized then
    raise EDCP_blockciphertiss.Create('Cipher not initialized');
  Move(Chain^,Value,BS);
end;

procedure TDCP_blockciphertiss.Encrypt(const Indata; var Outdata; Size: longint);
begin
  case fCipherMode of
    cmCBC: EncryptCBC(Indata,Outdata,Size);
    cmCFB8bit: EncryptCFB8bit(Indata,Outdata,Size);
    cmCFBblock: EncryptCFBblock(Indata,Outdata,Size);
    cmOFB: EncryptOFB(Indata,Outdata,Size);
  end;
end;

function TDCP_blockciphertiss.EncryptString(const Str: string): string;
begin
  SetLength(Result,Length(Str));
  EncryptCFB8bit(Str[1],Result[1],Length(Str));
  Result:= Base64EncodeStr(Result);
end;

function TDCP_blockciphertiss.DecryptString(const Str: string): string;
begin
  Result:= Base64DecodeStr(Str);
  DecryptCFB8bit(Result[1],Result[1],Length(Result));
end;

procedure TDCP_blockciphertiss.Decrypt(const Indata; var Outdata; Size: longint);
begin
  case fCipherMode of
    cmCBC: DecryptCBC(Indata,Outdata,Size);
    cmCFB8bit: DecryptCFB8bit(Indata,Outdata,Size);
    cmCFBblock: DecryptCFBblock(Indata,Outdata,Size);
    cmOFB: DecryptOFB(Indata,Outdata,Size);
  end;
end;

procedure TDCP_blockciphertiss.EncryptCBC(const Indata; var Outdata; Size: longint);
var
  i: longint;
  p1, p2: pointer;
begin
  if not fInitialized then
    raise EDCP_blockciphertiss.Create('Cipher not initialized');
  p1:= @Indata;
  p2:= @Outdata;
  for i:= 1 to (Size div BS) do
  begin
    Move(p1^,p2^,BS);
    XorBlock(p2^,Chain^,BS);
    EncryptECB(p2^,p2^);
    Move(p2^,Chain^,BS);
    p1:= pointer(longint(p1) + BS);
    p2:= pointer(longint(p2) + BS);
  end;
  if (Size mod BS)<> 0 then
  begin
    EncryptECB(Chain^,Chain^);
    Move(p1^,p2^,Size mod BS);
    XorBlock(p2^,Chain^,Size mod BS);
  end;
end;

procedure TDCP_blockciphertiss.DecryptCBC(const Indata; var Outdata; Size: longint);
var
  i: longint;
  p1, p2: pointer;
begin
  if not fInitialized then
    raise EDCP_blockciphertiss.Create('Cipher not initialized');
  p1:= @Indata;
  p2:= @Outdata;
  for i:= 1 to (Size div BS) do
  begin
    Move(p1^,p2^,BS);
    Move(p1^,Temp^,BS);
    DecryptECB(p2^,p2^);
    XorBlock(p2^,Chain^,BS);
    Move(Temp^,Chain^,BS);
    p1:= pointer(longint(p1) + BS);
    p2:= pointer(longint(p2) + BS);
  end;
  if (Size mod BS)<> 0 then
  begin
    EncryptECB(Chain^,Chain^);
    Move(p1^,p2^,Size mod BS);
    XorBlock(p2^,Chain^,Size mod BS);
  end;
end;

procedure TDCP_blockciphertiss.EncryptCFB8bit(const Indata; var Outdata; Size: longint);
var
  i: longint;
  p1, p2: Pbyte;
begin
  if not fInitialized then
    raise EDCP_blockciphertiss.Create('Cipher not initialized');
  p1:= @Indata;
  p2:= @Outdata;
  for i:= 1 to Size do
  begin
    EncryptECB(Chain^,Temp^);
    p2^:= p1^ xor Pbyte(Temp)^;
    Move(pointer(longint(Chain)+1)^,Chain^,BS-1);
    Pbyte(longint(Chain)+BS-1)^:= p2^;
    Inc(p1);
    Inc(p2);
  end;
end;

procedure TDCP_blockciphertiss.DecryptCFB8bit(const Indata; var Outdata; Size: longint);
var
  i: longint;
  p1, p2: Pbyte;
  TempByte: byte;
begin
  if not fInitialized then
    raise EDCP_blockciphertiss.Create('Cipher not initialized');
  p1:= @Indata;
  p2:= @Outdata;
  for i:= 1 to Size do
  begin
    TempByte:= p1^;
    EncryptECB(Chain^,Temp^);
    p2^:= p1^ xor Pbyte(Temp)^;
    Move(pointer(longint(Chain)+1)^,Chain^,BS-1);
    Pbyte(longint(Chain)+BS-1)^:= TempByte;
    Inc(p1);
    Inc(p2);
  end;
end;

procedure TDCP_blockciphertiss.EncryptCFBblock(const Indata; var Outdata; Size: longint);
var
  i: longint;
  p1, p2: Pbyte;
begin
  if not fInitialized then
    raise EDCP_blockciphertiss.Create('Cipher not initialized');
  p1:= @Indata;
  p2:= @Outdata;
  for i:= 1 to (Size div BS) do
  begin
    EncryptECB(Chain^,Chain^);
    Move(p1^,p2^,BS);
    XorBlock(p2^,Chain^,BS);
    Move(p2^,Chain^,BS);
    p1:= pointer(longint(p1) + BS);
    p2:= pointer(longint(p2) + BS);
  end;
  if (Size mod BS)<> 0 then
  begin
    EncryptECB(Chain^,Chain^);
    Move(p1^,p2^,Size mod BS);
    XorBlock(p2^,Chain^,Size mod BS);
  end;
end;

procedure TDCP_blockciphertiss.DecryptCFBblock(const Indata; var Outdata; Size: longint);
var
  i: longint;
  p1, p2: Pbyte;
begin
  if not fInitialized then
    raise EDCP_blockciphertiss.Create('Cipher not initialized');
  p1:= @Indata;
  p2:= @Outdata;
  for i:= 1 to (Size div BS) do
  begin
    Move(p1^,Temp^,BS);
    EncryptECB(Chain^,Chain^);
    Move(p1^,p2^,BS);
    XorBlock(p2^,Chain^,BS);
    Move(Temp^,Chain^,BS);
    p1:= pointer(longint(p1) + BS);
    p2:= pointer(longint(p2) + BS);
  end;
  if (Size mod BS)<> 0 then
  begin
    EncryptECB(Chain^,Chain^);
    Move(p1^,p2^,Size mod BS);
    XorBlock(p2^,Chain^,Size mod BS);
  end;
end;

procedure TDCP_blockciphertiss.EncryptOFB(const Indata; var Outdata; Size: longint);
var
  i: longint;
  p1, p2: pointer;
begin
  if not fInitialized then
    raise EDCP_blockciphertiss.Create('Cipher not initialized');
  p1:= @Indata;
  p2:= @Outdata;
  for i:= 1 to (Size div BS) do
  begin
    EncryptECB(Chain^,Chain^);
    Move(p1^,p2^,BS);
    XorBlock(p2^,Chain^,BS);
    p1:= pointer(longint(p1) + BS);
    p2:= pointer(longint(p2) + BS);
  end;
  if (Size mod BS)<> 0 then
  begin
    EncryptECB(Chain^,Chain^);
    Move(p1^,p2^,Size mod BS);
    XorBlock(p2^,Chain^,Size mod BS);
  end;
end;

procedure TDCP_blockciphertiss.DecryptOFB(const Indata; var Outdata; Size: longint);
var
  i: longint;
  p1, p2: pointer;
begin
  if not fInitialized then
    raise EDCP_blockciphertiss.Create('Cipher not initialized');
  p1:= @Indata;
  p2:= @Outdata;
  for i:= 1 to (Size div BS) do
  begin
    EncryptECB(Chain^,Chain^);
    Move(p1^,p2^,BS);
    XorBlock(p2^,Chain^,BS);
    p1:= pointer(longint(p1) + BS);
    p2:= pointer(longint(p2) + BS);
  end;
  if (Size mod BS)<> 0 then
  begin
    EncryptECB(Chain^,Chain^);
    Move(p1^,p2^,Size mod BS);
    XorBlock(p2^,Chain^,Size mod BS);
  end;
end;

constructor TDCP_blockciphertiss.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  BS:= GetBlockSize shr 3;
  IV:= nil; Chain:= nil; Temp:= nil;
  try
    GetMem(IV,BS);
    GetMem(Chain,BS);
    GetMem(Temp,BS);
  except
    FreeMem(IV,BS);
    FreeMem(Chain,BS);
    raise EDCP_blockciphertiss.Create('Insufficient memory');
  end;
  fCipherMode:= cmCBC;
end;

destructor TDCP_blockciphertiss.Destroy;
begin
  FreeMem(IV);
  FreeMem(Chain);
  FreeMem(Temp);
  IV:= nil;      { Make sure that burn doesn't try to fillchar freed memory }
  inherited Destroy;
end;



{** TDCP_hashtiss *****************************************************************}

procedure TDCP_hashtiss.DeadInt(Value: longint);
begin
end;

procedure TDCP_hashtiss.DeadStr(Value: string);
begin
end;

procedure TDCP_hashtiss.UpdateStream(Stream: TStream; Size: longint);
var
  Buffer: array[0..8191] of byte;
  i, read: integer;
begin
  for i:= 1 to (Size div Sizeof(Buffer)) do
  begin
    read:= Stream.Read(Buffer,Sizeof(Buffer));
    Update(Buffer,read);
  end;
  if (Size mod Sizeof(Buffer))<> 0 then
  begin
    read:= Stream.Read(Buffer,Size mod Sizeof(Buffer));
    Update(Buffer,read);
  end;
end;

procedure TDCP_hashtiss.UpdateStr(const Str: string);
begin
  Update(Str[1],Length(Str));
end;

destructor TDCP_hashtiss.Destroy;
begin
  if fInitialized then
    Burn;
  inherited Destroy;
end;



{** Helper functions **********************************************************}


function DCPcipherfromname(const Value: string; AOwner: TComponent): TDCP_ciphertiss;
var
  Next: PDCP_cipherinfo;
  CName: string;
begin
  Next:= DCPcipherlist;
  CName:= LowerCase(Value);
  while (Next<> nil) and (Next^.Name<> CName) do
    Next:= Next^.Next;
  if Next<> nil then
    if Next^.Block then  // not sure if this is needed but ....
      Result:= TDCP_ciphertiss(TDCP_blockciphertissclass(Next^.Cipher).Create(AOwner))
    else
      Result:= Next^.Cipher.Create(AOwner)
  else
    Result:= nil;
end;

function DCPcipherfromid(Value: longint; AOwner: TComponent): TDCP_ciphertiss;
var
  Next: PDCP_cipherinfo;
begin
  Next:= DCPcipherlist;
  while (Next<> nil) and (Next^.Id<> Value) do
    Next:= Next^.Next;
  if Next<> nil then
    if Next^.Block then  // not sure if this is needed but ....
      Result:= TDCP_ciphertiss(TDCP_blockciphertissclass(Next^.Cipher).Create(AOwner))
    else
      Result:= Next^.Cipher.Create(AOwner)
  else
    Result:= nil;
end;

function DCPhashfromname(const Value: string; AOwner: TComponent): TDCP_hashtiss;
var
  Next: PDCP_hashinfo;
  HName: string;
begin
  Next:= DCPhashlist;
  HName:= LowerCase(Value);
  while (Next<> nil) and (Next^.Name<> HName) do
    Next:= Next^.Next;
  if Next<> nil then
    Result:= Next^.Hash.Create(AOwner)
  else
    Result:= nil;
end;

function DCPhashfromid(Value: longint; AOwner: TComponent): TDCP_hashtiss;
var
  Next: PDCP_hashinfo;
begin
  Next:= DCPhashlist;
  while (Next<> nil) and (Next^.Id<> Value) do
    Next:= Next^.Next;
  if Next<> nil then
    Result:= Next^.Hash.Create(AOwner)
  else
    Result:= nil;
end;

procedure DCPregcipher(Cipher: TDCP_ciphertissclass; Block: boolean);
var
  NewCipher: PDCP_cipherinfo;
begin
  New(NewCipher);
  NewCipher^.Cipher:= Cipher;
  NewCipher^.Name:= LowerCase(Cipher.GetAlgorithm);
  NewCipher^.Id:= Cipher.GetId;
  NewCipher^.Next:= DCPcipherlist;
  NewCipher^.Block:= Block;
  DCPcipherlist:= NewCipher;
end;

procedure DCPreghash(Hash: TDCP_hashtissclass);
var
  NewHash: PDCP_hashinfo;
begin
  New(NewHash);
  NewHash^.Hash:= Hash;
  NewHash^.Name:= LowerCase(Hash.GetAlgorithm);
  NewHash^.Id:= Hash.GetId;
  NewHash^.Next:= DCPhashlist;
  DCPhashlist:= NewHash;
end;

procedure DCPregfree;
var
  NextCipher: PDCP_cipherinfo;
  NextHash: PDCP_hashinfo;
begin
  while (DCPcipherlist<> nil) do
  begin
    NextCipher:= DCPcipherlist^.Next;
    Dispose(DCPcipherlist);
    DCPcipherlist:= NextCipher;
  end;
  while (DCPhashlist<> nil) do
  begin
    NextHash:= DCPhashlist^.Next;
    Dispose(DCPhashlist);
    DCPhashlist:= NextHash;
  end;
end;


procedure XorBlock(var InData1, InData2; Size: longint);
var
  i: integer;
begin
  for i:= 1 to Size do
    Pbyte(longint(@InData1)+i-1)^:= Pbyte(longint(@InData1)+i-1)^ xor Pbyte(longint(@InData2)+i-1)^;
end;

function CompareMemory(X1, X2: PByteArray; Size: longint): boolean;
var
  i: longint;
begin
  Result:= true;
  for i:= 1 to Size do
    if X1^[i-1]<> X2^[i-1] then
      Result:= false;
end;

function LRot16(X: Word; c: longint): Word;
begin
  LRot16:= (X shl c) or (X shr (16 - c));
end;

function RRot16(X: Word; c: longint): Word;
begin
  RRot16:= (X shr c) or (X shl (16 - c));
end;

function LRot32(X: DWord; c: longint): DWord;
begin
  LRot32:= (X shl c) or (X shr (32 - c));
end;

function RRot32(X: DWord; c: longint): DWord;
begin
  RRot32:= (X shr c) or (X shl (32 - c));
end;

function SwapDWord(X: DWord): DWord;
begin
  Result:= (X shr 24) or ((X shr 8) and $FF00) or ((X shl 8) and $FF0000) or (X shl 24);
end;

initialization
  DCPcipherlist:= nil;
  DCPhashlist:= nil;
  DCPreghash(TDCP_SHA1tiss);  { Change to what ever the default hash algorithm you use is }
                          { If this is not called then the hash algorithm isn't registered as the SHA1 unit registers it self before the list pointer is initialized }

finalization
  DCPregfree;

end.
