# Exploring relationships between airports around the world
This project would explore the relationship between different airports around the world in terms of number of airline routes they connect to. It uses data from the OpenFlight official website.                              
By: Esi Yeenuwa Yeboah


# Introduction


This project would explore the relationship between different airports around the world in terms of number of airline routes they connect to. It would further draw relationships between the number of airline routes of airports in a country and the level of economic development that country around the world. It would make use of tools such as R and Ghephi to explore these relationships and make graphical illustrate of them. It uses data from the OpenFlight official website.

Air Transportation


Air transport is by far the fastest means of transportation around the globe. While ariline flights are usually used for human transportation, they are sometimes used to ship high value commodity, which are often perishable and time-sensitive. It carries about 0.5% of the volume of the worlds trade shipment. About 8.7 million people work directly in the aviation industry world wide. For more information, visit  http://www.atag.org/facts-and-figures.html


# Data Source


The airport data for this project was obtained from http://openflights.org/data.html 

Aiprorts data

The data contains information on some 6977 airports around the globe. It has data on the Airport ID, Name, City, Country, FAA(A three letter code for a country ),ICAO() longitude, latitude and others. 
To obtain the data, navigate to
http://openflights.org/data.html. Click airport.dat link to download data.

Airline routes data

The routes data is directional. If an airline operates from A to B and from B to A, both are listed in the data. Although the routes data does not contain the names of airports, it contains code that makes it possible to link the data to the airport data.
To obtain the data, navigate to 
http://openflights.org/data.html. Click routes.dat link to download data.



# References:

Atag (2015). Facts & Figures. Retrieved from http://www.atag.org/facts-and-figures.html on 31/03/2015

#Organisation of Data

Cleaning data

preprocAustralia.sh contains the code for the script files that must be run on the run to clean the raw data(airports.dat and routes.dat)
airports.gml was the file that was created after running the preprocAustrlia.sh script using Cigwin



degree.png and modularity.png contains pictures of graphs produced in Gephi when the airport nodes were grouped based on its degree and its modularity class. The gephisummary.csv contains the results that was obtained when various statics like Modularity, degree and clossness centrality werer run

R Code
The rScript.r file contains that R code the was used to produce a graph of the the various geographic regions of the airport nodes and their modularity.

Excecl

the "least and most active airlines charts.xlsx"  contains the graphs tht contain the information on the busiest airports and the least busiest airports.

Power Point
Airports Slides.pot  contains slides to explain the whole project
