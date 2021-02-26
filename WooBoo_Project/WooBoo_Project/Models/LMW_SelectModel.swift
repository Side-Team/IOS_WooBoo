//
//  LMW_SelectModel.swift
//  WooBoo_Project
//
//  Created by 이민우 on 2021/02/26.
//

import Foundation


protocol Get_resgister_count: class {
    func return_register_count(count: Int, views: Int)
}

protocol Get_questions_views: class {
    func return_register_views(views: Int)
}

protocol Get_select_question_countSelector: class {
    func return_select_question_countSelector(countSelector: Int)
}

protocol Get_questions_qSeqno: class {
    func return_questions_qSeqno(item : Int)
}

class LMW_SelectModel{
    var delegate1: Get_questions_views!
    var delegate2: Get_questions_qSeqno!
    var delegate3: Get_resgister_count!
    var delegate4: Get_select_question_countSelector!
    
    var urlPath = ""
    
    func downloadItems(funcName : String, urlPath : String){
        
        print("downloadItems")

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
                case "get_register_view":
                    self.get_register_views(data!)
                case "check_register":
                    self.check_resgister(data!)
                case "get_countSelector":
                    self.get_countSelector(data!)
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
    
    func get_register_views(_ data: Data){
  
        print("get_register_views : ", urlPath)
        
        var jsonResult = NSArray()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            
        }catch let error as NSError{
            print(error)
        }
        
        var jsonElement = NSDictionary()
        var views = 0
        
        for i in 0..<jsonResult.count{
            jsonElement =  jsonResult[i] as! NSDictionary
            
            if let jsp_views = jsonElement["views"] as? String{
                views = Int(jsp_views)!
                print("rViews : \(views)")
            }
        }
        DispatchQueue.main.async(execute: {() -> Void in
            self.delegate1.return_register_views(views: views)
            print("DispatchQueue")
        })
    }
    
    func check_resgister(_ data: Data){
  
        print("check_resgister : ", urlPath)
        
        var jsonResult = NSArray()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            
        }catch let error as NSError{
            print(error)
        }
        
        var jsonElement = NSDictionary()
        var count = 0
        var views = 0
        
        for i in 0..<jsonResult.count{
            jsonElement =  jsonResult[i] as! NSDictionary
            
            if let jsp_count = jsonElement["count"] as? String,
               let jsp_views = jsonElement["views"] as? String{
                count = Int(jsp_count)!
                views = Int(jsp_views)!
                print("count : \(count)")
                print("views : \(views)")

            }
        }
        DispatchQueue.main.async(execute: {() -> Void in
            self.delegate3.return_register_count(count: count, views: views)
            print("DispatchQueue")
        })
    }

    func get_countSelector(_ data: Data){
  
        print("get_countSelector : ", urlPath)
        
        var jsonResult = NSArray()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            
        }catch let error as NSError{
            print(error)
        }
        
        var jsonElement = NSDictionary()
        var count = 0
        
        for i in 0..<jsonResult.count{
            jsonElement =  jsonResult[i] as! NSDictionary
            
            if let jsp_count = jsonElement["count"] as? String{
                count = Int(jsp_count)!
                print("count : \(count)")


            }
        }
        DispatchQueue.main.async(execute: {() -> Void in
            self.delegate4.return_select_question_countSelector(countSelector: count)
            print("DispatchQueue")
        })
    }
}
