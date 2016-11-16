
URL = WScript.Arguments.Item(0)

With CreateObject("InternetExplorer.Application")
'  .Navigate "google.com/search?q=" & URL
	.Navigate "http://www.google.com/search?q=allintitle:+" & URL & "&hl=en&prmdo=1&num=10&lr=&ft=i&cr=&safe=images&tbs=,qdr:m"
  Do Until .ReadyState = 4
    Wscript.sleep 10
  Loop
int i = 0
  for each link in .document.links
int x = 0
i = i+1
    if i > 37 and i < 60 then
	Wscript.echo link
	x = x + 1
	end if
  next

if x = 0 then
	Wscript.echo "failed on " & URL
end if
  
  .Quit
End With