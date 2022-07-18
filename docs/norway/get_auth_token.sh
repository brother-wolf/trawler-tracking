#!/bin/bash

# curl -X POST -H "Content-Type: application/x-www-form-urlencoded" -d "client_id=barentswatch.6oygd@simplelogin.co:ttrack&scope=api&client_secret=gbACTqKDjV5qwYxCpsKP&grant_type=client_credentials" https://id.barentswatch.no/connect/token


YOUR_CLIENT_ID=barentswatch.6oygd@simplelogin.co:ttrack
YOUR_CLIENT_ID_URL_ENCODED=barentswatch.6oygd%40simplelogin.co%3Attrack
YOUR_CLIENT_SECRET=gbACTqKDjV5qwYxCpsKP

# curl -X POST --header "Content-Type: application/x-www-form-urlencoded" -d "client_id=${YOUR_CLIENT_ID_URL_ENCODED}&scope=api&client_secret=${YOUR_CLIENT_SECRET}&grant_type=client_credentials" https://id.barentswatch.no/connect/token


# curl --location --request POST 'https://id.barentswatch.no/connect/token' \
#   --header 'content-type: application/x-www-form-urlencoded' \
#   --data-urlencode 'client_id='${YOUR_CLIENT_ID_URL_ENCODED} \
#   --data-urlencode 'scope=api' \
#   --data-urlencode 'client_secret='${YOUR_CLIENT_SECRET} \
#   --data-urlencode 'grant_type=client_credentials'


curl -X POST --header "Content-Type: application/x-www-form-urlencoded" -d "client_id=${YOUR_CLIENT_ID}&scope=api&client_secret=${YOUR_CLIENT_SECRET}&grant_type=client_credentials" https://id.barentswatch.no/connect/token
