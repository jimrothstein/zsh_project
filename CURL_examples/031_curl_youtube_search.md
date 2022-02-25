
#PLACEHOLDER

#   file <- "031_curl_youtube_search.md#"

# =======================================================================
#    PURPOSE:    Use curl, plus authorization tokens, to search Youtube
#    PLACEHOLDER

# =======================================================================
##  From Google Explorer, simple search for "Lennon Sisters"
curl \
  'https://youtube.googleapis.com/youtube/v3/search? \
#------------------------------------------------------
  part=snippet&q=Lennon%20Sisters&key=[YOUR_API_KEY]' \
  --header 'Authorization: Bearer [YOUR_ACCESS_TOKEN]' \
  --header 'Accept: application/json' \
  --compressed
exit
