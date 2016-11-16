getyahoomostemailedtitles
getgooglehourlywords

sub wiki(url)
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
		AddLinkToIP(link)
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
    
'ip is here
Sub AddLinkToIP(URL)
	URL = Replace(URL,"http://","")
	URI = "https://www.instapaper.com/api/add?username=emanretla@gmail.com&password=p&url=" & URL
	With CreateObject("MSXML2.ServerXMLHTTP.6.0")
		.open "GET", URI, FALSE
		.send ""
		WScript.Echo .responseText & "	" & URI
	End With
	Wscript.sleep 1000
End Sub

Sub GetYahooMostEmailedTitles
	u3 = "http://rss.news.yahoo.com/rss/mostemailed"
	With CreateObject("InternetExplorer.Application")
		.Visible = true
	  .Navigate u3
	  Do Until .ReadyState = 4
	    Wscript.sleep 10
	  Loop
	
	s = ""
	  int i = 0
	  for each link in .document.links
		i=i+1
		if i > 7 and i < 58 and trim(link.innerText) <> "" then
			s= split(link,"*")(1)
			Wscript.echo s
			AddLinkToIP(s)
			'send this keyword to wikipedia for scraping
		end if
	  next
	  .Quit
	End With
End Sub

Sub GetGoogleHourlyWords()
	u1 = "http://www.google.com/trends/hottrends/atom/hourly"
	With CreateObject("InternetExplorer.Application")

	  .Navigate u1
	  Do Until .ReadyState = 4
	    Wscript.sleep 10
	  Loop
	    
	  int i = 0
	  for each link in .document.links
		i=i+1
		if i > 4 and i < 25 then
			Wscript.echo link.innerText
			wiki(link.innerText)
			'send this keyword to wikipedia for scraping
		end if
	  next

	  .Quit
	End With
End Sub