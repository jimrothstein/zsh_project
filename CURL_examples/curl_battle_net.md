file <- "curl_battle_net.md"

# =======================================
PURPOSE:        CURL for Battle.net API
USES:   Authentication Code Flow
# =======================================

```
Client_ID
Client_Secret
Client_Name=client_jim
redirect_uri=http://example.com

```
 In shell:
       Client_ID=$(Rscript -e "cat(Sys.getenv('Client_ID'))")
       echo $Client_ID

Client_Secret=$(Rscript -e "cat(Sys.getenv('Client_Secret'))")
echo $Client_Secret
```


