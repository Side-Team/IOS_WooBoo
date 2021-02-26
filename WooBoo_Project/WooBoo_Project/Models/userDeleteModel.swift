//
//  userDeleteModel.swift
//  WooBoo_Project
//
//  Created by 김보람 on 2021/02/26.
//

import Foundation

class userDeleteModel: NSObject{
    
    let urlPath = "http://127.0.0.1:8080/ios_jsp/wooboo_userDelete.jsp?uEmail=\(Share.userID)"
    
    func insertItems() -> Bool{
        var result: Bool = true
        
        
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
}
