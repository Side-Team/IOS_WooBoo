//
//  LMW_questionsT.swift
//  WooBoo_Project
//
//  Created by 이민우 on 2021/02/26.
//

import Foundation

class LMW_questionsT : NSObject{
    var qSeqno: Int?
    var user_uSeqno: Int?
    var qTitle: String?
    var qSelection1: String?
    var qSelection2: String?
    var qSelection3: String?
    var qSelection4: String?
    var qSelection5: String?
    var qCategory: Int?
    var qInsertDate: String?
    var qDeleteDate: String?
    var qImageFileName1: String?
    var qImageFileName2: String?
    var qImageFileName3: String?
    var qImageFileName4: String?
    var qImageFileName5: String?
    
    //Empty constructor
    override init() {
        
    }
    
    init(qTitle : String, qSelection1 : String, qSelection2 : String, qSelection3 : String, qSelection4 : String, qSelection5 : String,
         qCategory : Int, qInsertDate : String, qDeleteDate : String, qImageFileName1 : String, qImageFileName2 : String, qImageFileName3 : String, qImageFileName4 : String, qImageFileName5 : String) {
        self.qTitle = qTitle
        self.qSelection1 = qSelection1
        self.qSelection2 = qSelection2
        self.qSelection3 = qSelection3
        self.qSelection4 = qSelection4
        self.qSelection5 = qSelection5
        self.qCategory = qCategory
        self.qInsertDate = qInsertDate
        self.qDeleteDate = qDeleteDate
        self.qImageFileName1 = qImageFileName1
        self.qImageFileName2 = qImageFileName2
        self.qImageFileName3 = qImageFileName3
        self.qImageFileName4 = qImageFileName4
        self.qImageFileName5 = qImageFileName5
    }
}
