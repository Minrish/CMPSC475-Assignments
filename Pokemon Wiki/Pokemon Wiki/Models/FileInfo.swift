//
//  FileInfo.swift
//  Pokemon Wiki
//
//  Created by Bert Yan on 2/14/22.
//

import Foundation

import Foundation

// Convenient struct for generating URL and exists property
// for a file in the documents directory
struct FileInfo {
    let name : String
    let url : URL
    let exists : Bool
    
    init(for filename:String) {
        name = filename
        let fileManager = FileManager.default
        let documentURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        url =  documentURL.appendingPathComponent(filename + ".json")
        exists = fileManager.fileExists(atPath: url.path)
    }
    
    private init(name:String, url:URL, exists:Bool) {
        self.init(for:"")
    }
}
