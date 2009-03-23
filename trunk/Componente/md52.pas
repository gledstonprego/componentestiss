unit md52;

{------------------------------------------------------------------------------}
{
  Esta classe separa a criacao do hash.
  Como muitos estavam tendo problema, resolvi ver o fonte do tissnet para ver
  como a ANS calculava.
  Estas funcoes fazem o parse no arquivo gerado e pega somente os valores das
  tags. É assim que o tissnet busca a string para geracao do hash.
  A única funcao a ser usada aqui, é a GeraHash que recebe como parâmetro a msg
  gerada e retorna o código hash dela. Dai e so atribuir a tag  da seguinte
  forma:
   Ex:
     Msg.Epilogo.Hash := TMD5.GeraHash(Msg.OwnerDocument);

   Tambem tem funcao para verificacao do hash. Vai servir para quando a operadora
   ou prestador receber uma mensagem. Lembrem-se que nenhuma das pontas envia
   a mensagem necessariamente pelo tissnet, o qual faz a validacao.
   Para chamar a funcao, faca assim:
   Ex:
     if TMD5.isHashOK(Msg.OwnerDocument) then
}
{------------------------------------------------------------------------------}

interface

uses Windows, SysUtils, XMLDoc, XMLIntf;

type
  TMD5 = class(TObject)
  private
    function MD5Hash(Buffer: string): string;
    function obterCabecalho(Root: IXMLNode): IXMLNode;
    function obterCorpo(Root: IXMLNode): IXMLNode;
    function obterSubNode(pNode: IXMLNode; NodeName: string): IXMLNode;
    function obterAtributosConcatenados(Node: IXMLNode): string;
    function obterEpilogo(XMLDoc: IXMLDocument): String;
  public
    class function GeraHash(XMLDoc: IXMLDocument): string;
    class function isHashOK(XMLDoc: IXMLDocument): boolean;
  end;

implementation

uses Md5tiss, U_Ciphertiss;

{ TMD5 }

class function TMD5.GeraHash(XMLDoc: IXMLDocument): string;
var
  S: string;
  Classe: TMD5;
begin
  try
    Classe := TMD5.Create;
    S := Classe.obterAtributosConcatenados(Classe.obterCabecalho(XMLDoc.DocumentElement)) +
      Classe.obterAtributosConcatenados(Classe.obterCorpo(XMLDoc.DocumentElement));

    Result := Classe.MD5Hash(S);
  finally
    Classe.Free;
  end;
end;

class function TMD5.isHashOK(XMLDoc: IXMLDocument): boolean;
Var
  HashOK,
  HashMsg: String;
  Valor: Boolean;
  Md5: TMD5;
begin
  try
    HashOk := TMD5.GeraHash(XmlDoc);
    Md5:= TMd5.Create;
    HashMsg := Md5.obterEpilogo(XMLDoc);
    Valor := HashOK = HashMsg;
  finally
    Md5.Free;
    Result := Valor;
  end;
end;

// Hash usando algoritmo MD5 com o componente DcpCrypt - http://www.cityinthesky.co.uk/
function TMD5.MD5Hash(Buffer: string): string;
var
  MD5_Hash: TDCP_MD5tiss;
  Hash: array[0..15] of byte; //31
  Temp: string;
  f: Byte;
begin
  for f := 0 to 15 do
    Hash[f] := 0;

  Buffer := Trim(Buffer);

  MD5_Hash := TDCP_MD5tiss.Create(nil);
  MD5_Hash.Init;
  MD5_Hash.UpdateStr(Buffer);
  MD5_Hash.Final(Hash);

  for f := 0 to 15 do
    Temp := Temp + IntToHex(Hash[f], 2);

  Result := Copy(Temp, 1, 32);

  MD5_Hash.Burn;
  MD5_Hash.Free;
end;

function TMD5.obterAtributosConcatenados(Node: IXMLNode): string;
var
  S: string;
  I: Integer;
  ChildNode: IXMLNode;
  NodeList: IXMLNodeList;
begin
  if Node.HasChildNodes then
  begin
    NodeList := Node.ChildNodes;
    for I := 0 to NodeList.Count - 1 do
    begin
      ChildNode := NodeList.Nodes[I];
      S := S + obterAtributosConcatenados(ChildNode);
    end;
  end
  else
    S := Trim(Node.Text);
  Result := S;
end;

function TMD5.obterCabecalho(Root: IXMLNode): IXMLNode;
begin
  Result := obterSubNode(Root, 'cabecalho');
end;

function TMD5.obterCorpo(Root: IXMLNode): IXMLNode;
var
  Node: IXMLNode;
begin
  Node := obterSubNode(Root, 'operadoraParaPrestador');
  if (Node = nil) then
    Node := obterSubNode(Root, 'prestadorParaOperadora');
  Result := Node;
end;

function TMD5.obterEpilogo(XMLDoc: IXMLDocument): String;
Var
  Node: IXMLNode;
begin
  Node := obterSubNode(XmlDoc.DocumentElement, 'epilogo');
  Result := Node.ChildNodes['hash'].Text;
end;

function TMD5.obterSubNode(pNode: IXMLNode; NodeName: string): IXMLNode;
var
  Node: IXMLNode;
  I: Integer;
begin
  try
    for I := 0 to pNode.ChildNodes.Count - 1 do
    begin
      Node := pNode.ChildNodes.Nodes[I];
      try
        if (Node.LocalName = NodeName) then
          break;
      except
      end;
    end;
    if (Node.LocalName = NodeName) then
      Result := Node
    else
      Result := nil;
  except
    Result := nil;
  end;
end;

end.
