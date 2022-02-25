#!/bin/zsh
# ----------------------------
# file <- "003_curl_youtube_api_search.sh
# ----------------------------
#
# =========================
#   Simple youtube search
#
#   PURPOSE:  Use curl alone, simple search in youtube api
# 	USAGE:  MUST have G API key for youtube	
#   SEE ALSO:  
# =========================
#
#
# ============================================================
#
#   STATUS:     says API KEY INVALID,  using either key= for api or oauth2
# ============================================================
# ussing api_key this way FAILS:   says extra characters
# api_key= do not store here

# Google CLIENT_ID (for oauth2), refers to this as key
ENDPOINT=https://youtube.googleapis.com/youtube/v3/search
PARM='?part=snippet&maxResults=5&q=Lennon%20Sisters'

##  Construct URL
#   use key=   (for Google)
#   use $key  for oauth2
#   use $api_key for api
URL=${ENDPOINT}?key=${key}
URL=${URL}${PARM}
echo $URL

echo "Running it ..."
# 
curl -v $URL \
  --header 'Accept: application/json' \
  --compressed

exit

