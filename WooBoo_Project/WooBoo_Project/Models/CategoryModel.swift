//
//  JsonModel.swift
//  ServerJson_01
//
//  Created by ssemm on 2021/02/15.
//

import Foundation

protocol CategoryModelProtocol: class{

    func itemDownloaded(items: NSArray)
    
}

class CategoryModel: NSObject{
    var delegate: CategoryModelProtocol!
    
    
    func categoryItems(category: String){
        var urlPath = "http://127.0.0.1:8080/ios_jsp/wooboo_categorySelect.jsp"
        let urlAdd = "?category=\(category)"
        urlPath = urlPath + urlAdd
        print("urlPath:\(urlPath)")
        let url = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
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
            let query = categoryDBModel()
            
            if let qTitle = jsonElement["qTitle"] as? String,
               let qSelection1 = jsonElement["qSelection1"] as? String,
               let qSelection2 = jsonElement["qSelection2"] as? String,
               let qSelection3 = jsonElement["qSelection3"] as? String,
               let qSelection4 = jsonElement["qSelection4"] as? String,
               let qSelection5 = jsonElement["qSelection5"] as? String,
               let qCategory = jsonElement["qCategory"] as? String,
               let qInsertDate = jsonElement["qInsertDate"] as? String,
               let qDeleteDate = jsonElement["qDeleteDate"] as? String,
               let qImageFileName1 = jsonElement["qImageFileName1"] as? String,
               let qImageFileName2 = jsonElement["qImageFileName2"] as? String,
               let qImageFileName3 = jsonElement["qImageFileName3"] as? String,
               let qImageFileName4 = jsonElement["qImageFileName4"] as? String,
               let qImageFileName5 = jsonElement["qImageFileName5"] as? String{
                query.qTitle = qTitle
                query.qSelection1 = qSelection1
                query.qSelection2 = qSelection2
                query.qSelection3 = qSelection3
                query.qSelection4 = qSelection4
                query.qSelection5 = qSelection5
                query.qCategory = qCategory
                query.qInsertDate = qInsertDate
                query.qDeleteDate = qDeleteDate
                query.qImageFileName1 = qImageFileName1
                query.qImageFileName2 = qImageFileName2
                query.qImageFileName3 = qImageFileName3
                query.qImageFileName4 = qImageFileName4
                query.qImageFileName5 = qImageFileName5
               
            
            }
            locations.add(query)
        }
        DispatchQueue.main.async(execute: {() -> Void in
            
            self.delegate.itemDownloaded(items: locations)
        })
        print("jsonElement ==== \(jsonElement)")
    }
    
}
