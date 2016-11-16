
'scrapepage.vbs
args = WScript.Arguments.Count

if args <> 1 then
  Wscript.Echo "usage: ScrapeLinks.vbs URL"
  wscript.Quit
end if

URL = WScript.Arguments.Item(0)

With CreateObject("InternetExplorer.Application")
  .Navigate URL
  Do Until .ReadyState = 4
    Wscript.sleep 10
  Loop
.Print'.ExecWB 6,2
  
  .Quit
End With