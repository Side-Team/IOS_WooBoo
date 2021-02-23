//
//  LoginModel.swift
//  WooBoo_Project
//
//  Created by ssemm on 2021/02/23.
//

import Foundation

protocol LoginModelProtocol: class{
    func itemDownloaded(items: NSArray)
}

class LoginModel: NSObject{
    var delegate: LoginModelProtocol!
    var urlPath = "http://127.0.0.1:8080/iosjsp/loginCheck.jsp"
//    
//    func loginitem(uEmail: String, uPw: String) -> Bool{
//        var result: Bool = true
//        
//        let urlAdd = "?uEmail=\(uEmail)&uPw=\(uPw)"
//        
//        urlPath = urlPath + urlAdd
//        
//        func downloadItems(){
//            let url = URL(string: urlPath)!
//            let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
//            
//            let task = defaultSession.dataTask(with: url){(data, responds, error) in
//                if error != nil{
//                    print("Failed to download data")
//                }else{
//                    print("Data is downloading")
//                    self.parseJSON(data!)
//                }
//            }
//            task.resume()
//            return result
//        }
//    }
  
    
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
            let query = UserModel()
            
            if let uEmail = jsonElement["Email"] as? String,
               let uPw = jsonElement["PW"] as? String{
                query.uEmail = uEmail
                query.uPw = uPw
            }
            locations.add(query)
        }
        DispatchQueue.main.async(execute: {() -> Void in
            self.delegate.itemDownloaded(items: locations)
        })
        
    }
}//----
