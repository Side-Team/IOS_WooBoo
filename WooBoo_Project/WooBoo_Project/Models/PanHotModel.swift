//
//  PanHotModel.swift
//  WooBoo_Project
//
//  Created by 김보람 on 2021/03/03.
//

import Foundation
//wooboo_Hot

protocol panHotProtocol: class {
    func hotitemDownloaded(items: NSArray)
}

class panHot: NSObject{
    var delegate: panHotProtocol!
    let urlPath = "http://127.0.0.1:8080/ios_jsp/wooboo_Hot.jsp"
    
    func downloadItems(){
        let url = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        print("메인 hot \(url)")
        let task = defaultSession.dataTask(with: url){(data, responds, error) in
            if error != nil{
                print("Failed to download data")
            }else{
                print("Data is downloading")
                self.parseJSON(data!)
            }
        }
        task.resume()
    }
    
    func parseJSON(_ data: Data){
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
            let query = DBModel()
            
            if let hotTitle = jsonElement["htitle"] as? String,
               let qSeqno = jsonElement["seqno"] as? String{
                query.hotTitle = hotTitle
                query.qSeqno = qSeqno
                
                
            }
            locations.add(query)
        }
        DispatchQueue.main.async(execute: {() -> Void in
            self.delegate.hotitemDownloaded(items: locations)
        })
        
    }
    
}
