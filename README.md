# Trawler Tracking

The aims of this project are to track [super] trawlers operating in Marine Conservation Areas.

It is in relation to the following bill going through the house of lords [at the time of writing 2022-07-05]: [Marine Protected Areas (Bottom Trawling) Bill [HL]](https://bills.parliament.uk/bills/3204)

Trawlers, particularly super-trawlers, cause massive damage to fish species and their habitats. Historically, in EU regulatory areas, fishing vessels have discarded by-catch and observers [if even present] were bribed/intimidated/undermined by fishing crews [1][2]. The EU passed legislation in 2019 requiring at least one observer on board before fishing activity could commence and that the observers were sufficiently trained to execute their duties [3] (UK adoption [4]).

### Possible data to use:

* AIS Messages
* OS Map coords for Marine Conservation Areas
* Port Authority data for ships in dock
* Copernicus [5] satellite imagery data


### Some issues:

* AIS Messages can be incomplete
  * ships can disable the AIS Transmitter
  * Messages may be incomplete or fail to transmit due to climatic reasons
* Port authority data
  * is probably not free
  * is unlikely to be in uniform structure between Ports
* Satellite data can be massive

### Some ideas:

* reduce problem to a single Marine Conservation Area (MCA)
* begin with unbroken data and track intercepts with MCA
  * probably graph problem [6]


## References

1. [EU Parliament Questions... Subject: Observers on board fishing vessels prevented from carrying out their duties](https://www.europarl.europa.eu/doceo/document/E-7-2012-006861_EN.html)
2. [The Guardian: Fishing observers 'intimidated and bribed by EU crews'](https://www.theguardian.com/environment/2012/may/18/fishing-inspectors-intimidated-bribed-crews)
3. [EU legislation](https://eur-lex.europa.eu/legal-content/en/TXT/?uri=CELEX:32019R0833#027)
4. [EU legislation adopted by UK](https://www.legislation.gov.uk/eur/2019/833/article/27/adopted)
5. [Copernicus Masters](https://copernicus-masters.com/)
6. [graph theory using python](https://python-course.eu/applications-python/graphs-python.php)
7. [Marine Protected Areas (MPAs) Fishery Management Areas Map & GIS Data](https://www.fisheries.noaa.gov/resource/map/marine-protected-areas-mpas-fishery-management-areas-map-gis-data)
