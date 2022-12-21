#!/bin/bash

for file in $(find "." -name "*.html" ! -name "templateA.html" ! -name "templateB.html"); do
    cat templateA.html | sed '/<!-- START1 -->/,/<!-- END1 -->/{
        h
        r /dev/stdin
        H
        g
        d
    }' $file > "$file"2;


    cat templateB.html | sed '/<!-- START2 -->/,/<!-- END2 -->/{
        h
        r /dev/stdin
        H
        g
        d
    }' "$file"2 > "$file"3;

    rm $file
    rm "$file"2
    mv "$file"3 $file
done
