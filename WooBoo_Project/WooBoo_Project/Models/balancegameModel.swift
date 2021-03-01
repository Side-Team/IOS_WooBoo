//
//  balancegameModel.swift
//  WooBoo_Project
//
//  Created by 김보람 on 2021/02/24.
//

import Foundation

class balancegameModel: NSObject{
  
    var bSeqno: String?
    var bTitle: String?
    var bSelection1: String?
    var bSelection2: String?

    override init() {
        
    }

    init(bSeqno: String, bTitle: String,bSelection1: String, bSelection2: String ){
        
        self.bSeqno = bSeqno
        self.bTitle = bTitle
        self.bSelection1 = bSelection1
        self.bSelection2 = bSelection2
    }
    init(bSeqno: String, bSelection1: String, bSelection2: String) {
        
        self.bSeqno = bSeqno
        self.bSelection1 = bSelection1
        self.bSelection2 = bSelection2
    }
}


