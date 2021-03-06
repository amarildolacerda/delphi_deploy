        џџ  џџ                  с   H   џџ
 I W _ S T A N D A L O N E _ P R O J E C T       0	        program %s;

uses
  %sIWStart,
  ServerController in 'ServerController.pas' {IWServerController: TIWServerController},%s
  %s in '%s.pas' {%s: TIWFormModuleBase};

{$R *.res}

begin
  TIWStart.Execute(True);
end.
   n   X   џџ
 I W _ S T A N D A L O N E _ P R O J E C T _ D 2 0 1 0 U P       0	        program %s;

uses
  %sIWStart, UTF8ContentParser;

{$R *.res}

begin
  TIWStart.Execute(True);
end.
  У   8   џџ
 I W _ U N I T _ F I L E         0	        unit %s;

interface

uses
  Classes, SysUtils, IWAppForm%s, IWApplication, IWColor, IWTypes;

type
  T%s = class(TIWAppForm%s)
  public
  end;

implementation

{$R %s}

%s
end.
 K   8   џџ
 I W _ F O R M _ F I L E         0	        object %s: T%s
  Left = 0
  Top = 0
  Width = 555
  Height = 400
end
 Ю  P   џџ
 I W _ S E R V E R C O N T R O L L E R _ F I L E         0	        unit ServerController;

interface

uses
  SysUtils, Classes, IWServerControllerBase, IWBaseForm, HTTPApp,
  // For OnNewSession Event
  %sIWApplication, IWAppForm;

type
  TIWServerController = class(TIWServerControllerBase)
    procedure IWServerControllerBaseNewSession(ASession: TIWApplication);
%s
  private
    %s
  public
  end;


  function UserSession: TIWUserSession;
  function IWServerController: TIWServerController;

implementation

{$R %s}

uses
  IWInit, IWGlobal;

function IWServerController: TIWServerController;
begin
  Result := TIWServerController(GServerController);
end;

%s

function UserSession: TIWUserSession;
begin
  Result := TIWUserSession(WebApplication.Data);
end;

procedure TIWServerController.IWServerControllerBaseNewSession(
  ASession: TIWApplication);
begin
  ASession.Data := TIWUserSession.Create(nil);
end;


initialization
  TIWServerController.SetServerControllerClass;

end.

    P   џџ
 I W _ S E R V E R C O N T R O L L E R _ F O R M         0	        object IWServerController: TIWServerController
  OldCreateOrder = False
  AppName = 'MyApp'
  ComInitialization = ciNone
  Description = 'My IntraWeb Application'
  ExceptionDisplayMode = smAlert
  HistoryEnabled = False
  Port = 8888
  SessionTimeout = 10
  SSLOptions.Port = 0
  Version = 'Internal'
  Left = 367
  Top = 314
  Height = 310
  Width = 342
  %s
  %s
  %s
  %s
end
&  d   џџ
 I W _ S E R V E R C O N T R O L L E R _ F I L E _ N O _ S E S S I O N       0	        unit ServerController;

interface

uses
  SysUtils, Classes, IWServerControllerBase, HTTPApp,
  %sIWApplication, IWBaseForm;

type
  TIWServerController = class(TIWServerControllerBase)
%s
  private
    %s
  public
  end;

  function IWServerController: TIWServerController;

implementation
{$R %s}

uses
  IWInit, IWGlobal;

function IWServerController: TIWServerController;
begin
  Result := TIWServerController(GServerController);
end;

%s

initialization
  TIWServerController.SetServerControllerClass;

end.

  4  X   џџ
 I W _ S E R V E R C O N T R O L L E R _ P O O L _ F I L E       0	        unit ServerController;

interface

uses
  SysUtils, Classes, IWServerControllerBase, IWBaseForm, HTTPApp,
  // For OnNewSession Event
  %sIWApplication, IWAppForm, DataModuleUnit, IWDataModulePool;

type
  TIWServerController = class(TIWServerControllerBase)
    Pool: TIWDataModulePool;
    procedure IWServerControllerBaseNewSession(ASession: TIWApplication;
      var VMainForm: TIWBaseForm);
    procedure IWServerControllerBaseCreate(Sender: TObject);
%s
    procedure PoolCreateDataModule(var ADataModule: TDataModule);
    procedure PoolFreeDataModule(var ADataModule: TDataModule);
  private
    %s
  public
  end;

  function UserSession: TIWUserSession;
  function IWServerController: TIWServerController;
  function LockDataModule: TDataModule1;
  procedure UnlockDataModule(ADataModule: TDataModule1);

implementation

{$R %s}

uses
  IWInit, IWGlobal;

function UserSession: TIWUserSession;
begin
  Result := TIWUserSession(WebApplication.Data);
end;

function IWServerController: TIWServerController;
begin
  Result := TIWServerController(GServerController);
end;

procedure TIWServerController.IWServerControllerBaseNewSession(
  ASession: TIWApplication; var VMainForm: TIWBaseForm);
begin
  ASession.Data := TIWUserSession.Create(nil);
end;

procedure TIWServerController.IWServerControllerBaseCreate(Sender: TObject);
begin
  Pool.Active := True;
  %s
end;

%s

procedure TIWServerController.PoolCreateDataModule(var ADataModule: TDataModule);
begin
  ADataModule := TDataModule1.Create(nil);
end;

procedure TIWServerController.PoolFreeDataModule(var ADataModule: TDataModule);
begin
  FreeAndNil(ADataModule);
end;

function LockDataModule: TDataModule1;
begin
  Result := TDataModule1(TIWServerController(GServerController).Pool.Lock);
end;

procedure UnlockDataModule(ADataModule: TDataModule1);
var
  LTemp: TDataModule;
begin
  LTemp := ADataModule;
  TIWServerController(GServerController).Pool.Unlock(LTemp);
end;


initialization
  TIWServerController.SetServerControllerClass;

end.

T  p   џџ
 I W _ S E R V E R C O N T R O L L E R _ P O O L _ F I L E _ N O _ S E S S I O N         0	        unit ServerController;

interface

uses
  SysUtils, Classes, IWServerControllerBase, HTTPApp, %s
  DataModuleUnit, IWDataModulePool, IWApplication, IWBaseForm;

type
  TIWServerController = class(TIWServerControllerBase)
    Pool: TIWDataModulePool;
    procedure IWServerControllerBaseCreate(Sender: TObject);
%s
    procedure PoolCreateDataModule(var ADataModule: TDataModule);
    procedure PoolFreeDataModule(var ADataModule: TDataModule);
  private
    %s
  public
  end;

  function IWServerController: TIWServerController;
  function LockDataModule: TDataModule1;
  procedure UnlockDataModule(ADataModule: TDataModule1);

implementation

{$R %s}

uses
  IWInit, IWGlobal;

function IWServerController: TIWServerController;
begin
  Result := TIWServerController(GServerController);
end;

procedure TIWServerController.IWServerControllerBaseCreate(Sender: TObject);
begin
  Pool.Active := True;
  %s
end;

%s

procedure TIWServerController.PoolCreateDataModule(var ADataModule: TDataModule);
begin
  ADataModule := TDataModule1.Create(nil);
end;

procedure TIWServerController.PoolFreeDataModule(var ADataModule: TDataModule);
begin
  FreeAndNil(ADataModule);
end;

function LockDataModule: TDataModule1;
begin
  Result := TDataModule1(TIWServerController(GServerController).Pool.Lock);
end;

procedure UnlockDataModule(ADataModule: TDataModule1);
var
  LTemp: TDataModule;
begin
  LTemp := ADataModule;
  TIWServerController(GServerController).Pool.Unlock(LTemp);
end;


initialization
  TIWServerController.SetServerControllerClass;

end.

У  X   џџ
 I W _ S E R V E R C O N T R O L L E R _ P O O L _ F O R M       0	        object IWServerController: TIWServerController
  OldCreateOrder = False
  AppName = 'MyApp'
  ComInitialization = ciNone
  Description = 'My IntraWeb Application'
  ExceptionDisplayMode = smAlert
  HistoryEnabled = False
  Port = 8888
  SessionTimeout = 10
  SSLOptions.Port = 0
  SupportedBrowsers = [brIE, brNetscape6, brOpera]
  Version = 'Internal'
  Left = 367
  Top = 314
  Height = 310
  Width = 342
  OnCreate = IWServerControllerBaseCreate
  %s
  %s
  object Pool: TIWDataModulePool
    OnCreateDataModule = PoolCreateDataModule
    OnFreeDataModule = PoolFreeDataModule
    PoolCount = 20
    Active = False
    Version = '0.1.1b'
    Left = 60
    Top = 12
  end
end
   0   џџ
 I W _ D E P L O Y       0	        <?xml version="1.0"?>
<DeployTarget>
  <Title>Target1</Title>
  <Active>0</Active>
  <Options>
    <LogFilename>DeployLog.txt</LogFilename>
    <EnableLogging>0</EnableLogging>
  </Options>
  <Rules>
    <Rule>
      <Title>Executables</Title>
      <Filter>*.%s</Filter>
      <Ignored>0</Ignored>
    </Rule>
    <Rule>
      <Title>HTML Files</Title>
      <Filter>*.html;*.htm;*.css;*.js</Filter>
      <Ignored>0</Ignored>
    </Rule>
    <Rule>
      <Title>Image Files</Title>
      <Filter>*.jpg;*.bmp;*.dib;*.png;*.tiff;*.gif</Filter>
      <Ignored>0</Ignored>
    </Rule>
    <Rule>
      <Title>Other Files</Title>
      <Filter>*.*</Filter>
      <Ignored>1</Ignored>
    </Rule>  </Rules>
  <Locations>
    <Location>
      <LocationID>Borland.Studio.Directory</LocationID>
      <Borland.Studio.Directory>
        <Active>0</Active>
        <Directory></Directory>
      </Borland.Studio.Directory>
    </Location>
    <Location>
      <LocationID>Borland.Studio.FTP</LocationID>
      <Borland.Studio.FTP>
        <Active>0</Active>
        <Server></Server>
        <Port>21</Port>
        <Folder></Folder>
        <UserName></UserName>
        <PassiveMode>0</PassiveMode>
        <AnonymousLogin>0</AnonymousLogin>
      </Borland.Studio.FTP>
    </Location>
  </Locations>
  <RenamedFiles/>
  <Ignorediles/>
  <LocationHistories/>
</DeployTarget>
    @   џџ
 I W _ I S A P I _ P R O J E C T         0	        library %s;

uses
  %sServerController in 'ServerController.pas' {IWServerController: TIWServerController},%s
  %s in '%s.pas' {%s: TIWFormModuleBase};
  
{$R *.RES}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

begin
  IWRun;
end.
  Ј   P   џџ
 I W _ I S A P I _ P R O J E C T _ D 2 0 1 0 U P         0	        library %s;

uses
  %s, UTF8ContentParser;
  
{$R *.RES}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

begin
  IWRun;
end.
>  D   џџ
 I W _ D A T A M O D U L E _ F I L E         0	        unit DatamoduleUnit;

interface

uses
  Forms,
  SysUtils, Classes;

type
  TDataModule1 = class(TDataModule)
  private
  public
  end;

// Procs
  function DataModule1: TDataModule1;

implementation
{$R %s}

uses
  IWInit,
  ServerController;

// Since we are threaded we cannot use global variables to store form / datamodule references
// so we store them in WebApplication.Data and we could reference that each time, but by creating
// a function like this our other code looks "normal" almost as if its referencing a global.
// This function is not necessary but it makes the code in the main form which references this
// datamodule a lot neater.
// Without this function every time we would reference this datamodule we would use:
//   TDataModule1(WebApplication.Data).Datamodule.<method / component>
// By creating this procedure it becomes:
//   TDataModule1.<method / component>
// Which is just like normal Delphi code.

function DataModule1: TDataModule1;
begin
  Result := TUserSession(WebApplication.Data).Datamodule1;
end;

end.
  {   D   џџ
 I W _ D A T A M O D U L E _ F O R M         0	        object DataModule1: TDataModule1
  OldCreateOrder = False
  Left = 472
  Top = 220
  Height = 150
  Width = 215
end
 О   L   џџ
 I W _ D A T A M O D U L E _ P O O L _ F I L E       0	        unit DataModuleUnit;

interface

uses
  Forms,
  SysUtils, Classes;

type
  TDataModule1 = class(TDataModule)
  private
  public
  end;

  
implementation

{$R %s}

end.
  ѕ  D   џџ
 I W _ U S E R S E S S I O N _ F I L E       0	        unit UserSessionUnit;

{
  This is a DataModule where you can add components or declare fields that are specific to 
  ONE user. Instead of creating global variables, it is better to use this datamodule. You can then
  access the it using UserSession.
}
interface

uses
  IWUserSessionBase, SysUtils, Classes;

type
  TIWUserSession = class(TIWUserSessionBase)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.   {   D   џџ
 I W _ U S E R S E S S I O N _ F O R M       0	        object UserSession: TIWUserSession
  OldCreateOrder = False
  Left = 192
  Top = 160
  Height = 150
  Width = 215
end в   8   џџ
 I W _ P A G E _ F I L E         0	        unit %s;

interface

uses
  Classes, SysUtils, IWApplication, IWTypes, IWPageForm%s, IWInit, IWLicenseKey;

type
  T%s = class(TIWPageForm%s)
  public
  end;

implementation

{$R %s}

%s

end.     8   џџ
 I W _ P A G E _ F O R M         0	        object %s: T%s
  Left = 0
  Top = 0
  Width = 349
  Height = 296
  AutoProcess = True
  PostToSelf = True
  DesignLeft = 340
  DesignTop = 125
end
   :  8   џџ
 I W _ F R A M E _ U N I T       0	        unit %s;

interface

uses
  SysUtils, Classes, Controls, Forms,
  IWVCLBaseContainer, IWColor, IWContainer, IWRegion%s;

type
  T%s = class(TFrame)
    IWFrameRegion: TIWRegion%s;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R %s}

end.  Ї   8   џџ
 I W _ F R A M E _ F I L E       0	        object %s: T%s
  Left = 0
  Top = 0
  Width = 343
  Height = 169
  TabOrder = 0
  object IWFrameRegion: TIWRegion%s
    TabOrder = 0
    %s
    %s
  end
end j  P   џџ
 I W _ B C B _ S T A N D A L O N E _ P R O J E C T       0	        //---------------------------------------------------------------------------

#include <%s.h>
#pragma hdrstop
USERES("%s.res");
USEFORM("%s.cpp", %s);
USEFORM("ServerController.cpp", IWServerController);
//---------------------------------------------------------------------------
#include <IWStart.hpp>
//---------------------------------------------------------------------------
%s
{
        try
        {
           TIWStart* p = new TIWStart();
           #if /*CB2006*/ (__BORLANDC__ == 0x580) /*Update 1*/ || (__BORLANDC__ == 0x581 ) || /*CB2007*/ (__BORLANDC__ == 0x593)
           p->Execute(NULL, true);
           #else
           p->Execute(true);
           #endif
        }
        catch (Exception &exception)
        {

        }
        return 0;
}
//---------------------------------------------------------------------------
  ю  @   џџ
 I W _ B C B _ U N I T _ F I L E         0	        //---------------------------------------------------------------------------

#include <%s.h>
#pragma hdrstop

#include "%s.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "%s"
//---------------------------------------------------------------------------
__fastcall %s::%s(TComponent* Owner)
        : %s(Owner)
{

}
//---------------------------------------------------------------------------

%s    D   џџ
 I W _ B C B _ U N I T _ H _ F I L E         0	        //---------------------------------------------------------------------------

#ifndef %sH
#define %sH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <%sControls.hpp>
#include <%sStdCtrls.hpp>
#include <%sForms.hpp>
#include <%s.hpp>
%s
//---------------------------------------------------------------------------
class %s: public %s
{
__published:	// IDE-managed Components
private:	// User declarations
public:		// User declarations
        __fastcall %s(TComponent* Owner);
};
//---------------------------------------------------------------------------
#endif
  Ь  L   џџ
 I W _ B C B _ U S E R S E S S I O N _ F I L E       0	        //---------------------------------------------------------------------------

#include <%s.h>
#pragma hdrstop

#include "UserSessionUnit.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "%s"

//---------------------------------------------------------------------------
TIWUserSession* UserSession()
{
  return (TIWUserSession*)WebApplication->Data;
}

//---------------------------------------------------------------------------
__fastcall TIWUserSession ::TIWUserSession (TComponent* Owner)
        : TIWUserSessionBase(Owner)
{
}
//---------------------------------------------------------------------------


  P   џџ
 I W _ B C B _ U S E R S E S S I O N _ H E A D E R       0	        //---------------------------------------------------------------------------

#ifndef UserSessionUnitH
#define UserSessionUnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <IWUserSessionBase.hpp>
#include <IWApplication.hpp>
#include <IWInit.hpp>
//---------------------------------------------------------------------------
class TIWUserSession : public TIWUserSessionBase
{
__published:	// IDE-managed Components
private:	// User declarations
public:		// User declarations
        __fastcall TIWUserSession(TComponent* Owner);
};

extern TIWUserSession* UserSession();

#endif   Г  X   џџ
 I W _ B C B _ S E R V E R C O N T R O L L E R _ F I L E         0	        //---------------------------------------------------------------------------

#include <%s.h>
#pragma hdrstop

#include "ServerController.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "%s"

//---------------------------------------------------------------------------
__fastcall TIWServerController::TIWServerController(TComponent* Owner)
        : TIWServerControllerBase(Owner)
{
}
//---------------------------------------------------------------------------
%s

void setServerController() {
  TIWServerController::SetServerControllerClass(%s);
}

#pragma startup setServerController
   \   џџ
 I W _ B C B _ S E R V E R C O N T R O L L E R _ H E A D E R         0	        //---------------------------------------------------------------------------

#ifndef ServerControllerH
#define ServerControllerH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <IWServerControllerBase.hpp>
#include <IWApplication.hpp>
#include <IWInit.hpp>
#include <UTF8ContentParser.hpp>

%s
//---------------------------------------------------------------------------
class TIWServerController  : public TIWServerControllerBase
{
__published:	// IDE-managed Components
%s
private:	// User declarations
public:		// User declarations
        __fastcall TIWServerController(TComponent* Owner);
};

//---------------------------------------------------------------------------
extern PACKAGE TIWServerController *IWServerController;
//---------------------------------------------------------------------------
#endif
  `   џџ
 I W _ B C B _ S E R V E R C O N T R O L L E R _ P O O L _ F I L E       0	        //---------------------------------------------------------------------------

#include <%s.h>
#pragma hdrstop

#include "ServerController.h"
#include "IWGlobal.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "%s"

//---------------------------------------------------------------------------
__fastcall TIWServerController::TIWServerController(TComponent* Owner)
        : TIWServerControllerBase(Owner)
{
}
//---------------------------------------------------------------------------

%s

//---------------------------------------------------------------------------

void __fastcall TIWServerController::IWServerControllerBaseCreate(
      TObject *Sender)
{
   Pool->Active = true;
}
//---------------------------------------------------------------------------
void __fastcall TIWServerController::PoolCreateDataModule(
      TDataModule *&ADataModule)
{
  ADataModule = new TDataModule1(NULL);
}
//---------------------------------------------------------------------------
void __fastcall TIWServerController::PoolFreeDataModule(
      TDataModule *&ADataModule)
{
  ADataModule->Free();
}
//---------------------------------------------------------------------------

TDataModule1* LockDataModule()
{
  return (TDataModule1*)((TIWServerController*)gServerController)->Pool->Lock();
}

//---------------------------------------------------------------------------

void UnlockDataModule(TDataModule1* ADataModule)
{
  TDataModule* temp = ADataModule;
  ((TIWServerController*)gServerController)->Pool->Unlock(temp);
}
//---------------------------------------------------------------------------
void setServerController() {
  TIWServerController::SetServerControllerClass(%s);
}
//---------------------------------------------------------------------------

#pragma startup setServerController
 щ  d   џџ
 I W _ B C B _ S E R V E R C O N T R O L L E R _ P O O L _ H E A D E R       0	        //---------------------------------------------------------------------------

#ifndef ServerControllerH
#define ServerControllerH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <IWServerControllerBase.hpp>
#include <IWDataModulePool.hpp>
#include <IWApplication.hpp>
#include <IWInit.hpp>
%s
//---------------------------------------------------------------------------
class TIWServerController  : public TIWServerControllerBase
{
__published:	// IDE-managed Components
        TIWDataModulePool *Pool;
%s
        void __fastcall IWServerControllerBaseCreate(TObject *Sender);
        void __fastcall PoolCreateDataModule(TDataModule *&ADataModule);
        void __fastcall PoolFreeDataModule(TDataModule *&ADataModule);
private:	// User declarations
public:		// User declarations
        __fastcall TIWServerController(TComponent* Owner);
};

extern void UnlockDataModule(TDataModule1* ADataModule);
extern TDataModule1* LockDataModule();

//---------------------------------------------------------------------------
extern PACKAGE TIWServerController *IWServerController;
//---------------------------------------------------------------------------
#endif
   2  L   џџ
 I W _ B C B _ D A T A M O D U L E _ F I L E         0	        //---------------------------------------------------------------------------

#include <%s.h>
#pragma hdrstop

#include "DatamoduleUnit.h"
#include "ServerController.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "%s"
//---------------------------------------------------------------------------
__fastcall TDataModule1::TDataModule1(TComponent* Owner)
        : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------

  Z  P   џџ
 I W _ B C B _ D A T A M O D U L E _ H E A D E R         0	        //---------------------------------------------------------------------------

#ifndef DatamoduleUnitH
#define DatamoduleUnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <%sControls.hpp>
#include <%sStdCtrls.hpp>
#include <%sForms.hpp>
//---------------------------------------------------------------------------
class TDataModule1 : public TDataModule
{
__published:	// IDE-managed Components
private:	// User declarations
public:		// User declarations
        __fastcall TDataModule1(TComponent* Owner);
};
#endif
  №  @   џџ
 I W _ B C B _ F R A M E _ U N I T       0	        //---------------------------------------------------------------------------

#include <%s.h>
#pragma hdrstop

#include "%s.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "%s"
//---------------------------------------------------------------------------
__fastcall %s::%s(TComponent* Owner)
        : TFrame(Owner)
{

}
//---------------------------------------------------------------------------

Ш  P   џџ
 I W _ B C B _ F R A M E _ U N I T _ H _ F I L E         0	        //---------------------------------------------------------------------------

#ifndef %sH
#define %sH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <%sControls.hpp>
#include <%sStdCtrls.hpp>
#include <%sForms.hpp>
#include <IWColor.hpp>
#include <IWRegion%s.hpp>
//---------------------------------------------------------------------------
class %s: public TFrame
{
__published:	// IDE-managed Components
 TIWRegion%s *IWFrameRegion;
private:	// User declarations
public:		// User declarations
        __fastcall %s(TComponent* Owner);
};
//---------------------------------------------------------------------------
#endif
d  L   џџ
 I W _ B C B _ I S A P I _ P R O J E C T _ 5 0       0	        //---------------------------------------------------------------------------
#include <vcl.h>
#include <IWInitISAPI.hpp>

#pragma hdrstop

USERES("%s.res");
USEFORM("%s.cpp", %s);
USEFORM("ServerController.cpp", IWServerController);
//---------------------------------------------------------------------------
#define Application Webbroker::Application

#pragma link "isapiapp.obj"
#pragma link "webbroker.obj"
//---------------------------------------------------------------------------
int WINAPI DllEntryPoint(HINSTANCE hinst, unsigned long reason, void*)
{
  try {
    switch (reason) {
      case DLL_PROCESS_ATTACH: {
        IWRun();
        break;
      }
    }

  }
  catch (Exception &exception)
  {
  }
  return 1;
}
//---------------------------------------------------------------------------
extern "C"
{
  BOOL __declspec(dllexport) WINAPI GetExtensionVersion(Isapi2::THSE_VERSION_INFO &Ver)
  {
      return Isapiapp::GetExtensionVersion(Ver);
  }
  //---------------------------------------------------------------------------
  unsigned __declspec(dllexport) WINAPI HttpExtensionProc(Isapi2::TEXTENSION_CONTROL_BLOCK &ECB)
  {
      return Isapiapp::HttpExtensionProc(ECB);
  }
  //---------------------------------------------------------------------------
  BOOL __declspec(dllexport) WINAPI TerminateExtension(int dwFlags)
  {
      return Isapiapp::TerminateExtension(dwFlags);
  }
}
//---------------------------------------------------------------------------
#undef Application
//---------------------------------------------------------------------------
+  L   џџ
 I W _ B C B _ I S A P I _ P R O J E C T _ 6 0       0	        //---------------------------------------------------------------------------
#include <ActiveX.hpp>
#include <ComObj.hpp>
#include <WebBroker.hpp>
#include <ISAPIApp.hpp>
#include <Isapi2.hpp>
#include <IWInitISAPI.hpp>
#ifdef VER210
#include <UTF8ContentParser.hpp>
#endif

#pragma hdrstop

USERES("%s.res");
USEFORM("%s.cpp", %s);
USEFORM("ServerController.cpp", IWServerController);
//---------------------------------------------------------------------------
#define Application Webbroker::Application

#pragma link "isapiapp.obj"
#pragma link "webbroker.obj"
//---------------------------------------------------------------------------
int WINAPI DllEntryPoint(HINSTANCE hinst, unsigned long reason, void*)
{
  try {
    switch (reason) {
      case DLL_PROCESS_ATTACH: {
        CoInitFlags = COINIT_MULTITHREADED;
        IWRun();
        break;
      }
    }

  }
  catch (Exception &exception)
  {
  }
  return 1;
}
//---------------------------------------------------------------------------
extern "C"
{
  BOOL __declspec(dllexport) WINAPI GetExtensionVersion(Isapi2::THSE_VERSION_INFO &Ver)
  {
    return Isapiapp::GetExtensionVersion(Ver);
  }
  //---------------------------------------------------------------------------
  unsigned __declspec(dllexport) WINAPI HttpExtensionProc(Isapi2::TEXTENSION_CONTROL_BLOCK &ECB)
  {
    return Isapiapp::HttpExtensionProc(ECB);
  }
  //---------------------------------------------------------------------------
  BOOL __declspec(dllexport) WINAPI TerminateExtension(int dwFlags)
  {
    return Isapiapp::TerminateExtension(dwFlags);
  }
}
//---------------------------------------------------------------------------
#undef Application
//---------------------------------------------------------------------------
 K  `   џџ
 I W _ B C B _ I S A P I T H R E A D P O O L _ P R O J E C T _ 6 0       0	        //---------------------------------------------------------------------------
#include <ActiveX.hpp>
#include <ComObj.hpp>
#include <WebBroker.hpp>
#include <ISAPIApp.hpp>
#include <ISAPIThreadPool.hpp>
#include <Isapi2.hpp>
#include <IWInitISAPI.hpp>

#pragma hdrstop

USERES("%s.res");
USEFORM("%s.cpp", %s);
USEFORM("ServerController.cpp", IWServerController);
//---------------------------------------------------------------------------
#define Application Webbroker::Application

#pragma link "isapiapp.obj"
#pragma link "isapithreadpool.obj"
#pragma link "webbroker.obj"
//---------------------------------------------------------------------------
int WINAPI DllEntryPoint(HINSTANCE hinst, unsigned long reason, void*)
{
  try {
    switch (reason) {
      case DLL_PROCESS_ATTACH: {
        CoInitFlags = COINIT_MULTITHREADED;
        IWRun();
        break;
      }
    }

  }
  catch (Exception &exception)
  {
  }
  return 1;
}
//---------------------------------------------------------------------------
extern "C"
{
  BOOL __declspec(dllexport) WINAPI GetExtensionVersion(Isapi2::THSE_VERSION_INFO &Ver)
  {
    return Isapithreadpool::GetExtensionVersion(Ver);
  }
  //---------------------------------------------------------------------------
  unsigned __declspec(dllexport) WINAPI HttpExtensionProc(Isapi2::TEXTENSION_CONTROL_BLOCK &ECB)
  {
    return Isapithreadpool::HttpExtensionProc(ECB);
  }
  //---------------------------------------------------------------------------
  BOOL __declspec(dllexport) WINAPI TerminateExtension(int dwFlags)
  {
    return Isapithreadpool::TerminateExtension(dwFlags);
  }
}
//---------------------------------------------------------------------------
#undef Application
//---------------------------------------------------------------------------
 Я   <   џџ
 I W _ T E S T _ P R O J E C T       0	        program %s;

uses
  Forms,
  TestFramework,
  GUITestRunner,
  IWInit,
  IWGlobal,
  %s in '%s.pas';

{$R *.res}

begin
  GAppModeInit(Application);
  TGUITestRunner.runRegisteredTests;
end.
 Ь  8   џџ
 I W _ T E S T _ U N I T         0	        unit %s;

interface

uses
  Classes, SysUtils, TestFrameWork;

type
  %classname% = class(TTestCase)
  private
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    {$IFDEF CLR}[Test]{$ENDIF}
    procedure Test;
  end;

implementation

uses
  IWTestFramework;

{ %classname% }

procedure %classname%.SetUp;
begin
  // Setup
end;

procedure %classname%.TearDown;
begin
  // Clean up
end;

procedure %classname%.Test;
begin
//  with NewSession do try
//    with MainForm as TIWForm1 do begin

// add your test code here

//    end;
//  finally
//    Free;
//  end;
end;

initialization
  RegisterTest('', %classname%.Suite);
end.m  L   џџ
 I W _ B C B _ T E S T _ P R O J E C T _ C P P       0	        //---------------------------------------------------------------------------

#include <vcl.h>
#include <GuiTestRunner.hpp>

#pragma hdrstop
#pragma link "GUITestRunner"

//---------------------------------------------------------------------------
%s
{
        try
        {
                Guitestrunner::RunRegisteredTests();
        }
        catch (Exception &exception)
        {
                 Application->ShowException(&exception);
        }
        catch (...)
        {
                 try
                 {
                         throw Exception("");
                 }
                 catch (Exception &exception)
                 {
                         Application->ShowException(&exception);
                 }
        }
        return 0;
}
//---------------------------------------------------------------------------   И  H   џџ
 I W _ B C B _ T E S T _ U N I T _ C P P         0	        //---------------------------------------------------------------------------
#pragma hdrstop

#include "%s.h"
//---------------------------------------------------------------------------

void __fastcall %classname%::SetUp()
{
  // Setup
}

void __fastcall %classname%::TearDown()
{
  // Clean up
}

void %classname%::Test()
{

}

void initialize(void)
{
}
#pragma startup initialize

#pragma package(smart_init)  L   џџ
 I W _ B C B _ T E S T _ U N I T _ H E A D E R       0	        //---------------------------------------------------------------------------

#ifndef Unit1H
#define Unit1H

#include "TestFrameWork.hpp"

//---------------------------------------------------------------------------

class %classname% : public TTestCase
{
  protected:
    void __fastcall SetUp();
    void __fastcall TearDown();
  __published:
    void Test();
};



#endif
  Ќv  <   џџ I W _ W I Z A R D _ L O G O         0	        (   і   )         v  Ф  Ф          џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ  џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџѓќњЉюрДкеглнсхш№ёё§§§џџџџџџџџџџџџџџџџџџџџџћћћфщыїїїџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ  џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџSуХ)еВ$еБBкЛйЧДкежнрфщыїїїўўўџџџўўў§§§МММЌЌЌжттљљљџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ  џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџЪєыBкЛ)еВ)еВ)еВ)еВ)еВQйОйЮЫношэяГДД№ёёЧЬЮУУУЧЬЮёєѕџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ  џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ|ха,жГ)еВ)еВ)еВ)еВ)еВ)еВ)еВ0жЕlтЪЌКЙУУУМММжнрёєѕћћћџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ  џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџоїђЪєыЪєыЪєыЪєыЪєыЪєыЪєыЪєыЪєыЪєыЪєыЪєыљ§ќџџџџџџџџџџџџџџџѓќњQйО)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВеЏЁХНиавЌЌЌЌКЙглнїїїџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ  џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџыл5иЗ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ,жГоїђџџџџџџџџџџџџыл5иЗ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ*мИ
ЄЩцрџџџџџџДкеЌКЙглнљљљџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ  џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџBкЛ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВЉюрљ§ќџџџџџџџџџlтЪ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ*йЖІЩцрџџџЁХН%КйЮсхшљљљџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ  џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџBкЛ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВЉюрљ§ќџџџџџџЪєыBкЛ)еВ)еВ)гАz#В)еВ)еВ)еВ)еВ%мЖ9ЎжттОГ'ХЅ0жЕДке№ёёџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ  џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџBкЛ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВЉюрљ§ќџџџџџџчв0жЕ)еВ*мИQD#В*мИ)еВ)еВ%мЖ=BЃ)ЭЌеЏvжСЫнољљљџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ  џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџBкЛ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВЉюрљ§ќџџџќўўQйО)еВ*мИQD
#В*мИ)еВ)еВ)еВ)еВ)еВ)еВеЏйЮфщы§§§џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ  џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџBкЛ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВЉюрљ§ќџџџЉюр5иЗ*мИQD
#В*мИ)еВ)еВ)еВ)еВ)еВ$еБBкЛДкеёєѕџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ  џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџBкЛ)еВ)еВ)еВ)еВ)еВ)еВ)еВ+уНQD
$ Є)еВ)еВ)еВЉюрљ§ќџџџlтЪ*мИQD
#В*мИ)еВ)еВ)еВ)еВ)еВеЏvжСжттљљљџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ  џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџBкЛ)еВ)еВ)еВ)еВ)еВ)еВ*мИA6'ХЅ*йЖ)еВЉюрџџџоїђSуХvb
#В*мИ)еВ)еВ)еВ)еВ)еВеЏДке№ёёўџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ  џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџBкЛ)еВ)еВ)еВ)еВ)еВ)еВ+уНdS
 Є)зД)еВЉюрџџџ№н}i
#В*мИ)еВ)еВ)еВ)еВ$еБQйОДкеїїїџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ  џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџBкЛ)еВ)еВ)еВ)еВ)еВ)еВ*мИ
$QD'ХЅ)зДЉётџџџОГ000#В*мИ)еВ)еВ)еВ)еВеЏйЧфщыћћћџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ  џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџBкЛ)еВ)еВ)еВ)еВ)еВ*мИz
%К*йЖЉюрљ§ќџџџћћћМММ\\\
#В*мИ)еВ)еВ)еВ)еВ)еВДкеёєѕџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ  џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџBкЛ)еВ)еВ)еВ)еВ)еВ+уНA6
dS)ЭЌЉюрљ§ќџџџџџџџџџџџџ№ёё;;;#В*мИ)еВ)еВ)еВеЏvжСжттљљљџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ  џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџBкЛ)еВ)еВ)еВ)еВ*йЖ'ХЅ%КЉётљ§ќџџџџџџџџџџџџџџџџџџџџџккк?ПЅ*йЖ)еВ)еВ)еВеЏйЮшэяўўўџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ  џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџBкЛ)еВ)еВ)еВ)еВ*мИvb
}iЉюрљ§ќџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџЪєычв5иЗ$еБBкЛзђь§§§џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџўўўўўўџџџџџџџџџџџџўўўўўўўўўџџџџџџўўўўўўўўўџџџџџџџџџџџџ§§§§§§§§§§§§џџџџџџџџџџџџџџџџџџџџџџџџџџџўўўўўўўўўџџџџџџџџџџџџџџџџџџўўў§§§§§§§§§§§§ўўўџџџџџџўўў§§§§§§§§§§§§ўўўџџџџџџџџџџџџџџџўўўўўўџџџџџџџџџџџџўўў§§§§§§§§§ўўўџџџџџџџџџўўўўўўџџџџџџџџџџџџџџџџџџџџџџџџџџџ§§§§§§ўўўџџџўўўўўўўўўџџџџџџўўўўўўўўўџџџџџџџџџ§§§§§§§§§§§§џџџџџџџџџџџџџџџџџџџџџџџџўўўўўўўўўџџџџџџўўўўўўўўўџџџџџџџџџџџџџџџ§§§§§§§§§§§§џџџџџџўўўўўўўўўўўў§§§§§§ўўўџџџџџџџџџ  џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџыл5иЗ)еВ)еВ)еВ-шТ1)1)Ћфиљ§ќџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџѓќњЪєыѓќњџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџљљљщщщхххюююћћћџџџ§§§№ёёхххщщщііі§§§№ёёхххщщщіііўўўљљљюююнннежжкккхххѓѓѓўўўџџџџџџџџџџџџџџџїїїщщщрррхххѓѓѓўўўџџџџџџџџџ§§§ѓѓѓхххкккежжкккхххѓѓѓїїїщщщрррнннннннннрррщщщїїїџџџџџџўўўѓѓѓххххххіііўўў§§§іііхххкккежжррр№ёёћћћ§§§ѓѓѓххххххіііўўўџџџџџџџџџџџџџџџљљљщщщккккккщщщ№ёёххххххѓѓѓ§§§іііххххххѓѓѓ§§§љљљюююрррежжкккхххѓѓѓ§§§џџџџџџџџџџџџ§§§юююррррррюююћћћљљљщщщрррхххѓѓѓўўўџџџљљљюююрррежжкккхххѓѓѓљљљюююхххщщщхххккккккхххіііўўўџџџ  џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџѓќњўџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџѓќњќўўџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџщщщММММММюююџџџїїїЫЫЫЌЌЌрррѓѓѓЫЫЫЌЌЌрррѓѓѓкккЌЌЌЅІЅежжљљљџџџџџџџџџџџџћћћкккЅІЅвввїїїџџџџџџљљљхххМММЅІЅежжхххГДДГДДхххџџџџџџїїївввЌЌЌнннћћћюююЫЫЫГДДрррѓѓѓежжЅІЅЅІЅкккћћћџџџџџџџџџџџџљљљнннЌЌЌМММЫЫЫЌЌЌЅІЅвввѓѓѓкккЅІЅЅІЅввв№ёёкккЌЌЌЅІЅвввїїїџџџџџџџџџўўўюююМММУУУююющщщГДДвввїїїїїїкккЌЌЌЅІЅвввщщщУУУЅІЅвввѓѓѓўўў  џџџџџџџџџџџџџџџџџџџџџџџџџџџRЩЏRЩЏќўўџџџйЧRЩЏзђьўџџџџџйЧRЩЏрбќўўљ§ќvжСИИ8СЃљ§ќйЧRЩЏрбљ§ќџџџџџџоїђvжСИ%КvжСvжСИрбыл5иЗ)еВ)зД)ЭЌdS)ЭЌ
$ЌЌЌccc
A6)гАA61)%К*йЖ)еВ)еВИђцџџџннн{{{cccвввџџџ{{{000;;;;;;МММ§§§џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ000щщщџџџЌЌЌ000kkkххх((({{{ввввввrrr(((EEEвввїїїџџџџџџџџџџџџМММ;;;EEEЌЌЌщщщџџџ§§§хххEEE;;;ГДДccc(((хххџџџџџџМММ(((kkkЫЫЫ№ёёМММ\\\(((RRR{{{ЌЌЌМММEEERRRЫЫЫљљљџџџџџџџџџџџџхххrrr\\\(((\\\МММЅІЅ((((((kkkМММежж000000rrrЫЫЫѓѓѓџџџџџџџџџљљљЌЌЌ;;;вввcccRRRЌЌЌщщщннн{{{(((;;;УУУ(((EEEEEEEEEcccвввљљљ  џџџџџџџџџџџџџџџџџџџџџџџџџџџИИќўўџџџ[ЬГИУьуќўўџџџ[ЬГИйЧўџџрбИИИИљ§ќeЯИИvжСѓќњџџџџџџGЦЊИ%КGЦЊИИИзђьBкЛ)еВ)еВ*мИz+уНvb
ЌЌЌccc
z+уНvb
 Є*мИ)еВ)еВwѓкежж000
ГДДџџџ
ЅІЅџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџcccхххџџџ
\\\хххkkk
rrrМММRRRннніііџџџџџџџџџџџџежжџџџщщщkkkЫЫЫ;;;§§§џџџџџџЅІЅ
\\\ЫЫЫМММ((((((EEEЫЫЫљљљџџџџџџџџџљљљ\\\МММ
RRRГДД
cccЌЌЌ
\\\кккѓѓѓџџџџџџџџџююю\\\МММ((((((ввв{{{{{{ЫЫЫkkk(((kkkГДД№ёё  џџџџџџџџџџџџџџџџџџџџџџџџџџџИИќўўџџџ[ЬГИУьуќўўџџџ[ЬГИйЧџџџ[ЬГИvжСљ§ќоїђџџџeЯИИvжСѓќњџџџџџџ8СЃИЪєыџџџЋфи%КИљ§ќBкЛ)еВ)еВ+уНA6
%К*мИ%КЌЌЌccc
%К+уН#В
$dS'ХЅ*йЖ)еВєоRqjМММџџџюююГДДхххџџџrrrѓѓѓџџџccc;;;ежжџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџcccхххџџџ
\\\хххkkk{{{rrr
EEE{{{{{{kkk{{{ГДДхххўўўџџџџџџхххRRR
cccУУУћћћrrrМММГДДЫЫЫккк;;;{{{ЌЌЌМММУУУщщщџџџџџџџџџЅІЅ
\\\УУУ{{{
kkkвввrrr
\\\EEEУУУљљљџџџџџџџџџхххRRR{{{вввУУУ
RRRГДД
ccc000rrrrrrrrrЌЌЌррр§§§џџџџџџррр
{{{ЅІЅ
ЅІЅ;;;{{{kkk{{{ЅІЅ\\\RRRЫЫЫrrrRRRщщщ  џџџџџџџџџџџџџџџџџџџџџџџџџџџИИќўўџџџ[ЬГИУьуќўўџџџ[ЬГИйЧџџџ[ЬГИйЧљ§ќџџџџџџeЯИИvжСѓќњџџџџџџ8СЃИvжСљ§ќзђь%КИљ§ќBкЛ)еВ*йЖ'ХЅdS'ХЅ)зД+уНQD
ЌЌЌccc
dS'ХЅ)зД-шТA6
$%К*мИ)еВєо1VNcccМММУУУУУУУУУМММџџџ{{{іііџџџУУУ(((УУУџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџcccхххџџџ
\\\нннccc
RRRннн§§§џџџџџџГДДEEEГДДУУУEEE{{{нннўўўџџџџџџџџџежж;;;(((ЅІЅщщщџџџџџџџџџџџџџџџџџџЅІЅ
cccЅІЅEEEхххМММ
EEE;;;ГДДщщщћћћўўўџџџхххRRRрррУУУ
RRRЌЌЌ
ccc
{{{ежж§§§џџџџџџввв
cccrrr
kkkrrr
RRR{{{ЫЫЫххх000щщщ  џџџџџџџџџџџџџџџџџџџџџџџџџџџИИќўўџџџ[ЬГИУьуќўўџџџ[ЬГИйЧџџџ[ЬГИйЧљ§ќџџџџџџeЯИИvжСѓќњџџџџџџЋфи%КИИИИИљ§ќBкЛ)еВ*мИvb
)еВ)еВ*мИЌЌЌccc

#В*йЖ)еВ+уНvb
*йЖ)еВєо1VNЫЫЫ{{{іііџџџщщщ;;;ЌЌЌџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџcccхххџџџ
EEEЌЌЌRRR\\\
((((((хххџџџџџџџџџ
RRR;;;(((000хххџџџџџџџџџџџџежж;;;(((ЅІЅщщщџџџџџџџџџџџџџџџџџџ
RRR;;;{{{ГДД
RRR(((ЌЌЌкккљљљџџџрррRRR{{{МММЌЌЌ
EEEkkk
kkk(((
рррўўўџџџїїї
EEEEEERRR(((EEEccc
\\\cccГДД;;;ЌЌЌююю  џџџџџџџџџџџџџџџџџџџџџџџџџџџИИќўўџџџ[ЬГИУьуќўўџџџ[ЬГИйЧџџџ[ЬГИйЧљ§ќџџџџџџeЯИИvжСѓќњџџџџџџџџџзђьvжС[ЬГGЦЊИИљ§ќBкЛ)еВ+уН1)%К*йЖ)еВ)еВ*мИ1)ЌЌЌccc
QD'ХЅ*йЖ)еВ*мИ#В
$QD'ХЅ*йЖєоRqjRRRГДДЫЫЫМММ000ЫЫЫ{{{іііџџџЌЌЌУУУџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџcccхххџџџ
000kkk(((ЅІЅ
\\\{{{(((RRRУУУѓѓѓџџџџџџѓѓѓccccccrrr{{{;;;кккўўўџџџџџџџџџежж;;;(((ЅІЅщщщџџџџџџџџџџџџџџџџџџ
EEE\\\
EEE{{{EEEГДДRRRМММѓѓѓџџџежжEEEccc(((ccc000МММ000;;;{{{RRRУУУюююџџџџџџююю\\\{{{(((000;;;;;;000RRR{{{;;;000ГДДccc000rrr;;;cccЫЫЫїїї  џџџџџџџџџџџџџџџџџџџџџџџџУьуИИќўўџџџ[ЬГИGЦЊУьуКщп%КИрбзђьRЩЏИeЯИУьузђьџџџeЯИИИЋфиКщпоїђџџџЋфиУьуЪєыvжСИ?ПЅўџџBкЛ*йЖ ЄdS'ХЅ)зД)еВ)еВ+уНvb
ЌЌЌccc
z)еВ)еВ)еВ)еВ-шТA6
#В*мИwѓкЅІЅвввkkk

кккEEEГДДМММEEEEEEнннџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџўўўћћћџџџ\\\нннџџџ
\\\кккћћћrrrююю§§§џџџџџџЫЫЫ;;;000МММRRRrrr((({{{ГДДщщщљљљљљљџџџввв;;;(((ЅІЅщщщџџџџџџџџџџџџџџџЅІЅ;;;ЌЌЌ;;;RRRюююУУУ
((((((ежжљљљхххRRRRRR;;;ежж№ёёМММ
{{{юююћћћџџџџџџррр;;;cccccc{{{rrr
рррkkk(((УУУюююўўў  џџџџџџџџџџџџџџџџџџџџџџџџИИИќўўџџџ[ЬГИИИИИ?ПЅѓќњ[ЬГИИИИGЦЊќўўeЯИИИИИeЯИѓќњ8СЃИИИИрбџџџBкЛ+уНdS
)еВ)еВ)еВ)еВ*йЖ'ХЅ
$ЌЌЌccc1)%К*йЖ)еВ)еВ)еВ+уНvb
}i)гАwѓк№ёёkkk
џџџ

ГДДџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџѓѓѓккквввEEEkkkЌЌЌввв{{{
EEERRR000рррљљљџџџљљљЅІЅEEE;;;cccУУУїїї§§§џџџџџџџџџRRRежжУУУ;;;000{{{;;;RRRЌЌЌУУУУУУвввМММ;;;(((ЅІЅщщщџџџџџџџџџџџџџџџУУУ
RRRнннхххEEE;;;EEEЅІЅљљљџџџкккRRR\\\МММ\\\ccc§§§џџџююю{{{
000УУУ
;;;EEE;;;rrrхххіііўўў§§§ЫЫЫ\\\;;;RRRЅІЅіііћћћџџџџџџџџџежжRRRГДД(((
{{{
kkkГДДЌЌЌRRR;;;\\\ГДДѓѓѓіііrrrcccEEE;;;{{{кккѓѓѓ§§§џџџ  џџџџџџџџџџџџџџџџџџџџџџџџйЧйЧйЧќўўџџџЋфирбУьуvжСRЩЏрбщћїџџџЋфи8СЃИRЩЏйЧЋфиўџџЋфийЧЋфийЧRЩЏvжСщћїЋфиeЯИRЩЏvжСКщпљ§ќџџџBкЛ*йЖ%К*йЖ)еВ)еВ)еВ)еВ+уНQDЌЌЌcccvb)ЭЌ)зД)еВ)еВ)еВ*мИ#В
$A6%КlтЪщћїџџџУУУrrrEEEcccУУУћћћџџџEEE\\\RRRхххџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџЫЫЫkkk(((
;;;RRR{{{\\\
\\\ЫЫЫїїї§§§§§§џџџџџџџџџџџџўўў§§§ћћћ§§§ўўўџџџџџџџџџџџџrrr
rrrхххљљљkkk{{{

;;;RRR\\\EEErrrЅІЅ;;;000ГДДщщщџџџџџџџџџџџџџџџџџџЅІЅ
EEE{{{ЌЌЌрррўўўўўўћћћћћћ§§§џџџџџџџџџџџџўўў§§§ўўў§§§§§§џџџџџџхххRRR(((вввюююУУУ
RRRМММѓѓѓ§§§§§§ўўўџџџџџџџџџџџџ§§§ћћћ§§§ўўўџџџџџџџџџљљљЅІЅ
{{{ЫЫЫRRR
ЅІЅЫЫЫEEEГДДюююўўў§§§ћћћ§§§ўўўљљљrrrежжљљљћћћ§§§џџџџџџџџџ  џџџџџџџџџџџџџџџџџџџџџџџџѓќњeЯИeЯИѓќњџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ[ЬГИйЧљ§ќџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџBкЛ)ЭЌ Є Є#В)гА)еВ)еВ)еВ)еВ)еВ)зД'ХЅЋфиОГ)ЭЌ)еВ)еВ)еВ)еВ)еВ)еВ*йЖ#В Є Є)ЭЌlтЪщћїџџџџџџџџџџџџџџџџџџџџџџџџ{{{іііџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџccc;;;RRR
rrrнннћћћџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџнннEEE;;;МММѓѓѓџџџ
rrrррр\\\МММ;;;EEEкккѓѓѓџџџџџџџџџџџџџџџџџџЫЫЫEEEрррўўўџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџюююrrrџџџџџџУУУ
cccЫЫЫљљљџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ№ёёrrrУУУххх;;;вввррр000;;;ЫЫЫ№ёёџџџџџџџџџџџџџџџљљљrrrррр§§§џџџџџџџџџџџџџџџ  џџџџџџџџџџџџџџџџџџџџџџџџУьуИИУьуўџџџџџџџџџџџџџџџџџџџџџџџџџџџџџзђьvжСрбќўўџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџBкЛ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВИђц|ха0жЕ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВlтЪщћїџџџџџџџџџџџџџџџџџџџџџџџџ{{{іііџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ000;;;;;;;;;;;;;;;000{{{kkk

љљљўўўџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџУУУRRR(((џџџ§§§џџџЫЫЫRRR000џџџџџџщщщRRR;;;;;;\\\МММнннrrr((({{{џџџ§§§џџџџџџџџџџџџџџџџџџџџџЅІЅ
ћћћўўўџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџўўўџџџЫЫЫ№ёё§§§џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ№ёёkkk;;;\\\љљљіііМММ000EEEљљљііі;;;RRRіііћћћџџџџџџџџџџџџџџџљљљrrr
кккѓѓѓўўўџџџџџџџџџџџџџџџ  џџџџџџџџџџџџџџџџџџџџџџџџџџџйЧйЧќўўџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџBкЛ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВИђц|ха0жЕ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВlтЪщћїџџџџџџџџџџџџџџџџџџџџџџџџМММ;;;ѓѓѓџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџўўў§§§§§§§§§§§§§§§§§§џџџхххММММММхххџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџўўўўўўўўўџџџџџџџџџџџџўўўўўўўўўџџџџџџџџџџџџўўў§§§§§§§§§ўўўџџџџџџўўўўўўџџџџџџџџџџџџџџџџџџџџџџџџџџџ№ёёМММЫЫЫџџџ§§§џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџѓѓѓГДДУУУхххџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџўўўўўўўўўџџџџџџџџџўўўўўўўўўџџџџџџўўўўўўўўўџџџџџџџџџџџџџџџџџџўўўнннММММММћћћўўўџџџџџџџџџџџџџџџџџџ  џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџBкЛ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВИђц|ха0жЕ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВlтЪщћїџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ  џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџBкЛ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВИђц|ха0жЕ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВlтЪщћїџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ  џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџыл5иЗ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ5иЗщћїоїђBкЛ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВ)еВИђцџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ  џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ  џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ  џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ  џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ  