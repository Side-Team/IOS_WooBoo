//
//  JspUserSelect.swift
//  WooBoo_Project
//
//  Created by 김보람 on 2021/02/25.
//

import Foundation

protocol JspUserSelectProtocol: class {
    func itemDownloaded(items: NSArray)
}

class JspUserSelect{
    var delegate: JspUserSelectProtocol!
    
    let urlPath = "http://127.0.0.1:8080/ios_jsp/wooboo_userSelect.jsp?uEmail=\(Share.userID)"
   
    func downloadItems(){
        let url = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        print("url: \(urlPath)")
        
        let task = defaultSession.dataTask(with: url){(data, response, error)in
            if error != nil{
                print("failed to download data")
            }else{
                print("Data is downloading")
                self.parseJONS(data!)
            }
        }
        task.resume()
    }
    
    func parseJONS(_ data: Data){
        var jsonResult = NSArray()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            
        }catch let error as NSError{
            print(error)
        }
        
        var jsonElement = NSDictionary()
        let locations = NSMutableArray()
        
        for i in 0..<jsonResult.count{
            jsonElement =  jsonResult[i] as! NSDictionary
            let query = UserModel()
            
            if
                let uSeqno = jsonElement["seqno"] as? Int,
               let uEmail = jsonElement["email"] as? String,
               let uPw = jsonElement["pw"] as? String,
               let uImageFileName = jsonElement["Image"] as? String{
                query.uSeqno = uSeqno
                query.uEmail = uEmail
                query.uPw = uPw
                query.uImageFileName = uImageFileName
            }
            locations.add(query)
        }
        DispatchQueue.main.async(execute: {() -> Void in
            self.delegate.itemDownloaded(items: locations)
        })
    }
}
