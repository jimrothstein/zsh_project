## ====================================================
# file <- ".secret "
# 
# PURPOSE:  Store various api id's, secrets etc.
#
# GIT:  ignores this file.
#
# LONGER TERM:  Move these codes to ~/.Renviron and write Rscript to extract
# and place into environment variables so zsh scripts can access.
### ====================================================

#
# For google people api
# oauth2  client_id=
# # client_secret=
#
#
#
#
#
# SCRATCH SPACE
# ===============
#
#  for Google People, this is request (in browser)
https://accounts.google.com/o/oauth2/v2/auth?client_id=<snip>&redirect_uri=urn:ietf:wg:oauth:2.0:oob&scope=https://www.googleapis.com/auth/userinfo.profile&response_type=code


returns:

4/1A<snip>4





#   Returns access token
curl -s \
--request POST \
--data "code=snipclient_id=<SNIP>&client_secret=SNIP&redirect_uri=urn:ietf:wg:oauth:2.0:oob&grant_type=authorization_code" \
https://accounts.google.com/o/oauth2/token 


curl -s \
--request POST \
--data "\
code=$code& \
client_id=$client_id& \
client_secret=client_secret& \
redirect_uri=urn:ietf:wg:oauth:2.0:oob&grant_type=authorization_code" \
https://accounts.google.com/o/oauth2/token 



RETURNS access token:

{
  "access_token": "SNIP",
  "expires_in": 3599,
  "refresh_token": "SNIP",
  "scope": "https://www.googleapis.com/auth/userinfo.profile",
  "token_type": "Bearer",
  "id_token": "SNIP"
}%


LETS USE IT

curl -H 'Accept: application/json' -H "Authorization: Bearer SNIP \
https://people.googleapis.com/v1/people/me?personFields=names

no matches found?
