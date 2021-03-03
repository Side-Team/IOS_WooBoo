//
//  SelectgameModel.swift
//  WooBoo_Project
//
//  Created by 김보람 on 2021/03/01.
//

import Foundation

class SelectgameModel: NSObject{
  
    var balancegame_bSeqno: String?
    var user_uSeqno: String?
    var sbSelection: String?
    var sbViews: String?
    var count: String?
    var btn1:String?
    var btn2:String?

    override init() {
        
    }

    init(balancegame_bSeqno: String, user_uSeqno: String,sbSelection: String, sbViews: String ){
        
        self.balancegame_bSeqno = balancegame_bSeqno
        self.user_uSeqno = user_uSeqno
        self.sbSelection = sbSelection
        self.sbViews = sbViews
    }
    
    init(count: String) {
        self.count = count
    }
}
