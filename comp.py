import requests

data = requests.get("http://data.smartdublin.ie/cgi-bin/rtpi/busstopinformation?format=json").json()
print data["errorcode"]
