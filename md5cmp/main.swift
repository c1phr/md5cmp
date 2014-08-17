//
//  main.swift
//  md5cmp
//
//  Created by Ryan Batchelder on 8/15/14.
//  Copyright (c) 2014 Ryan Batchelder. All rights reserved.
//

import Foundation


func PrintHelp() -> Void
{
    println("Flags: -h: This help menu.")
    println("       -f: Single file mode, md5cmp -f <file> returns the MD5 sum of the file")
    println("       -c: File Compare mode, md5cmp -c <file 1> <file 2> returns if the two files have the same MD5 sum")
    println("       -s: String Compare mode, md5cmp -s <file> <string> returns if the file's MD5 matches the input string")
}

func start()
{
    if (C_ARGC < 2) //No flags, exit
    {
        println("Invalid Args: md5cmp -h for help")
        return;
    }
    let args = NSProcessInfo.processInfo().arguments as NSArray
    let flag = args[1] as String
    
    switch flag
    {
        case "-h":
            PrintHelp()
        
        case "-f":
            if (args.count != 3)
            {
                println("USAGE: md5cmp -f <file>")
                exit(1)
            }
            else
            {
                let file = args[2] as String
                println("Hash of " + file + ":")
                println(md5cmp.SingleFileHash(file))
            }
        
        case "-c":
            if (args.count != 4)
            {
                println("USAGE: md5cmp -c <file 1> <file 2>")
                exit(1)
            }
            else
            {
                let file1 = args[2] as String
                let file2 = args[3] as String
                let result = md5cmp.FileCompare(file1, file2: file2) //Pretty sure there's a compiler bug preventing me from passing in the raw value here
                if (result.success)
                {
                    println(result.file1hash + " == " + result.file2hash)
                    println("SUCCESS: The files are equal")
                    exit(0)
                }
                else
                {
                    println("WARNING: The files are not equal")
                    println("File 1: " + result.file1hash)
                    println("File 2: " + result.file2hash)
                }
            }
        
        default:
            println("Invalid Flag: " + flag)
    }
    
}

start()