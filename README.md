# Trawler Tracking

The aims of this project are to track [super] trawlers operating in Marine Conservation Areas.

It is in relation to the Marine Protected Areas (Bottom Trawling) bill [1] going through the house of lords [at the time of writing 2022-07-05]. Furthermore Dogger Bank, a designated Marine Conservation Area, was finally given some legal protection closing large parts of it to Bottom Trawling. The legislation was signed in 8th April 2022 with the closure taking effect on 13th June 2022 [2].


Trawlers, particularly super-trawlers, cause massive damage to fish species and their habitats. Historically, in EU regulatory areas, fishing vessels have discarded by-catch and observers [if even present] were bribed/intimidated/undermined by fishing crews [3][4]. The EU passed legislation in 2019 requiring at least one observer on board before fishing activity could commence and that the observers were sufficiently trained to execute their duties [5] (UK adoption [6]).

### Possible data to use:

* AIS Messages
* OS Map coords for Marine Conservation Areas
* Port Authority data for ships in dock
* Copernicus [7] satellite imagery data


### Some issues:

* AIS Messages can be incomplete
  * ships can disable the AIS Transmitter [8]
  * Messages may be incomplete or fail to transmit due to climatic reasons
* Port authority data
  * is probably not free
  * is unlikely to be in uniform structure between Ports
* Satellite data can be massive

### Some ideas:

* reduce problem to a single Marine Conservation Area (MCA)
* begin with unbroken data and track intercepts with MCA
  * probably graph problem [9]


## References
1. [Marine Protected Areas (Bottom Trawling) Bill \[HL\] ](https://bills.parliament.uk/bills/3204)
2. (https://thefishingdaily.com/latest-news/danish-fishermen-face-uncertainty-as-uk-closes-important-fishing-grounds/)
3. [EU Parliament Questions... Subject: Observers on board fishing vessels prevented from carrying out their duties](https://www.europarl.europa.eu/doceo/document/E-7-2012-006861_EN.html)
4. [The Guardian: Fishing observers 'intimidated and bribed by EU crews'](https://www.theguardian.com/environment/2012/may/18/fishing-inspectors-intimidated-bribed-crews)
5. [EU legislation](https://eur-lex.europa.eu/legal-content/en/TXT/?uri=CELEX:32019R0833#027)
6. [EU legislation adopted by UK](https://www.legislation.gov.uk/eur/2019/833/article/27/adopted)
7. [Copernicus Masters](https://copernicus-masters.com/)
8. [AIS dark bottom trawling in the Dogger Bank](https://www.greenpeace.org.uk/resources/ais-dark-bottom-trawling-dogger-bank/)
9. [graph theory using python](https://python-course.eu/applications-python/graphs-python.php)
10. [Marine Protected Areas (MPAs) Fishery Management Areas Map & GIS Data](https://www.fisheries.noaa.gov/resource/map/marine-protected-areas-mpas-fishery-management-areas-map-gis-data)
10. [Bottom Trawling: Marine Protected Areas (Limited Text - Ministerial Extracts only)](https://parallelparliament.co.uk/debate/2022-06-28/commons/westminster-hall/bottom-trawling-marine-protected-areas/ministerial-extracts)
