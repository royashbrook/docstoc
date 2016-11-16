
URL = WScript.Arguments.Item(0)

With CreateObject("InternetExplorer.Application")
	.Navigate "http://en.wikipedia.org/wiki/Special:Search?search=" & URL & "&go=Go"
  Do Until .ReadyState = 4
    Wscript.sleep 10
  Loop
int i = 0
  for each link in .document.links
int x = 0
i = i+1
    if i > 7 and i < 30 then
	Wscript.echo link
	x = x + 1
	end if
  next

if x = 0 then
	Wscript.echo "failed on " & URL
end if
  
  .Quit
End With

    Wscript.sleep 5000