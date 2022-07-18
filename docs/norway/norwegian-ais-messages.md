# Norwegian AIS Messages

Having resoundingly failed to acquire free UK AIS Messages, I turned to the Norwegian government who offer free access to AIS Messages. I figured that if I couldn't track ships through UK Marine Conservation Areas I could at least test the theory with tracking ships through an arbitrary area of Norwegian Sea.

I had found a [StackOverflow response](https://opendata.stackexchange.com/questions/15329/free-source-of-ais-data-api/18537#18537) that lead me to the [Norwegian Coastal Administration](https://kystverket.no/) and their page on getting [Access to AIS data](https://kystverket.no/en/navigation-and-monitoring/ais/access-to-ais-data/). This pointed to BarentsWatch, a provider of API endpoints for AIS data, and their  [Application registration and authentication](https://wiki.barentswatch.net/display/BO/Application+registration+and+authentication) page.

After Registering, [logging in](https://www.barentswatch.no/minside/), creating a `client` and constructing a `curl` request:

```bash
curl --location --request POST 'https://id.barentswatch.no/connect/token' \
    --header 'content-type: application/x-www-form-urlencoded' \
    --data-urlencode 'client_id=barentswatch.6oygd@simplelogin.co:ttrack' \
    --data-urlencode 'scope=api' \
    --data-urlencode 'client_secret=gbACTqKDjV5qwYxCpsKP' \
    --data-urlencode 'grant_type=client_credentials'
```

I kept getting the following error:

```
{"error":"invalid_client"}
```

BarentsWatch has other [datasets for download](https://www.barentswatch.no/nedlasting/datasets) relating to ocean activity.

There is also the BarentsWatch [AIS API swagger page](https://live.ais.barentswatch.no/index.html#/AIS-Stream/get_v1_sse_ais) for live testing
