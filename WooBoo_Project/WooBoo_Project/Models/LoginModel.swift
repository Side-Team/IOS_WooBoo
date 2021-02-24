//
//  LoginModel.swift
//  WooBoo_Project
//
//  Created by ssemm on 2021/02/23.
//

import Foundation

protocol LoginModelProtocol: class{
    func checkResultValue(result:Int)
}

class LoginModel: NSObject{
    var delegate: LoginModelProtocol!
    //var urlPath = "http://127.0.0.1:8080/iosjsp/loginCheck.jsp"
    
    
    func LoginItems(email: String, pw: String){
        var urlPath = "http://127.0.0.1:8080/ios_jsp/wooboo_loginCheck.jsp"
        let urlAdd = "?uEmail=\(email)&uPw=\(pw)"
        urlPath = urlPath + urlAdd
        print("urlPath:\(urlPath)")
        let url = URL(string: urlPath)!
        
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url){(data, responds, error) in
            if error != nil{
                print("Failed to download data")
            }else{
                print("Data is downloading")
                self.loginCheckParseJSON(data!)
            }
        }
        task.resume()
    }
    
    func loginCheckParseJSON(_ data: Data){
        
        var resultValue1:Int = 0
        var jsonResult = NSArray()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray
        }catch let error as NSError{
            print(error)
        }
        
        var jsonElement = NSDictionary()
        let resultValue = NSMutableArray()
        
        for i in 0..<jsonResult.count{
            
            jsonElement = jsonResult[i] as! NSDictionary    // jsonResult[i]를 NSDictionary로 바꿔준다.
            
            if let result = jsonElement["result"] as? String{
                resultValue1 = Int(result)!
                print("result : \(result)")
            }
            resultValue.add(resultValue1)
        }
        DispatchQueue.main.async(execute: {() -> Void in
            print("resultvalue 0값 : \(resultValue[0])")
            self.delegate.checkResultValue(result: resultValue[0] as! Int)
        })
        print("resultValue값 : \(resultValue)")
        
    }
}//----
