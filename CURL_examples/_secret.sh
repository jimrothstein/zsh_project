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

# api_key=AIzaSyBNzjqVeBuz4WPeR-UhTVuwIEcEI2hMBGU
#
# For google people api
# oauth2  client_id=358088442289-amr4b5f5l1h9jicffu12d9t1vooiv10d.apps.googleusercontent.com
# client_secret=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
#
#
#
#
#
# SCRATCH SPACE
# ===============
#
#  for Google People, this is request (in browser)
https://accounts.google.com/o/oauth2/v2/auth?client_id=358088442289-amr4b5f5l1h9jicffu12d9t1vooiv10d.apps.googleusercontent.com&redirect_uri=urn:ietf:wg:oauth:2.0:oob&scope=https://www.googleapis.com/auth/userinfo.profile&response_type=code


returns:
4/1AX4XfWjFijIknfSc2JZWxdaiAiBolHJ0XAwjESfU8OaEcpzS9SqHwiD8q_4

code= 4/1AX4XfWjFijIknfSc2JZWxdaiAiBolHJ0XAwjESfU8OaEcpzS9SqHwiD8q_4
client_id=358088442289-amr4b5f5l1h9jicffu12d9t1vooiv10d.apps.googleusercontent.com
client_secret=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




#   Returns access token
curl -s \
--request POST \
--data "code=4/1AX4XfWjJOZX1fbV3FhIfsiOzawxeOM2D2jB2cv8uQI64uKJl94eNsKHDc9Y&client_id=358088442289-amr4b5f5l1h9jicffu12d9t1vooiv10d.apps.googleusercontent.com&client_secret=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&redirect_uri=urn:ietf:wg:oauth:2.0:oob&grant_type=authorization_code" \
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
  "access_token": "ya29.A0ARrdaM_6yr3YdXXpt3NpuB6_fCHNmSeINKlQpD35d6GNxQInCk6O1xaOJocm0oL8QMp2txR4
pnNzC5AIxTxqVXsHuFNpdRsVAVIJ4znYLRH55KeANbiwTGlTrCP9nLZz_UWagg5TJeyFjRo2wz3XWaeSDeLk",
  "expires_in": 3599,
  "refresh_token": "1//06di69HHepwyyCgYIARAAGAYSNwF-L9IrSU4hmKsM1PjqVFzL6zaQJXt_KScP2_MbKI7eKD8cN_
D-sd78driiwYTs0gmt_b4gVFw",
  "scope": "https://www.googleapis.com/auth/userinfo.profile",
  "token_type": "Bearer",
  "id_token": "eyJhbGciOiJSUzI1NiIsImtpZCI6IjE4MmU0NTBhMzVhMjA4MWZhYTFkOWFlMWQyZDc1YTBmMjNkOTFkZjg
iLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJhY2NvdW50cy5nb29nbGUuY29tIiwiYXpwIjoiMzU4MDg4NDQyMjg5LWFtcjRiNWY1bD
FoOWppY2ZmdTEyZDl0MXZvb2l2MTBkLmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tIiwiYXVkIjoiMzU4MDg4NDQyMjg5LWFt
cjRiNWY1bDFoOWppY2ZmdTEyZDl0MXZvb2l2MTBkLmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tIiwic3ViIjoiMTExNzEyNj
k3MDA0OTM0NzMwMzMzIiwiYXRfaGFzaCI6IkdNR3g4enliYWwtM0RfTkFrak9DOXciLCJpYXQiOjE2NDQxNDM0MDcsImV4cCI6
MTY0NDE0NzAwN30.JYLDMmgrROFsm4DmES3EPuc_mbMC0Ld6yyHpf01eFJ_D2CKjFIK1y1vd5jpvVgRPmoq4hZCL4R_JdIqTwn
-CEW8EWt0CDwhYR31NymqDb9ynT-oDUSfmkdGPY4rUH3ODZsVYTB8pmmhiG3Fz74Oadzi2XpJABUKOZ-1CxirQ5u-FX86sj2wC
QDlP9Dqn28xKcadZ9H91ikquS41L2i13_QStCnADjbse6SPuk4cMTRarZyO35miZBWllm_VKCl0pd83ALYM32p8zS2Z33qV0qu
2HRvqCnODO1Utt706QDr-_vI9MzLhRnnnzQ2C0wtc5SHnry8Blq9sMZRjLYk-GJQ"
}%


LETS USE IT

curl -H 'Accept: application/json' -H "Authorization: Bearer ya29.A0ARrdaM_6yr3YdXXpt3NpuB6_fCHNmSeINKlQpD35d6GNxQInCk6O1xaOJocm0oL8QMp2txR4pnNzC5AIxTxqVXsHuFNpdRsVAVIJ4znYLRH55KeANbiwTGlTrCP9nLZz_UWagg5TJeyFjRo2wz3XWaeSDeLk" \
https://people.googleapis.com/v1/people/me?personFields=names

no matches found?
