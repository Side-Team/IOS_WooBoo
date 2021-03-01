//
//  balanceInsertModel.swift
//  WooBoo_Project
//
//  Created by 김보람 on 2021/03/01.
//

import Foundation

class balanceInsertModle: NSObject{
    
    var urlPath = "http://127.0.0.1:8080/ios_jsp/wooboo_balanceGameResultInsert.jsp"
    
    func insertItems(balancegame_bSeqno : String, user_uSeqno: String, sbSelection: String) -> Bool{
        var result: Bool = true
        let urlAdd = "?balancegame_bSeqno=\(balancegame_bSeqno)&user_uSeqno=\(user_uSeqno)&sbSelection=\(sbSelection)"
        urlPath = urlPath + urlAdd
        print(urlPath)
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
}//====
