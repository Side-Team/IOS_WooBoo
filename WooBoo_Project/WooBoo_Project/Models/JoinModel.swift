//
//  JoinModel.swift
//  WooBoo_Project
//
//  Created by ssemm on 2021/02/24.
//

import Foundation

protocol EmailCheckProtocol: class {
    func checkEmailValue(result: Int)
}

class JoinModel: NSObject {
    var delegate: EmailCheckProtocol!

    func joinItems(email: String, pw: String) -> Bool{   // Bool은 됐는지 안됐는지 결과를 받기위함
        var urlPath = "http://127.0.0.1:8080/ios_jsp/wooboo_join.jsp"
        var result: Bool = true
        let urlAdd = "?uEmail=\(email)&uPw=\(pw)"

        urlPath = urlPath + urlAdd
        
        // 한글 url encoding
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
            }
        }
        task.resume()   // 실행
        return result
    }
    
    func emailCheckItems(email: String){
        
        var urlPath = "http://127.0.0.1:8080/ios_jsp/wooboo_emailCheck.jsp"
        let urlAdd = "?uEmail=\(email)"
        urlPath = urlPath + urlAdd
        print("urlPath:\(urlPath)")
        let url = URL(string: urlPath)!
        
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url){(data, responds, error) in
            if error != nil{
                print("Failed to download data")
            }else{
                print("Data is downloading")
                self.emailCheckParseJSON(data!)
            }
        }
        task.resume()
    }
    
    // Email 중복체크
    func emailCheckParseJSON(_ data: Data){
        
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
            //print("resultvalue 0값 : \(resultValue[0])")
            self.delegate.checkEmailValue(result: resultValue[0] as! Int)
        })
        //print("resultValue값 : \(resultValue)")
    }
}
