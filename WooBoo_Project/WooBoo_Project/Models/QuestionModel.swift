//
//  QuestionModel.swift
//  WooBoo_Project
//
//  Created by 유민규 on 2021/02/24.
//

import Foundation

protocol QuestionProtocol: class {
    func itemDownloaded(items: NSArray)
}

class QuestionModel: NSObject{
    var delegate: QuestionProtocol!
    let urlPath = "http://127.0.0.1:8080/ios_jsp/wooboo_query_ios.jsp"
    
    func downloadItems(){
        let url = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        print("메인\(url)")
        let task = defaultSession.dataTask(with: url){(data, responds, error) in
            if error != nil{
                print("Failed to download data")
            }else{
                print("Data is downloading")
                self.parseJSON(data!)
            }
        }
        task.resume()
    }
    
    func parseJSON(_ data: Data){
        var jsonResult = NSArray()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray
        }catch let error as NSError{
            print(error)
        }
        
        var jsonElement = NSDictionary()     // Dictionary로 데이터를 가져옴
        let locations = NSMutableArray()
        
        for i in 0..<jsonResult.count{
            
            jsonElement = jsonResult[i] as! NSDictionary    // jsonResult[i]를 NSDictionary로 바꿔준다.
            let query = DBModel()
            
            if let stitle = jsonElement["title"] as? String
               {
                query.stitle = stitle
                print("stitle\(stitle)")
                
            }
            locations.add(query)
        }
        DispatchQueue.main.async(execute: {() -> Void in
            self.delegate.itemDownloaded(items: locations)
        })
        
    }
    
}

