u1 = "http://en.wikipedia.org/wiki/Special:Random"

With CreateObject("InternetExplorer.Application")

  .Navigate u1
  Do Until .ReadyState = 4
    Wscript.sleep 10
  Loop
  Wscript.echo .LocationURL
  .Quit

End With
