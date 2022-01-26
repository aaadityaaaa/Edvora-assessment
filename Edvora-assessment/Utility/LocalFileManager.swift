//
//  LocalFileManager.swift
//  Edvora-assessment
//
//  Created by Aaditya Singh on 25/01/22.
//

import Foundation
import UIKit


class LocalFileManager {
    
    static let instance = LocalFileManager()
    
    private init() {}
    
    func saveImage(image: UIImage, imageName: String, name: String) {
        
        createFolderIfNeeded(folderName: name)
        guard
            let data = image.pngData(),
            let url = getURLForImage(imageName: imageName, name: name)
        else{return}
        
        
        do {
            try data.write(to: url)

        } catch let error {
            print("wtf is this \(error)")
        }
        
    }
    
    func getImage(imageName: String, folderName: String) -> UIImage? {
        guard
            let url = getURLForImage(imageName: imageName, name: folderName),
            FileManager.default.fileExists(atPath: url.path) else {
                  return nil
              }
        return UIImage(contentsOfFile: url.path)
    }
    
    private func createFolderIfNeeded(folderName: String) {
        
        guard let url = getURLForFolder(name: folderName) else {return}
 
        if !FileManager.default.fileExists(atPath: url.path) {
            
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
            } catch let error {
                print("yea whatever \(error)")
            }
        }
        
        
    }
    
    
    
    private func getURLForFolder(name: String) -> URL? {
        guard  let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else{return nil}
        return url.appendingPathComponent(name)
    }
    
    private func getURLForImage(imageName: String, name: String) -> URL? {
        guard  let folderURL = getURLForFolder(name: name) else{return nil}
        
        return folderURL.appendingPathComponent(imageName + ".png")
        
    }
     
}

