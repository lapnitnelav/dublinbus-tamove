import requests
import csv

data = requests.get("http://data.smartdublin.ie/cgi-bin/rtpi/busstopinformation?format=json").json()

print "Results :"+str(data["numberofresults"])
stopsArr = [ [x["stopid"],x["shortname"]] for x in data["results"] ]

with open("stationsPython.csv",'wb') as csvfile:
    stops = csv.writer(csvfile)
    stops.writerow(["stopId","stopName"])
    stops.writerows(stopsArr)

