SET TALK ON
SET NOTIFY ON
SET CLOCK OFF
SET COMPATIBLE OFF
SET PALETTE ON
SET BELL ON
SET BELL TO '', 1
SET SAFETY ON
SET ESCAPE ON
SET LOGERRORS ON
SET KEYCOMP TO WINDOWS
SET CARRY OFF
SET CONFIRM OFF
SET CENTURY on
SET BROWSEIMECONTROL OFF
SET STRICTDATE TO 1
*READ events
*CLEAR EVENTS

&& TabOrdering = 0
&& ResWidth = 640
&& ResHeight = 480
&& GridHorz = 12
&& GridVert = 12
&& ScaleUnits = 0
&& FormSetLib = 
&& FormSetClass = 
&& FormsLib = 
&& FormsClass = 
SET EXACT ON
SET NEAR OFF
SET ANSI OFF
SET LOCK OFF
SET EXCLUSIVE OFF
SET MULTILOCKS OFF
SET HEADINGS ON
SET DELETED OFF
SET OPTIMIZE ON
SET UNIQUE OFF
SET CPDIALOG ON
SET REFRESH TO 0,5
SET ODOMETER TO 100
SET BLOCKSIZE TO 64
SET REPROCESS TO 0
SET COLLATE TO ""
&& SCCProvider = 
STORE "C:\DOCUMENTS AND SETTINGS\ADMIN\MIS DOCUMENTOS\MI M�SICA\VISUAL FOX PRO 6 0 (ESPA�OL)\VFP98\SCCTEXT.PRG" TO _SCCTEXT
&& ProjectHookLib = 
&& ProjectHookClass = 
&& CrsBuffering = 1
&& CrsMethodUsed = 1
&& CrsWhereClause = 3
&& CrsFetchSize = 100
&& CrsMaxRows = -1
&& CrsNumBatch = 1
&& CrsUseMemoSize = 255
&& SQLDispLogin = 1
&& SQLTransactions = 1
&& SQLConnectTimeOut = 15
&& SQLIdleTimeOut = 0
&& SQLQueryTimeOut = 0
&& SQLWaitTime = 100
&& TMPFILES = c:\docume~1\admin\config~1\temp
SET PATH TO 
&& HelpTo = y:\fox26\foxhelp.dbf
SET HELP ON
*SET HELP TO "c:\fox26\foxhelp.dbf"
&& ResourceTo = y:\fox26\foxuser.dbf
SET RESOURCE ON
*SET RESOURCE TO "c:\fox26\foxuser.dbf"
STORE "d:\archivos de programa\microsoft visual studio\vfp98\wizard.app" TO _WIZARD
STORE "d:\archivos de programa\microsoft visual studio\vfp98\builder.app" TO _BUILDER
STORE "d:\archivos de programa\microsoft visual studio\vfp98\convert.app" TO _CONVERTER
STORE "d:\archivos de programa\microsoft visual studio\vfp98\spellchk.app" TO _SPELLCHK
STORE "d:\archivos de programa\microsoft visual studio\vfp98\genmenu.fxp" TO _GENMENU
STORE "d:\archivos de programa\microsoft visual studio\vfp98\browser.app" TO _BROWSER
STORE "d:\archivos de programa\microsoft visual studio\vfp98\gallery.app" TO _GALLERY
STORE "" TO _INCLUDE
STORE "d:\archivos de programa\microsoft visual studio\vfp98\beautify.app" TO _BEAUTIFY
STORE "" TO _GETEXPR
STORE "d:\archivos de programa\microsoft visual studio\vfp98\genhtml.prg" TO _GENHTML
STORE "d:\archivos de programa\microsoft visual studio\vfp98\runactd.prg" TO _RUNACTIVEDOC
STORE "" TO _STARTUP
STORE "" TO _SAMPLES
STORE "d:\archivos de programa\microsoft visual studio\vfp98\coverage.app" TO _COVERAGE
SET SYSFORMATS OFF
SET SECONDS ON
SET CENTURY OFF
&& CurrSymbol = $
SET CURRENCY LEFT
SET CURRENCY TO "$"
SET HOURS TO 12
SET DATE TO AMERICAN
SET DECIMALS TO 2
SET FDOW TO 1
SET FWEEK TO 1
SET MARK TO ""
SET SEPARATOR TO ","
SET POINT TO "."
&& DebugEnvironment = 0
SET TRBETWEEN OFF
STORE     0.00 TO _THROTTLE
&& DebugOutputFileName = 
&& TraceFontName = Courier New
&& TraceFontSize = 10
&& TraceFontStyle = 0
&& WatchFontName = MS Sans Serif
&& WatchFontSize = 8
&& WatchFontStyle = 0
&& LocalsFontName = MS Sans Serif
&& LocalsFontSize = 8
&& LocalsFontStyle = 0
&& OutputFontName = MS Sans Serif
&& OutputFontSize = 8
&& OutputFontStyle = 0
&& CallstackFontName = MS Sans Serif
&& CallstackFontSize = 8
&& CallstackFontStyle = 0
&& TraceNormalColor = RGB(0,0,0,255,255,255), Auto, Auto
&& TraceExecutingColor = RGB(255,255,0,0,0,0), NoAuto, Auto
&& TraceCallstackColor = RGB(0,0,0,212,208,200), Auto, Auto
&& TraceBreakpointColor = RGB(255,0,0,0,0,0), NoAuto, Auto
&& TraceSelectedColor = RGB(255,255,255,0,0,0), Auto, Auto
&& WatchNormalColor = RGB(0,0,0,255,255,255), Auto, Auto
&& WatchSelectedColor = RGB(255,255,255,0,0,0), Auto, Auto
&& WatchChangedColor = RGB(255,0,0,255,255,255), NoAuto, Auto
&& LocalsNormalColor = RGB(0,0,0,255,255,255), Auto, Auto
&& LocalsSelectedColor = RGB(255,255,255,0,0,0), Auto, Auto
&& OutputNormalColor = RGB(0,0,0,255,255,255), Auto, Auto
&& OutputSelectedColor = RGB(255,255,255,0,0,0), Auto, Auto
&& CallstackNormalColor = RGB(0,0,0,255,255,255), Auto, Auto
&& CallstackSelectedColor = RGB(255,255,255,0,0,0), Auto, Auto
PUBLIC p as String, c as String, wcod as String, wce as String
PUBLIC mon1 as String
PUBLIC gc_P_A_S_S as String
PUBLIC var1
gc_P_A_S_S="mispadres"
set default to C:\Sistema_VPS


open database y:\Sistema_VPS\caja
_screen.Visible= .F.
ON SHUTDOWN quit

DO FORM Formularios\frmprincipal.scx
READ events
_screen.Visible= .T.
SET EXCLUSIVE OFF

FUNCTION fmeses
*------------------------
parameter ParN
do case
	case parn = 1
		return 'Enero'
	case parn = 2
		return 'Febrero '
	case parn = 3
		return 'Marzo'
	case parn = 4
		return 'Abril'
	case parn = 5
		return 'Mayo'
	case parn = 6
		return 'Junio'
	case parn = 7
		return 'Julio'
	case parn = 8
		return 'Agosto'
	case parn = 9
		return 'Septiembre'
	case parn = 10
		return 'Octubre'
	case parn = 11
		return 'Noviembre'
	case parn = 12
		return 'Diciembre'
	case parn <= 0 .OR. parn >= 13
		return SPACE(0)	
ENDCASE

PROCEDURE ValidEMail(tcEmail)
  LOCAL oRE
  tcEmail = ALLTRIM(tcEmail)
  oRE = CREATEOBJECT("VBScript.RegExp")
  oRE.PATTERN = "^[A-Za-z0-9](([_.-]?[a-zA-Z0-9]+)*)@([A-Za-z0-9]+)(([.-]?[a-zA-Z0-9]+)*).([A-Za-z]{2,})$"
  RETURN oRE.Test(tcEmail)
ENDPROC