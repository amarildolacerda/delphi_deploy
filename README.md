# delphi_deploy
Permite compilar utilizando  o  dcc32.exe;

[preparando]
O dcc32 lê o arquivo dcc32.cfg para pegar os parametros configuração. No dcc32.cfg incluir as configurações globais usados;

O dcc32 usa também o ".cfg" do projeto,  <arquivoprojeto>.cfg; Aparentemente as configurações do projeto são adicionada pelas configurações globais que estão no dcc32.cfg;
  
Em alguns caso passei parametros diretamente na linha de comando do dcc32, aparentemente teve efeito de adicionar informação aos ".cfg";
  
  
para ver os parametros aceitos digite:   dcc32 -V  
  
Exemplo de dcc32.cfg  
  <pre>
  -AWinTypes=Windows;WinProcs=Windows;DbiTypes=BDE;DbiProcs=BDE;DbiErrs=BDE;
-NS"Data.Win;Datasnap.Win;Web.Win;Soap.Win;Xml.Win;Bde;Vcl;Vcl.Imaging;Vcl.Touch;Vcl.Samples;Vcl.Shell;System;Xml;Data;Datasnap;Web;Soap;Winapi;Windows;System.Win;VCLTee"
-NO".\dcu"
-LE".\dcu"
-LN".\dcu"
-R"..\jedi\JVCL\resources;"
-I"c:\dconsole\cmp\dcu;c:\dconsole\cmp\bpl"
-U"c:\dconsole\cmp\dcu;c:\dconsole\cmp\bpl"
  </pre>

  onde:
   -A  -> aliases
   -NS -> representa os ... 
   -R -> caminho para os resources
   -I -> caminho para os includes
   -U -> caminho para os codigos fontes
  
  
Exemplo de   <projeto>.cfg
  <pre>
    -B
    -E""
    -D"DEBUG;DEFINES"
    -U"caminhos adicionais (paths)"
    -NO".\dcu"
    -LE".\dcu"
    -LN".\dcu"
  
  
  </pre>
