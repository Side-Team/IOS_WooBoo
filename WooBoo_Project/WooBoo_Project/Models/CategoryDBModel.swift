//
//  DMModel.swift
//  ServerJson_02
//
//  Created by 유민규 on 2021/02/15.
//

import Foundation

class categoryDBModel: NSObject{
    
    // Properties
    var qSeqno: String?
    var user_uSeqno: String?
    var qTitle: String?
    var qSelection1: String?
    var qSelection2: String?
    var qSelection3: String?
    var qSelection4: String?
    var qSelection5: String?
    var qCategory: String?
    var qInsertDate: String?
    var qDeleteDate: String?
    var qImageFileName1: String?
    var qImageFileName2: String?
    var qImageFileName3: String?
    var qImageFileName4: String?
    var qImageFileName5: String?

    
    // Empty constructor
    override init() {
        
    }
    
    init(qSeqno : String, user_uSeqno : String, qTitle : String, qSelection1 : String, qSelection2 : String, qSelection3 : String, qSelection4 : String, qSelection5 : String,
         qCategory : String, qInsertDate : String, qDeleteDate : String, qImageFileName1 : String, qImageFileName2 : String, qImageFileName3 : String, qImageFileName4 : String, qImageFileName5 : String) {
        
        self.qSeqno = qSeqno
        self.user_uSeqno = user_uSeqno
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
