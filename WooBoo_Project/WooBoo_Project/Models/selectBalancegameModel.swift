//
//  selectBalancegameModel.swift
//  WooBoo_Project
//
//  Created by 김보람 on 2021/02/24.
//

import Foundation

class selectBalancegameModel: NSObject {
    
    var balancegame_bSeqno: Int?
    var user_uSequno: Int?
    var sbSelecion: Int?
    var sbViews: Int?
    
    
    override init() {
    
    }
    
    init(balancegame_bSeqno: Int, user_uSequno: Int, sbSelecion: Int, sbViews: Int ){
        self.balancegame_bSeqno = balancegame_bSeqno
        self.user_uSequno = user_uSequno
        self.sbSelecion = sbSelecion
        self.sbViews = sbViews
    }
}
