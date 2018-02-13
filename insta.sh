#!/bin/bash
comment='@purdue_phidelt'
n=0

while [[ true ]]; do
    i=0
    while read line; do
        r=$(( $RANDOM % (10) + 1 ))
        let "i++"
        let "n++"

        curl 'https://www.instagram.com/web/comments/1708983279069330425/add/' \
        -H 'cookie: mid=WniOLgAEAAEuZgobPWC0SuQtxtGW; ig_pr=2; ig_dau_dismiss=1518558397985; _js_datr=BBOCWqcpafs-oWMTao97XCh2; csrftoken=k6DfY3DwZ5H7V6HB7T9D3gxYqILmXeGI; ds_user_id=7100332436; sessionid=7100332436%3ANkApxgB4e5uOhC%3A25; rur=ASH; ig_vw=768; ig_vh=954; ig_or=portrait-primary; urlgen="{\"time\": 1518468352\054 \"128.210.106.52\": 17}:1elhGn:Gq-tvb7GBcQ0g-kDqEmlMXPkJeo"' \
        -H 'origin: https://www.instagram.com' \
        -H 'accept-encoding: gzip, deflate, br' \
        -H 'accept-language: en-US,en;q=0.9' \
        -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36' \
        -H 'x-requested-with: XMLHttpRequest' \
        -H 'x-csrftoken: k6DfY3DwZ5H7V6HB7T9D3gxYqILmXeGI' \
        -H 'pragma: no-cache' \
        -H 'x-instagram-ajax: 1' \
        -H 'content-type: application/x-www-form-urlencoded' \
        -H 'accept: */*' \
        -H 'cache-control: no-cache' \
        -H 'authority: www.instagram.com' \
        -H 'referer: https://www.instagram.com/p/Be3hzzcAnv5/?taken-by=hubpurdue' \
        -H 'dnt: 1' \
        --data "comment_text=$comment+$line" \
        --compressed
        if [ $(( $i % 5 )) -eq 0 ]; then
            sleep 200
        fi

        echo
        echo $n
        echo
        sleep $r
    done < lyrics.txt
    clear
done
