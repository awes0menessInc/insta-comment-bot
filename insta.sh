#!/bin/bash
comment='@purdue_phidelt'  # or whoever you want to @
n=0

while [[ true ]]; do
    i=0
    while read line; do
        r=$(( $RANDOM % (10) + 1 )) # Timer to prevent being flagged as spam
        let "i++"
        let "n++"
    
        # copy the POST request from one of your previous comment post by going to chrome devtools->network->add/
        # you can do this easily by posting a test comment first and looking at its post request. 
        # This post request was for a specific post and WILL not work if you directly small details,
        # however look to this format for the POST request.
        # note session id changes if you logout
        
        curl 'https://www.instagram.com/web/comments/1708983279069330425/add/' \
        -H 'cookie: mid=WniOLgAEAAEuZgobPWC0SuQtxtGW; ig_pr=2; ig_dau_dismiss=1518558397985; _js_datr=BBOCWqcpafs-oWMTao97XCh2; csrftoken=k6DfY3DwZ5H7V6HB7T9D3gxYqILmXeGI; ds_user_id={USER_ID}; sessionid={SESSION_ID}; rur=ASH; ig_vw=768; ig_vh=954; ig_or=portrait-primary; urlgen="{\"time\": 1518468352\054 \"{IP}\": 17}:1elhGn:Gq-tvb7GBcQ0g-kDqEmlMXPkJeo"' \
        -H 'origin: https://www.instagram.com' \
        -H 'accept-encoding: gzip, deflate, br' \
        -H 'accept-language: en-US,en;q=0.9' \
        -H 'user-agent: {Client_deets}' \
        -H 'x-requested-with: XMLHttpRequest' \
        -H 'x-csrftoken: {gen_token}' \
        -H 'pragma: no-cache' \
        -H 'x-instagram-ajax: 1' \
        -H 'content-type: application/x-www-form-urlencoded' \
        -H 'accept: */*' \
        -H 'cache-control: no-cache' \
        -H 'authority: www.instagram.com' \
        -H 'referer: https://www.instagram.com/p/Be3hzzcAnv5/?taken-by=hubpurdue' \
        -H 'dnt: 1' \
        --data "comment_text=$comment+$line" \
        --compressed &>/dev/null
        if [ $(( $i % 5 )) -eq 0 ]; then
            sleep 200
        fi
        echo $n
        echo
        sleep $r
    done < lyrics.txt
    clear
done
