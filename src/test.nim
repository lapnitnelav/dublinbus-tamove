import httpclient
import json

let url = "http://data.smartdublin.ie/cgi-bin/rtpi/busstopinformation?format=json"

proc getJsonBusStops (urlToParse = ""):JsonNode =
    var http = newHttpClient()
    let jsonString = http.request(urlToParse,httpMethod= HttpGet).body()
    return parseJson(jsonString)

let jsonStops = getJsonBusStops(url)
var stops = newSeq[string](0)

for i in jsonStops["results"] :
    stops.add(i["stopid"].getStr())

echo stops
