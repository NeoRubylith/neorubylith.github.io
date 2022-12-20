#!/bin/bash

for file in $(find "." -name "*.html" ! -name "templateA.html" ! -name "templateB.html"); do
    sed '/<!-- START1 -->/,/<!-- END1 -->/{R templateA.html
    d}' "$file" >> "$file"2;

    sed '/<!-- START2 -->/,/<!-- END2 -->/{R templateB.html
    d}' "$file"2 >> "$file"3;

    rm $file
    rm "$file"2
    mv "$file"3 $file
done


