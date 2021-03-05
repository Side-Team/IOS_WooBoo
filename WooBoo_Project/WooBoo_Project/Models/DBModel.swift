//
//  DMModel.swift
//  ServerJson_02
//
//  Created by 유민규 on 2021/02/15.
//

import Foundation

class DBModel: NSObject{
    
    // Properties
    var stitle: String?
    var nSeqno: String?
    var hotTitle: String?
    var qSeqno: String?

    
    // Empty constructor
    override init() {
        
    }
    
    init(stitle: String, nSeqno: String){
        self.stitle = stitle
        self.nSeqno = nSeqno
    }
    
    init(hotTitle: String, qSeqno: String){
        self.hotTitle = hotTitle
        self.qSeqno = qSeqno
    }
}
