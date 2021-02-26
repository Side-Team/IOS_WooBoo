//
//  LMW_DeleteModel.swift
//  WooBoo_Project
//
//  Created by 이민우 on 2021/02/26.
//

import Foundation

class LMW_DeleteModel:NSObject{
    var urlPath = ""
    
    func delete_like(questions_qSeqno : Int) -> Bool{
        var urlPath = "http://127.0.0.1:8080/ios_jsp/wooboo_Delete_like.jsp"
        var result: Bool = false
        let urlAdd = "?questions_qSeqno=\(questions_qSeqno)&user_uSeqno=\(Share.uSeqno)"
        urlPath = urlPath + urlAdd
        
        //한글 url encoding
        urlPath = urlPath.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url){(data, response, error) in
            if error != nil{
                print("Failed to delete data")
                result = false
            }else{
                print("Data is delete!")
                result = true
            }
        }
        task.resume()
        return result
    }
    
}//=====
