#   file <- "030_curl_neovim.md"

# =================================================
# https://nazarii.bardiuk.com/posts/vim-curl.html

#   PURPOSE:    cool way to filter buffer content and run with curl
#   USAGE:      COPY to SCRATCH BUFFER
#   
#   The solo `-` means to use buffer contents
#   Filter is like :% !sort
#   CAUTION:   RUN this and will REPLACE this file/buffer with result

# =================================================
:nnoremap <leader>cc vipyPgvO<Esc>O<Esc>gv:!curl --config -<CR>
# =================================================

--url http://httpbin.org
--get
--header  "User-Agent: vim/curl"
--silent
--show-error
--data a=b
--data-urlencode "c=a+b"
-w %{http_connect}
#run the command (will change BUFFER contents)

# NOTE the %
#     :%!curl --config -



