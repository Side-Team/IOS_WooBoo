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
    func return_select_question_countSelector(countSelector: Int, cnts : [Int])
}

protocol Get_questions_qSeqno: class {
    func return_questions_qSeqno(item : Int)
}

protocol Get_like_count: class {
    func return_like_count(count : Int)
}

protocol Get_report_count: class {
    func return_report_count(count : Int)
}

protocol Get_MyQuestions: class {
    func return_MyQuestions(myQuestions : NSArray)
}


class LMW_SelectModel{
    var delegate1: Get_questions_views!
    var delegate2: Get_questions_qSeqno!
    var delegate3: Get_resgister_count!
    var delegate4: Get_select_question_countSelector!
    var delegate5: Get_like_count!
    var delegate6: Get_report_count!
    var delegate7: Get_MyQuestions!
    
    var urlPath = ""
    
    func downloadItems(funcName : String, urlPath : String){
        
        print("downloadItems")

        self.urlPath = urlPath
        
        print("LMW_SelectModel urlPath : \(urlPath)")
        
        let url = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url){(data, response, error)in
            if error != nil{
                print("failed to download data")
            }else{
                print("Data is downloading")
                
                switch funcName{
                case "get_qSeqno":
                    print("LMW_SelectModel : get_qSeqno")
                    self.get_qSeqno(data!)
                case "get_register_view":
                    print("LMW_SelectModel : get_register_view")
                    self.get_register_views(data!)
                case "check_register":
                    print("LMW_SelectModel : check_register")
                    self.check_resgister(data!)
                case "get_countSelector":
                    print("LMW_SelectModel : get_countSelector")
                    self.get_countSelector(data!)
                case "check_like":
                    print("LMW_SelectModel : check_like")
                    self.check_like(data!)
                case "check_report":
                    print("LMW_SelectModel : check_report")
                    self.check_report(data!)
                case "select_MyQuestions":
                    print("LMW_SelectModel : select_MyQuestions")
                    self.get_MyQuestions(data!)
                    
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
        print("get_countSelector!!!!!!!!!!!!!")
  
        print("get_countSelector : ", urlPath)
        
        var jsonResult = NSArray()
        var datas = [Int]()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            
        }catch let error as NSError{
            print(error)
        }
        
        var jsonElement = NSDictionary()
        var count = 0
        
        for i in 0..<jsonResult.count{
            jsonElement =  jsonResult[i] as! NSDictionary
            
            if let jsp_count = jsonElement["count"] as? String,
               let jsp_cnt1 = jsonElement["cnt1"] as? String,
               let jsp_cnt2 = jsonElement["cnt2"] as? String,
               let jsp_cnt3 = jsonElement["cnt3"] as? String,
               let jsp_cnt4 = jsonElement["cnt4"] as? String,
               let jsp_cnt5 = jsonElement["cnt5"] as? String{
                count = Int(jsp_count)!
                datas.append(Int(jsp_cnt1)!)
                datas.append(Int(jsp_cnt2)!)
                datas.append(Int(jsp_cnt3)!)
                datas.append(Int(jsp_cnt4)!)
                datas.append(Int(jsp_cnt5)!)

                print("get_countSelector count : \(count)")
                print("datas : \(datas)")



            }
        }
        DispatchQueue.main.async(execute: {() -> Void in
            self.delegate4.return_select_question_countSelector(countSelector: count, cnts: datas)
            print("DispatchQueue datas : \(datas)")
        })
    }
    
    func check_like(_ data: Data){
  
        print("check_like : ", urlPath)
        
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
            self.delegate5.return_like_count(count: count)
            print("DispatchQueue")
        })
    }
    
    func check_report(_ data: Data){
  
        print("check_report : ", urlPath)
        
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
            self.delegate6.return_report_count(count: count)
            print("DispatchQueue")
        })
    }
    
    func get_MyQuestions(_ data: Data){
        var jsonResult = NSArray()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray
        }catch let error as NSError{
            print(error)
        }
        
        var jsonElement = NSDictionary()     // Dictionary로 데이터를 가져옴
        let myQuestions = NSMutableArray()
        
        for i in 0..<jsonResult.count{
            
            jsonElement = jsonResult[i] as! NSDictionary    // jsonResult[i]를 NSDictionary로 바꿔준다.
            let query = categoryDBModel()
            
            if let qSeqno = jsonElement["qSeqno"] as? String,
               let qTitle = jsonElement["qTitle"] as? String,
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
                query.qSeqno = qSeqno
                query.qTitle = qTitle
                query.qSelection1 = qSelection1
                query.qSelection2 = qSelection2
                query.qSelection3 = qSelection3
                query.qSelection4 = qSelection4
                query.qSelection5 = qSelection5
                query.qCategory = qCategory
                query.qInsertDate = qInsertDate
                query.qDeleteDate = qDeleteDate
                query.qImageFileName1 = qImageFileName1
                query.qImageFileName2 = qImageFileName2
                query.qImageFileName3 = qImageFileName3
                query.qImageFileName4 = qImageFileName4
                query.qImageFileName5 = qImageFileName5
               
                
                print("---------------------------------------")
                print("-------선택한 셀 : \(qSeqno)-------------")
                print("---------------------------------------")

            }
            myQuestions.add(query)
            
            let item: categoryDBModel = myQuestions[0] as! categoryDBModel
            print("---------------------------------------")
            print("-------myQuestions : \(String(describing: item.qSeqno))-------------")
            print("---------------------------------------")
        }
        DispatchQueue.main.async(execute: {() -> Void in
            
            self.delegate7.return_MyQuestions(myQuestions: myQuestions)
        })
        print("jsonElement ==== \(jsonElement)")
    }
}
