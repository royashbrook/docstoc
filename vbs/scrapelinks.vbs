
'ScrapeLinks.vbs
args = WScript.Arguments.Count

if args <> 1 then
  Wscript.Echo "usage: ScrapeLinks.vbs URL"
  wscript.Quit
end if

URL = WScript.Arguments.Item(0)

With CreateObject("InternetExplorer.Application")
  .Navigate URL
  Do Until .ReadyState = 4
    Wscript.sleep 10
  Loop
  for each link in .document.links
    Wscript.echo link, link.InnerText
  next

' Uncomment the three lines below to scrape references to images

'  for each pix in .document.images
'  Wscript.echo pix.src
'  next
  
  .Quit
End With