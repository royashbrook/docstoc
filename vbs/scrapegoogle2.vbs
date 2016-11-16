
URL = WScript.Arguments.Item(0)
URI = "http://www.google.com/search?q=allintitle:+" & URL & "&hl=en&prmdo=1&num=10&lr=&ft=i&cr=&safe=images&tbs=,qdr:m"

Set http = CreateObject("MSXML2.ServerXMLHTTP.6.0")
http.open "GET", URI, FALSE
http.send ""
WScript.Echo http.responseText

set http = nothing