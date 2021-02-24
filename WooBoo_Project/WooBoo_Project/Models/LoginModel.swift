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
    
    func insertItems(email: String, pw: String) -> Bool{   // Bool은 됐는지 안됐는지 결과를 받기위함
        var result: Bool = true
        let urlAdd = "?uemail=\(email)&upw:\(pw)"    //jsp 뒤에 ? 내용은 이것을 통해서 데이터가 들어감
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
  
    
    func parseJSON(_ data: Data){
        
        var resultValue:Int = 0
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
            
        }
        DispatchQueue.main.async(execute: {() -> Void in
            self.delegate.itemDownloaded(items: locations)
        })
        
    }
}//----
