//
//  main.swift
//  md5cmp
//
//  Created by Ryan Batchelder on 8/15/14.
//  Copyright (c) 2014 Ryan Batchelder. All rights reserved.
//

import Foundation

let fh = FileHash(); //Probably shouldn't leave this here, but it's a note to myself on how to call Obj-C classes

func main()
{
    if (C_ARGC < 2) //No flags, exit
    {
        println("Invalid Args: md5cmp -h for help")
        return;
    }
    let args = NSProcessInfo.processInfo().arguments as NSArray
    let flag = args[0] as String
    
    switch flag
    {
        case "-h":
            println("Flags: -h: This help menu.")
            println("       -f: Single file mode, md5cmp -f <file> returns the MD5 sum of the file")
            println("       -c: File Compare mode, md5cmp -c <file1> <file2> returns if the two files have the same MD5 sum")
            println("       -s: String Compare mode, md5cmp -s <file> <string> returns if the file's MD5 matches the input string")
        case "-f":
            println("Checking for file")
            if (args.count != 3)
            {
                println("USAGE: md5cmp -f <file>")
                return;
            }
            else
            {
                let file: String = args[2] as String
                let hash = FileHash.md5HashOfFileAtPath(file)
                println("Hash of " + file)
            }
        default:
            println("Invalid Flag: " + flag)
    }
    
}

main()