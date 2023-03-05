B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=9.85
@EndOfDesignText@
#Region Shared Files
#CustomBuildAction: folders ready, %WINDIR%\System32\Robocopy.exe,"..\..\Shared Files" "..\Files"
'Ctrl + click to sync files: ide://run?file=%WINDIR%\System32\Robocopy.exe&args=..\..\Shared+Files&args=..\Files&FilesSync=True
#End Region

'Ctrl + click to export as zip: ide://run?File=%B4X%\Zipper.jar&Args=Project.zip

Sub Class_Globals
	Private Root As B4XView
	Private xui As XUI
End Sub

Public Sub Initialize
	
End Sub

'This event will be called once, before the page becomes visible.
Private Sub B4XPage_Created (Root1 As B4XView)
	Root = Root1
	Root.LoadLayout("MainPage")
End Sub

'You can see the list of page related events in the B4XPagesManager object. The event name is B4XPage.

Sub Button1_Click
	xui.MsgboxAsync("Hello world!", "B4X")
	
	Dim avc As ActivityViewController
	File.Copy(File.DirAssets,"rel.png",File.DirLibrary,"rel.png")
	avc.Initialize("avc", Array(CreateFileUrl(File.DirLibrary, "1.pdf")))
	'avc.Show(Page1, Page1.RootPanel)
End Sub


'Doesn't work with assets files. You must first copy them.
Sub CreateFileUrl (Dir As String, FileName As String) As Object
	Dim no As NativeObject
	no = no.Initialize("NSURL").RunMethod("fileURLWithPath:", Array(File.Combine(Dir, FileName)))
	Return no
End Sub

Sub avc_Complete (Success As Boolean, ActivityType As String)
   Log($"Success: ${Success}, ActivityType: ${ActivityType}"$)
End Sub