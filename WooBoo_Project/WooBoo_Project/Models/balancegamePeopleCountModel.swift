//
//  balancegamePeopleCountModel.swift
//  WooBoo_Project
//
//  Created by 김보람 on 2021/03/02.
//

import Foundation


protocol balancrgamePeopleProtocol: class{
    func itemPeopleCount(items: NSArray)
}

class balancegamePeopleCountModel{
    var delegate: balancrgamePeopleProtocol!
    var urlPath =
        "http://127.0.0.1:8080/ios_jsp/wooboo_balancegamePeopleCount.jsp?balancegame_bSeqno=\(String(Share.gameNum))"
   
    
    func downloadItems(){
        let url = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        print("people url",url)
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
            
            if let count = jsonElement["count"] as? String{
                query.count = count
                print("count ",count)
            }
            locations.add(query)
            
            
        }
        DispatchQueue.main.async(execute: {() -> Void in
            self.delegate.itemPeopleCount(items: locations)
        })
    }
}//=======
