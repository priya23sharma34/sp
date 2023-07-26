#!/bin/bash

# Function to print the chessboard
print_chess() {
    for ((row= 1; row <= 8; row+)); do #this for loop is for iterating over the rows
        for ((col = 1; col <= 8; col++)); do #this for loop is for iterating over the columns
            if (( (i + j) % 2 == 0 )); then
                echo -ne "\e[47m " #this is for printing a white cell
            else
                echo -ne "\e[40m " #this is for printing a black cell
            fi
        done
        echo -e "\e[0m " # set the text color to default and move to the next line
    done
}

# Call the function to print the chessboard
print_ches
