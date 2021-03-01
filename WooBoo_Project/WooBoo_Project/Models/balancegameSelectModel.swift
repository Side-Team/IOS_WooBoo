//
//  balancegameSelectModel.swift
//  WooBoo_Project
//
//  Created by 김보람 on 2021/03/01.
//

import Foundation


protocol balancegameSelectModelProtocol: class {
    func itemDownloaded(items: NSArray)
}

class balancegameSelectModel{
    var delegate: balancegameSelectModelProtocol!
    
    let urlPath = "http://127.0.0.1:8080/ios_jsp/wooboo_BalancegameSelect.jsp"
   
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
            print("1")
            jsonElement =  jsonResult[i] as! NSDictionary
            let query = balancegameModel()
            
            if let bSeqno = jsonElement["seqno"] as? String,
                let bTitle = jsonElement["title"] as? String,
                let bSelection1 = jsonElement["selection1"] as? String,
                let bSelection2 = jsonElement["selection2"] as? String{
                print("2")
                query.bSeqno = bSeqno
                query.bTitle = bTitle
                query.bSelection1 = bSelection1
                query.bSelection2 = bSelection2
                
     
                print("bSeqno : \(bSeqno)")
                print("bTitle : \(bTitle)")
                print("bSelection1 : \(bSelection1)")
                print("bSelection2 : \(bSelection2)")
               
            }
            locations.add(query)
            print("3")
         
        }
        DispatchQueue.main.async(execute: {() -> Void in

            self.delegate.itemDownloaded(items: locations)
        })
    }
}
