//
//  md5cmp.swift
//  md5cmp
//
//  Created by Ryan Batchelder on 8/16/14.
//  Copyright (c) 2014 Ryan Batchelder. All rights reserved.
//
//  Swift helper functions wrapping the FileHash library

import Foundation
class md5cmp
{
    class func SingleFileHash(fileName: String) -> String
    {
        let fileManager = NSFileManager.defaultManager()
        if (fileManager.fileExistsAtPath(fileName))
        {
            return FileHash.md5HashOfFileAtPath(fileName)
        }
        else
        {
            return "File not found!"
        }
    }
    
    class func FileCompare(file1: String, file2: String) -> (success: Bool, file1hash: String, file2hash: String)
    {
        let fileManager = NSFileManager.defaultManager()
        if (fileManager.fileExistsAtPath(file1) && fileManager.fileExistsAtPath(file2))
        {
            let file1hash = FileHash.md5HashOfFileAtPath(file1)
            let file2hash = FileHash.md5HashOfFileAtPath(file2)
            
            if (file1hash == file2hash)
            {
                return (true, file1hash, file2hash)
            }
            return (false, file1hash, file2hash)
        }
        return(false, "", "")
        
    }
    
    class func StringCompare(fileName: String, inputHash: String) -> (success: Bool, fileHash: String)
    {
        let fileManager = NSFileManager.defaultManager()
        if (fileManager.fileExistsAtPath(fileName))
        {
            let fileHash = FileHash.md5HashOfFileAtPath(fileName)
            
            if (fileHash == inputHash)
            {
                return (true, fileHash)
            }
            return (false, fileHash)
        }
        else
        {
            return (false, "File not found!")
        }
        
    }
}
