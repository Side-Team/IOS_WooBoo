//
//  balancegameBtn2count.swift
//  WooBoo_Project
//
//  Created by 김보람 on 2021/03/03.
//

import Foundation

protocol balancegameBtn2countProtocol: class{
    func itemBtn2Count(items: NSArray)
}

class balancegameBtn2count{
    var delegate: balancegameBtn2countProtocol!
    var urlPath =
        "http://127.0.0.1:8080/ios_jsp/wooboo_balancegameBtn2Count.jsp?balancegame_bSeqno=\(String(Share.gameNum))"
   
    
    func downloadItems(){
        let url = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        print("btn2 url",url)
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
            let query = SelectgameModel()
            
            if let btn2 = jsonElement["btn2"] as? String{
                query.btn2 = btn2
                print("btn2 ",btn2)
            }
            locations.add(query)
            
        
        }
        DispatchQueue.main.async(execute: {() -> Void in
            self.delegate.itemBtn2Count(items: locations)
        })
    }
}//=======
