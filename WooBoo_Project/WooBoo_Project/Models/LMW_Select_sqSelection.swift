//
//  LMW_Select_sqSelection.swift
//  WooBoo_Project
//
//  Created by 이민우 on 2021/02/26.
//

import Foundation

protocol return_sqSelection: class {
    func itemDownloaded(sqSelection: Int)
}

class LMW_Select_sqSelection{
    var delegate: return_sqSelection!
    var urlPath = "http://127.0.0.1:8080/ios_jsp/wooboo_Select_sqSelection.jsp"

    func downloadItems(questions_qSeqno : Int){
        let urlAdd = "?questions_qSeqno=\(questions_qSeqno)&user_uSeqno=\(Share.uSeqno)"
        urlPath = urlPath + urlAdd
        
        print(urlPath)
        
        let url = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url){(data, response, error)in
            if error != nil{
                print("failed to download data")
            }else{
                print("Data is downloading")
                self.get_sqSelection(data!)
            }
        }
        task.resume()
    }
    
    func get_sqSelection(_ data: Data){
        print("get_sqSelection")

        var jsonResult = NSArray()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            
        }catch let error as NSError{
            print(error)
        }
        
        var jsonElement = NSDictionary()
        var sqSelection = 0
        
        for i in 0..<jsonResult.count{
            jsonElement =  jsonResult[i] as! NSDictionary
            
            if let jsp_sqSelection = jsonElement["sqSelection"] as? String{
                sqSelection = Int(jsp_sqSelection)!
                print("get_sqSelection 값 : \(sqSelection)")
            }
            print("get_sqSelection")

        }
        DispatchQueue.main.async(execute: {() -> Void in
            self.delegate.itemDownloaded(sqSelection: sqSelection)
            print("DispatchQueue")
        })
    }

}

