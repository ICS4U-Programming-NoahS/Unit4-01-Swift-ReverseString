//
// ReverseString.swift
//
// Created by Noah Smith
// Created on 2025-04-17
// Version 1.0
// Copyright (c) 2025 Noah Smith. All rights reserved.
//
// The Reverse String program will read a set of strings from 'input.txt'.
// It will populate the set of strings into an array.
// It will then reverse each string using a recursive function.
// Finally, it will write the reversed strings to 'output.txt'.

// Import foundation library
import Foundation

// Function to reverse the string
func reverseString(_ string: String) -> String {

    // Base case
    if string.count == 0 {

        // Return the empty string
        return string

    // Recursive case
    } else {

        // Source: https://www.programiz.com/swift-programming/library/string/dropfirst
        // Return the reversed string, dropping the first character
        // and adding the first character to the end
        return reverseString(String(string.dropFirst())) + String(string.first!)
    }
}

// Greeting and instructions
print("Welcome to the reverse string program!")
print("The Reverse String program will read a set of strings from 'input.txt'.")
print("It will populate the set of strings into an array.")
print("It will then reverse each string using a recursive function.")
print("Finally, it will write the reversed strings to 'output.txt'.")

// initialize output string
var outputStr = ""

// open input file for reading
let inputPath = "./input.txt"

// Create output file
let outputPath = "./output.txt"

do {
    // Read the content of the input file
    let fileContent = try String(contentsOfFile: inputPath)

    // Split up the strings by a new line
    let arrayStr = fileContent.components(separatedBy: "\n")

    // Loop through the array of strings
    for counter in 0..<arrayStr.count {

        // call the reverse string function
        let reversedString = reverseString(arrayStr[counter])

        // Add the reversed string to the output string
        outputStr += "\(reversedString)\n"
    }

    // write the output string to the output file
    try outputStr.write(toFile: outputPath, atomically: true, encoding: .utf8)

    // Display success message
    print("\nSuccessfully wrote to file 'output.txt'.")

// If there's a file error
} catch {
    // Display file error message
    print("A file error occurred.")
}
