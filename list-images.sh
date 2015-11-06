#!/bin/bash

# copy .env.default to .env and fill in missing values
source .env

curl -X GET "https://api.digitalocean.com/v2/images?page=1" -H "Authorization: Bearer $TOKEN"
