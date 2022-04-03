Sat  02 Apr 2022

	
 PURPOSE:		Focus is Google API, youtube in particular. This is summary of
 using cURL to obtain authorization_code and then proceed querying youtube.

 USAGE:	This is a markdown, md, file.   All zsh code is treated as verbatim.
 To run the zsh, use the neovim terminal and then the short cut ,tl.

 Once something is working convert to a zsh script file.
 But THIS document be NEAT summary.

  *	 ~/.Renviron for secrets
	*	 Source:  https://developers.google.com/youtube/v3/guides/auth/installed-apps
	*  zsh, `&' is special.  Use single quotes around it to avoid errors.

REF:  https://stackoverflow.com/questions/53357741/how-to-perform-oauth-2-0-using-the-curl-cli#53357742et CLIENT_ID=Replace_with_your_Client_ID

#### Youtube constants
```
auth_url=https://accounts.google.com/o/oauth2/v2/auth
token_url=https://oauth2.googleapis.com/token 
base_url=https://www.googleapis.com/youtube/v3
uri_redirect=
# Per google docs, scopes are separated by whitespace
scope='https://www.googleapis.com/auth/youtube https://www.googleapis.com/auth/youtube.force-ssl'	

client_id=$(Rscript -e "cat(Sys.getenv('OAUTH2_ID'))")

```

####	Run this in neovim termina, copy+paste into browser, which asks user
permission and then returns auth.code !
```
echo \
'https://accounts.google.com/o/oauth2/v2/auth?'\
'client_id='$client_id'&redirect_uri=urn:ietf:wg:oauth:2.0:oob'\
'&scope='$scope'&response_type=code'
```

####	We now have auth code.



PURPOSE:    HTTR2::  Given ONE video,  return ALL Comments 
Authorization: Bearer [YOUR_ACCESS_TOKEN]
Accept: application/json


(1APR2022)

Google's example, with loop for uri_redirect
https://accounts.google.com/o/oauth2/v2/auth?
 scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fyoutube.readonly&
 response_type=code&
 state=security_token%3D138r5719ru3e1%26url%3Dhttps%3A%2F%2Foauth2.example.com%2Ftoken&
 redirect_uri=http%3A//127.0.0.1%3A9004&
 client_id=client_id


	-  Google's authorization server: https://accounts.google.com/o/oauth2/v2/auth

### Request:  appropriate query sent to:
GET https://www.googleapis.com/youtube/v3/commentThreads 


### From Explorer
GET https://youtube.googleapis.com/youtube/v3/playlists?part=snippet%2CcontentDetails&maxResults=5&mine=true&key=[YOUR_API_KEY] HTTP/1.1

Authorization: Bearer [YOUR_ACCESS_TOKEN]
Accept: application/json


###
same, but as Curl
    
curl \
  'https://youtube.googleapis.com/youtube/v3/playlists?part=snippet%2CcontentDetails&maxResults=5&mine=true&key=[YOUR_API_KEY]' \
  --header 'Authorization: Bearer [YOUR_ACCESS_TOKEN]' \
  --header 'Accept: application/json' \
  --compressed



###   From Google Playground
   https://youtube.googleapis.com/youtube/v3/commentThreads?videoId=Mec9sw1cJk8&part=snippet,replies
###







LEGACY
# =======================================================================================================================
#
#
# from Windows
# =======================================================================================================================
CLIENT_SECRET=Replace_with_your_Client_Secret
set SCOPE=https://www.googleapis.com/auth/cloud-platform
set ENDPOINT=https://accounts.google.com/o/oauth2/v2/auth

set URL="%ENDPOINT%?client_id=%CLIENT_ID%&response_type=code&scope=%SCOPE%&access_type=offline&redirect_uri=urn:ietf:wg:oauth:2.0:oob"

@REM start iexplore %URL%
@REM start microsoft-edge:%URL%
start chrome %URL%

set /p AUTH_CODE="Enter Code displayed in browser: "
# =======================================================================================================================

# translate to cURL
curl ^
--data client_id=%CLIENT_ID% ^
--data client_secret=%CLIENT_SECRET% ^
--data code=%AUTH_CODE% ^
--data redirect_uri=urn:ietf:wg:oauth:2.0:oob ^
--data grant_type=authorization_code ^
https://www.googleapis.com/oauth2/v4/token


