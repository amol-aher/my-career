#!/bin/bash

# Loop from 3 to 100
for i in $(seq 3 100); do
    filename="answer-$i.html"
    touch "$filename"
    echo "Created $filename"
done
