#!/bin/bash
for i in ../plots/*.pdf; do
    pdfcrop $i $i
done
