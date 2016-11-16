
Title = WScript.Arguments.Item(0)
URL = WScript.Arguments.Item(1)
URI = "https://www.instapaper.com/api/add?username=emanretla@gmail.com&password=p&title=" & Title & "&url=" & URL

With CreateObject("MSXML2.ServerXMLHTTP.6.0")
	.open "GET", URI, FALSE
	.send ""
	WScript.Echo .responseText & "	" & URI
End With

Wscript.sleep 1200