on error resume next
f="C:\Users\roy\Desktop\docs\" & WScript.Arguments.Item(0)	'could be using http

Set objWord = CreateObject("Word.Application")
objWord.Visible = True
Set objDoc = objWord.Documents.Open(f)

With objWord.Selection
	.Find.Execute "en.wikipedia.org"
	.HomeKey 5
	.MoveDown 5,3,1
	.Delete
	.MoveDown 5,1,1
	.Copy
End With
	
Set oHtml = CreateObject("htmlfile") 
newfile = oHtml.ParentWindow.ClipboardData.GetData("text") 
newfile = "C:\Users\roy\Desktop\docs\" & newfile & ".docx"
	
objDoc.SaveAs newfile
objWord.Quit
Set objWord = nothing

Wscript.sleep 5000

Wscript.echo f & " ==> " & newfile