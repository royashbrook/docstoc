' finished product will:
'	1. get keywords
'	2. convert keywords to wiki link urls
'	3. submit wiki urls to instapaper
'	4. convert instapaper to word (fixing titles)
'	5. clean out instapaper

' current:
'	1. for now keywords are genned externally and we just use a file path
'	2. 
' set our keyword file
kwfile = "C:\Users\roy\Desktop\My Dropbox\code\keywords\kw"
' process our keywords
kw2wiki2ip(kwfile)
'ip2word()

'read lines from a file, pass each set of keywords to the wiki process which will pass each link to IP
sub kw2wiki2ip(path)
	Set fso = CreateObject("Scripting.FileSystemObject")
	With fso.OpenTextFile(path, 1) 
		On Error Resume Next 
		Do Until .AtEndOfStream   
		Wscript.echo .ReadLine
		Loop
	End With
	set fso = nothing
end sub

sub wiki(kw)
	With CreateObject("InternetExplorer.Application")
		.Navigate "http://en.wikipedia.org/wiki/Special:Search?search=" & kw & "&go=Go"
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