wiki(WScript.Arguments.Item(0))

sub wiki(kw)
	url = "http://en.wikipedia.org/w/index.php?title=Special%3ASearch&redirs=1&search=" & kw & "&fulltext=Search&ns0=1&ns100=1&title=Special%3ASearch&advanced=1&fulltext=Advanced+search"
'	http://en.wikipedia.org/wiki/Special:Search?search=" & kw & "&go=Go"
	Wscript.echo "data coming from  --  " & url
	With CreateObject("InternetExplorer.Application")
		.Navigate url
		Do Until .ReadyState = 4
			Wscript.sleep 10
		Loop
		int i = 0
		for each link in .document.links
			int x = 0
			i = i+1
			if i > 7 and i < 30 then
				if Instr(link,"#") = 0 then
					Wscript.echo link
				end if	
				x = x + 1
			end if
		next
		if x = 0 then
			Wscript.echo "failed on " & URL
		end if
		.Quit
	End With
	Wscript.sleep 1000
end sub