ScrapeIP()

Sub ScrapeIP()
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
				'GetDoc(link)
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
	  .Quit
	End With
End Sub

Sub GetDoc(html)
	on error resume next
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
	Wscript.sleep 10000

	With CreateObject("Word.Document")
		.Content.Paste
		.SaveAs word
		.Close
	End With
	Wscript.sleep 10000


	Wscript.echo html & " is now saved as " & word
	on error goto 0
End Sub


