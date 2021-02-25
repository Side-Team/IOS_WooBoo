//
//  LMW_SelectModel.swift
//  WooBoo_Project
//
//  Created by 이민우 on 2021/02/26.
//

import Foundation


protocol Get_questions_Detail: class {
    func itemDownloaded(items: NSArray)
}

protocol Get_questions_qSeqno: class {
    func return_questions_qSeqno(item : Int)
}

class LMW_SelectModel{
    var delegate1: Get_questions_Detail!
    var delegate2: Get_questions_qSeqno!
    var urlPath = ""
    
    func downloadItems(funcName : String, urlPath : String){
        self.urlPath = urlPath
        
        let url = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url){(data, response, error)in
            if error != nil{
                print("failed to download data")
            }else{
                print("Data is downloading")
                
                switch funcName{
                case "get_qSeqno":
                    self.get_qSeqno(data!)
                case "get_questionsDetail":
                    self.get_questionsDetail(data!)
                default: break
                    
                }
            }
        }
        task.resume()
    }
    
    func get_qSeqno(_ data: Data){
        var jsonResult = NSArray()
        print("get_qSeqno urlPath : \(urlPath)")
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            
        }catch let error as NSError{
            print(error)
        }
        
        var jsonElement = NSDictionary()
        var questions_qSeqno = 0
        
        for i in 0..<jsonResult.count{
            print("들어왔나????????")
            jsonElement =  jsonResult[i] as! NSDictionary
            
            if let qSeqno = jsonElement["qSeqno"] as? String{
                print("들어왔나????????222222")

                questions_qSeqno = Int(qSeqno)!
                print("SelectModel questions_qSeqno : \(questions_qSeqno)")
            }
        }
        DispatchQueue.main.async(execute: {() -> Void in
            self.delegate2.return_questions_qSeqno(item: questions_qSeqno + 1)
        })
    }
    
    func get_questionsDetail(_ data: Data){
        
        urlPath = urlPath + "?user_uSeqno=\(Share.uSeqno)"
        
        var jsonResult = NSArray()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            
        }catch let error as NSError{
            print(error)
        }
        
        var jsonElement = NSDictionary()
        let datas = NSMutableArray()
        
        for i in 0..<jsonResult.count{
            jsonElement =  jsonResult[i] as! NSDictionary
            let query = LMW_questionsT()
            
            if let qTitle = jsonElement["qTitle"] as? String,
               let qSelection1 = jsonElement["qSelection1"] as? String,
               let qSelection2 = jsonElement["qSelection2"] as? String,
               let qSelection3 = jsonElement["qSelection3"] as? String,
               let qSelection4 = jsonElement["qSelection4"] as? String,
               let qSelection5 = jsonElement["qSelection5"] as? String,
               let qCategory = jsonElement["qCategory"] as? String,
               let qInsertDate = jsonElement["qInsertDate"] as? String,
               let qDeleteDate = jsonElement["qDeleteDate"] as? String,
               let qImageFileName1 = jsonElement["qImageFileName1"] as? String,
               let qImageFileName2 = jsonElement["qImageFileName2"] as? String,
               let qImageFileName3 = jsonElement["qImageFileName3"] as? String,
               let qImageFileName4 = jsonElement["qImageFileName4"] as? String,
               let qImageFileName5 = jsonElement["qImageFileName5"] as? String{
                query.qTitle = qTitle
                query.qSelection1 = qSelection1
                query.qSelection2 = qSelection2
                query.qSelection3 = qSelection3
                query.qSelection4 = qSelection4
                query.qSelection5 = qSelection5
                query.qCategory = Int(qCategory)
                query.qInsertDate = qInsertDate
                query.qDeleteDate = qDeleteDate
                query.qImageFileName1 = qImageFileName1
                query.qImageFileName2 = qImageFileName2
                query.qImageFileName3 = qImageFileName3
                query.qImageFileName4 = qImageFileName4
                query.qImageFileName5 = qImageFileName5
            }
            datas.add(query)
            print("datas : \(datas)")
        }
        DispatchQueue.main.async(execute: {() -> Void in
            self.delegate1.itemDownloaded(items: datas)
        })
    }

}
