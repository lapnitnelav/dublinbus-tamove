import httpclient
import json
import os
import strutils

let url = "http://data.smartdublin.ie/cgi-bin/rtpi/busstopinformation?format=json"

proc getJsonBusStops (urlToParse = ""):JsonNode =
    var http = newHttpClient()
    let jsonString = http.request(urlToParse,httpMethod= HttpGet).body()
    return parseJson(jsonString)

let jsonStops = getJsonBusStops(url)
let results:int = jsonStops["numberofresults"].getInt()
echo "Results :"&intToStr(results)
var stopsString:string = "stopId,stopName\n"

for i in jsonStops["results"] :
    stopsString.add(i["stopid"].getStr()&","&i["shortname"].getStr()&"\n")

writeFile("stationsNim.csv",stopsString)

