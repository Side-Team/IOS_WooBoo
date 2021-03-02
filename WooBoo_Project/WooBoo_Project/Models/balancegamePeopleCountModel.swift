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
    var urlPath = "http://127.0.0.1:8080/ios_jsp/wooboo_balancegamePeopleCount.jsp"
    
    func insertItems(balancegame_bSeqno: String, sbSelection: String) -> Bool{
        var result: Bool = true
        let urlAdd = "?balancegame_bSeqno=\(balancegame_bSeqno)&sbSelection=\(sbSelection)"
        urlPath = urlPath + urlAdd
        
        print("몇명\(urlPath)")
        //한글 url encoding
        urlPath = urlPath.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url){(data, response, error) in
            if error != nil{
                print("Failed to insert data")
                result = false
            }else{
                print("Data is inserted!")
                result = true
                self.parseJONS(data!)
            }
        }
        task.resume()
        return result
    }
    
    func parseJONS(_ data: Data){
        print("왜 못들어가")
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
            
            if let count = jsonElement["btn"] as? String{
                print("여기")
                query.count = count
                
                print("count\(count)")
            }
            locations.add(query)
            
            print(jsonElement)
        }
        DispatchQueue.main.async(execute: {() -> Void in
            self.delegate.itemPeopleCount(items: locations)
        })
    }
    
}//=======
