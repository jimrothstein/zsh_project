#!/bin/zsh
# Status - as of 8 APR
#		HOLD:   b/c do not know what i'm doing
#		Code below returns lots of js; 3 cookies, but 
#		I see NO auth code
#		WAIT till know more.

auth_url=https://accounts.google.com/o/oauth2/v2/auth
token_url=https://oauth2.googleapis.com/token 
base_url=https://www.googleapis.com/youtube/v3
#								urn:ieff.wg.oauth:2.0:oob  (not secure, but OK) Method used
#								urn:ieff.wg.oauth:2.0:oob:auto (deprecated)
							
# redirect_uri=urn:ieff.wg.oauth:2.0:oob 
redirect_uri=http://127.0.0.1:5762/echo
echo $redirect_uri

# Per google docs, scopes are separated by whitespace
scope='https://www.googleapis.com/auth/youtube https://www.googleapis.com/auth/youtube.force-ssl'	

# Project 2 (in Google dashboard)
client_id=$(Rscript -e "cat(Sys.getenv('OAUTH2_ID'))")
client_secret=$(Rscript -e "cat(Sys.getenv('OAUTH2_SECRET'))")

# zsh '&' single quotes
echo \
curl -sL \
'https://accounts.google.com/o/oauth2/v2/auth?'\
'scope='$scope'&'\
'response_type=code&'\
'redirect_uri=http://127.0.0.1:6762/echo&'\
'client_id='$client_id

