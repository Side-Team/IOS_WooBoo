//
//  JoinModel.swift
//  WooBoo_Project
//
//  Created by ssemm on 2021/02/24.
//

import Foundation

class JoinModel: NSObject {
    var urlPath = "http://127.0.0.1:8080/ios_jsp/wooboo_join.jsp"
    
    
    func joinItems(email: String, pw: String) -> Bool{   // Bool은 됐는지 안됐는지 결과를 받기위함
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
}
