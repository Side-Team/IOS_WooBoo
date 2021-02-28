//
//  userUpdateModel.swift
//  WooBoo_Project
//
//  Created by 김보람 on 2021/02/28.
//

import Foundation

class userUpdateModel: NSObject{
    
    var urlPath = "http://127.0.0.1:8080/ios_jsp/wooboo_userUpdate.jsp?uEmail=\(Share.userID)"
    
    func insertItems(pw: String, uImageFileName: String) -> Bool{
        var result: Bool = true
        let urlAdd = "&pw=\(pw)&uImageFileName=\(uImageFileName)"
        urlPath = urlPath + urlAdd
        
        print("urlPath \(urlPath)")
        //한글 url encoding
        urlPath = urlPath.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url){(data, response, error) in
            if error != nil{
                print("Failed to update data")
                result = false
            }else{
                print("Data is update!")
                result = true
            }
        }
        task.resume()
        return result
    }
    
}//======
