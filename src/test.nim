import httpclient
import json

var url = "http://data.smartdublin.ie/cgi-bin/rtpi/busstopinformation?format=json"


proc getJsonBusStops (urlToParse = ""):JsonNode =
    var http = newHttpClient()
    var jsonString = http.request(urlToParse,httpMethod= HttpGet).body()
    return parseJson(jsonString)

var jsonStops = getJsonBusStops(url)
echo jsonStops["errorcode"]

