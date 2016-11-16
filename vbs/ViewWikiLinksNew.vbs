wiki(WScript.Arguments.Item(0))

sub wiki(kw)
	url = "http://en.wikipedia.org/w/index.php?title=Special%3AAllPages&from=" & kw & "&to=&namespace=0"
	set ie = CreateObject("InternetExplorer.Application") 
	With ie
		.Visible = true
		.Navigate url
		Do Until .ReadyState = 4
			sleep 10
		Loop
		do until ToFound(.document.body.innerHTML) = 0
			.navigate .document.links(3)
			Do Until .ReadyState = 4
				sleep 10
			Loop
		loop
		
		set links = .document.links
		for i = 5 to links.length
			set link = links(i)
			if instr(link.innerText,"Previous page") <> 0 then
				set link = nothing
				exit for
			else
				Wscript.echo link.innerText & " -- " & link
				set link = nothing
			end if
				
		next
		set links = nothing

	wait 100		
		.Quit
	End With
	set ie = nothing
end sub
Function ToFound(src)
    ptrn = "<td>\sto\s</td>"

    Set re = New RegExp
    re.Pattern = ptrn
    re.IgnoreCase = true
    re.Global = False
    ' Perform the search.
    Set Matches = re.Execute(src)

    ToFound = Matches.Count

End Function

sub wait(s)
	sleep s * 1000
end sub
sub sleep(s)
	Wscript.sleep s
end sub

		'Instr(.document.body.toString(),"<td> to </td>")
		'Wscript.echo .document.body.innerHTML
		'Wscript.echo Instr(.document.body.innerHTML,"<td> to </td>")
		'<TD> to </TD>ipt.echo .document.links(3).innerText & " -- " & .document.links(3)
		'int i = 0
		'for each link in .document.links
			'Wscript.echo link
'			Wscript.echo link.innerText
			'int x = 0
			'i = i+1
			'if i > 7 and i < 30 then
				'if Instr(link,"#") = 0 then
					'Wscript.echo link
				'end if	
				'x = x + 1
			'end if
'		next
	'	wait 30
		'if x = 0 then
			'Wscript.echo "failed on " & URL
		'end if
		
		
			'http://en.wikipedia.org/w/index.php?title=Special%3ASearch&redirs=1&search=" & kw & "&fulltext=Search&ns0=1&ns100=1&title=Special%3ASearch&advanced=1&fulltext=Advanced+search"
'	http://en.wikipedia.org/wiki/Special:Search?search=" & kw & "&go=Go"
	'Wscript.echo "data coming from  --  " & url