## Getting and Cleaning Data Course Project

This repository contains the files of the project of the coursera course Getting and Cleaning Data. The repository contains the following files:
- README.md :
- CodeBook.md : describes the variables, the data, and the transformations performed to clean up the original data.
- run_analysis.R : An R script which take the original data  and clean it as described in the CodeBook to obtain tidyData.txt. Will create a directory called data in the working directory, download the original data to it and then clean it and produce a 
- tidyData.txt : a tidy data set obtained by running the script as described in the CodeBook.md.


I have a more clear idea on what I want to do

I will first create a data frame with the people and situation
I will create a vector from the features and then get the positions of the places with mean and sd

I will then start a loop on the multiples of each position, use them to read a column and then paste it

for that I will need to read specific lines ; lines which are multiples of something; use colclasses?

subset only the columns you need from the vector containing the data

check f s string contains
grepl(value, chars)