import requests

data = requests.get("http://data.smartdublin.ie/cgi-bin/rtpi/busstopinformation?format=json").json()

stopsArr = [ str(x["stopid"]) for x in data["results"] ]

print stopsArr
