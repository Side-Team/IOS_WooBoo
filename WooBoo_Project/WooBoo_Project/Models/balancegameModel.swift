//
//  balancegameModel.swift
//  WooBoo_Project
//
//  Created by 김보람 on 2021/02/24.
//

import Foundation

class balancegameModel: NSObject{
  
    var bSeqno: Int?
    var bTitle: String?
    var bSelection1: String?
    var bSelection2: String?

    override init() {
        
    }

    init(bTitle: String,bSelection1: String, bSelection2: String ){
        self.bTitle = bTitle
        self.bSelection1 = bSelection1
        self.bSelection2 = bSelection2
    }
}


