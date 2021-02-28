//
//  LMW_UpdateModel.swift
//  WooBoo_Project
//
//  Created by 이민우 on 2021/02/26.
//

import Foundation

class LMW_UpdateModel: NSObject{
    
    var urlPath = ""
    
    func update_rViews(questions_qSeqno: Int, views: Int){
        urlPath = "http://127.0.0.1:8080/ios_jsp/wooboo_Update_views.jsp"
        let urlAdd = "?questions_qSeqno=\(questions_qSeqno)&views=\(views)"
        urlPath = urlPath + urlAdd
        
        //한글 url encoding
        urlPath = urlPath.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url){(data, response, error) in
            if error != nil{
                print("Failed to update data")
            }else{
                print("Data is update!")
            }
        }
        task.resume()
    }
    
    func update_MyQuestions(qSeqno : Int){
        var urlPath = "http://127.0.0.1:8080/ios_jsp/wooboo_Update_qDeleteDate.jsp"
        let urlAdd = "?qSeqno=\(qSeqno)&user_uSeqno=\(Share.uSeqno)"
        urlPath = urlPath + urlAdd
        
        //한글 url encoding
        urlPath = urlPath.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url){(data, response, error) in
            if error != nil{
                print("Failed to delete data")
            }else{
                print("Data is delete!")
            }
        }
        task.resume()
    }
    
}//======
