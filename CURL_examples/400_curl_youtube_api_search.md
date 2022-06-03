# ----------------------------
#	file <- "400_curl_youtube_api_search.md"
# ----------------------------
#
# =========================
#   Simple youtube search
#
#   PURPOSE:  Use curl alone, simple search in youtube api
#
# 	USAGE:  Assemble all the pieces, except Bearer token, to run CURL  
# 	        Because no Bearer token, do NOT expect to work
# 	        USE neovim terminal.
						,tt to open terminal
#		NOTE:		,tl will run code in neovim terminal
#		STATUS:
#						Fri Jun  3 00:17:16 PDT 2022 - youtube response is very angry.
# =========================
#
#
#
# ============================================================

#### Assemble Google urls
```
# for Comments
base_url=https://www.googleapis.com/youtube/v3/commentThreads
#	for Playlists (need Oauth2)
base_url=https://www.googleapis.com/youtube/v3/playlists

{
auth_url=https://accounts.google.com/o/oauth2/v2/auth
token_url=https://oauth2.googleapis.com/token
}
```

### Retrieve from ~/.Renviron
```
{


client_id=$(Rscript -e "cat(Sys.getenv('OAUTH2_ID'))")
client_secret=$(Rscript -e "cat(Sys.getenv('OAUTH2_SECRET'))")
API_KEY=$(Rscript -e "cat(Sys.getenv('API_KEY'))")
}
```

####	Set scope
```

##	for commentThreads
scope = "https://www.googleapis.com/auth/youtube"

##	for playlists
scope = "https://www.googleapis.com/auth/youtube https://www.googleapis.com/auth/youtube.force-ssl"
```

# =============
# Google CLIENT_ID (for oauth2), refers to this as key
url=https://youtube.googleapis.com/youtube/v3/search?key=${client_id}
echo ${url}

url=${url}'?part=snippet&maxResults=5&q=Lennon%20Sisters'

echo ${url}


curl -v $url \
  --header 'Accept: application/json' \
  --compressed

exit


#PLACEHOLDER


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
vi:nospell
