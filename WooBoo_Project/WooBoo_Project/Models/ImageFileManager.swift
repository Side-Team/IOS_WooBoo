//
//  ImageFileManager.swift
//  ImageFileManager
//
//  Created by HanulYun-Comp on 2020/02/24.
//  Copyright © 2020 Yun. All rights reserved.
//

import UIKit

class ImageFileManager {
    static let shared: ImageFileManager = ImageFileManager()
    // *********tmp 경로!!!!!************
    let tmpPath = NSTemporaryDirectory()
    // ----------------------------------
    
    func getSavedImage(named: String) -> UIImage? {
        print("ImageFileManager named : \(named)")
        print("구간------------------")
        print("tmpPath : \(tmpPath)")

        if let dir: URL = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            let path: String = URL(fileURLWithPath: tmpPath).appendingPathComponent(named).path
            print("ImageFileManager path : \(path)")
            print("구간------------------")


            let image: UIImage? = UIImage(contentsOfFile: path)
            return image
        }
        return nil
    }
    
    func saveImage(image: UIImage, name: String, onSuccess: @escaping ((Bool) -> Void)) {
        guard let data = image.jpegData(compressionQuality: 1) ?? image.pngData() else { return }
        
        if let directory: NSURL = try? FileManager.default.url(for: .libraryDirectory,
                                                               in: .userDomainMask,
                                                               appropriateFor: nil, create: false) as NSURL {
            do {
                try data.write(to: directory.appendingPathComponent(name)!)
                onSuccess(true)
            } catch let error as NSError {
                print("Could not saveImage🥺: \(error), \(error.userInfo)")
                onSuccess(false)
            }
        }
    }
    
    func deleteImage(named: String, onSuccess: @escaping ((Bool) -> Void)) {
        print("들어옴")
//        guard let directory = try? FileManager.default.url(for: .libraryDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else { return }
//        do {
//            print("do 들어옴")
//            if let docuPath = t{
//                print("docuPath 들어옴")
//                let fileNames = try FileManager.default.contentsOfDirectory(atPath: docuPath)
//                print("fileNames : \(fileNames)", "!!!! named : \(named)")
//
//                for fileName in fileNames {
//                    if fileName == named {
//
//                        return
//                    }
//                }
//            }
//        } catch let error as NSError {
//            print("Could not deleteImage🥺: \(error), \(error.userInfo)")
//            onSuccess(false)
//        }
        
        do {
            let filePathName = "\(tmpPath)/\(named)"
            print("지울 파일 경로 : \(filePathName)")
            
            try  FileManager.default.removeItem(atPath: filePathName)
            onSuccess(true)
        } catch let error as NSError {
            print("Could not deleteImage🥺: \(error), \(error.userInfo)")
            onSuccess(false)
        }
           
            
           
            
        
       
        
    }
}
