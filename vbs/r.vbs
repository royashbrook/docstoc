on error resume next
html=WScript.Arguments.Item(0)	'could be using http
word="C:\Users\roy\Desktop\docs\" & Right(html,9) & ".docx"

With CreateObject("InternetExplorer.Application")
	.Navigate html
	Do Until .ReadyState = 4
		Wscript.sleep 1000
	Loop
	.document.body.createTextRange.execCommand("Copy")
	Do Until .ReadyState = 4
		Wscript.sleep 1000
	Loop
	.Quit
End With
Wscript.sleep 15000

With CreateObject("Word.Document")
	.Content.Paste
	.SaveAs word
	.Close
End With
Wscript.sleep 15000


Wscript.echo html & " is now saved as " & word