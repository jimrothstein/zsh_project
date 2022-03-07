
``` 
 ----------------------------
 file <- "/home/jim/code/zsh_scripts_project/CURL_examples/010_curl_open_secrets_api.md"
 ----------------------------


```
#### In Browser
```
 http://www.opensecrets.org/api/?method=getLegislators&id=NJ&apikey=__apikey__
```

#### To retreive key
```

 In shell:
       key=$(Rscript -e "cat(Sys.getenv('OS_API_KEY'))")
       echo $key
```

#### Misc Notes
``` 
 From saveas as curl (in browser) appears that tranmis a cookie with session
 info.   Does this explain??   

 STEP #1   get OS_API_KEY = (see bottom)

 STEP #2   curl 
```

#### Curl Notes:   
```
Need Double quotation, single quotes will not expand $key
Note use of `&';  normally in bash/zsh this is special character.
However, use of `\&'  will generate error on server side
Result belows returns xml, use of -H for json appears to be ignored.
```

curl -s "www.opensecrets.org/api/?method=getLegislators&id=NJ&apikey=$key"

```

#### Also works ! (xml returned; json is ignored)
```
curl -s -G -d "apikey=$key" "www.opensecrets.org/api/?method=getLegislators&id=NJ"

curl -s -H "Accept: application/json" -G -d "apikey=$key" "www.opensecrets.org/api/?method=getLegislators&id=NJ"

```


####  Next:  Use config.txt
```
-w "Why does this not work? \n"
-D headers.txt
# fail-with-body  (I have old version)
-w "http_code= %{http_code}" (i have old curl version)
-v
```


