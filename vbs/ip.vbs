
URL = WScript.Arguments.Item(0)

With CreateObject("InternetExplorer.Application")
	.Navigate "https://www.instapaper.com/api/add?username=emanretla@gmail.com&password=p&url="
  Do Until .ReadyState = 4
    Wscript.sleep 10
  Loop
  
  .Quit
End With