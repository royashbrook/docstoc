
'URL = WScript.Arguments.Item(0)

With CreateObject("InternetExplorer.Application")
	.Visible = true
	.Navigate "http://instapaper.com/u"

  Do Until .ReadyState = 4
    Wscript.sleep 10
  Loop

	np = ""
Do
	np = ""
	for each link in .document.links
		if InStr(link.InnerText,"Older items »") > 0 then
			Wscript.echo link
			np = link
		end if
		if InStr(link,"text?") > 0 then
			Wscript.echo link
		end if
	next
	
	if np <> "" then
		.Navigate np
		Do Until .ReadyState = 4
			Wscript.sleep 10
		Loop
	end if
	
Loop while np <> ""


Wscript.echo "done"
Wscript.sleep 100000
  .Quit
End With


