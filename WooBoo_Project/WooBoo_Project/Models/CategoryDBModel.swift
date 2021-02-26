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
    var qTitle: String?
    var qSelection1: String?
    var qSelection2: String?
    var qSelection3: String?
    var qSelection4: String?
    var qSelection5: String?
    var qImageFileName: String?
    var qCategory: String?
    var qInsertDate: String?
    var qDeleteDate: String?

    
    // Empty constructor
    override init() {
        
    }
    
    init(qSeqno: String, qTitle: String, qSelection1: String, qSelection2: String, qSelection3: String, qSelection4:String, qSelection5: String, qImageFileName: String, qCategory: String, qInsertDate: String, qDeleteDate: String){
        self.qSeqno = qSeqno
        self.qTitle = qTitle
        self.qSelection1 = qSelection1
        self.qSelection2 = qSelection2
        self.qSelection3 = qSelection3
        self.qSelection4 = qSelection4
        self.qSelection5 = qSelection5
        self.qImageFileName = qImageFileName
        self.qCategory = qCategory
        self.qInsertDate = qInsertDate
        self.qDeleteDate = qDeleteDate

    }
    
}
