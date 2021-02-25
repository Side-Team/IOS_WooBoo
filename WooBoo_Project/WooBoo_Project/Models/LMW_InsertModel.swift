//
//  LMW_InsertModel.swift
//  WooBoo_Project
//
//  Created by 이민우 on 2021/02/26.
//

import Foundation

class LMW_InsertModel: NSObject{
    
    var urlPath = "http://127.0.0.1:8080/ios_jsp/InsertQuestion.jsp"
    
    func insertItems(qTitle: String, qSelection1: String, qSelection2: String, qSelection3: String, qSelection4: String, qSelection5: String, qCategory: Int, qImageFileName1: String, qImageFileName2: String, qImageFileName3: String, qImageFileName4: String, qImageFileName5: String) -> Bool{
        var result: Bool = true
        let urlAdd = "?user_uSeqno=\(Share.uSeqno)&qTitle=\(qTitle)&qSelection1=\(qSelection1)&qSelection2=\(qSelection2)&qSelection3=\(qSelection3)&qSelection4=\(qSelection4)&qSelection5=\(qSelection5)&qCategory=\(qCategory)&qImageFileName1=\(qImageFileName1)&qImageFileName2=\(qImageFileName2)&qImageFileName3=\(qImageFileName3)&qImageFileName4=\(qImageFileName4)&qImageFileName5=\(qImageFileName5)"
        
        urlPath = urlPath + urlAdd
        
        print("insertItems urlPath : ", urlPath)
        
        //한글 url encoding
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
        task.resume()
        return result
    }
    
    func insert_registerT(questions_qSeqno : Int, user_uSeqno : Int) -> Bool{
        var urlPath = "http://127.0.0.1:8080/ios_jsp/wooboo_Insert_register.jsp"
        var result: Bool = true
        let urlAdd = "?questions_qSeqno=\(questions_qSeqno)&user_uSeqno=\(user_uSeqno)"
        
        urlPath = urlPath + urlAdd
        
        print("insert_registerT urlPath : ", urlPath)
        
        //한글 url encoding
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
        task.resume()
        return result
    }
}//=======
