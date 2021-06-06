//
//  FileIO.swift
//  damedame1
//
//  Created by Taeheon Kim on 2021/06/03.
//

import Foundation

func filePathString() -> String{
    let manager = FileManager.default
    guard let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
    else {return ""}
    
    let newFolderDir = url.appendingPathComponent("test_dir")
    let fileURL = newFolderDir.appendingPathComponent("04.png")
    
    
    do{
        try manager.createDirectory(at: newFolderDir, withIntermediateDirectories: true, attributes: [ : ])
    }catch{
        
    }
    
    print(url.path)
    
    return fileURL.path
}
