//
//  MyPageQTCell.swift
//  WooBoo_Project
//
//  Created by 이민우 on 2021/03/04.
//

import UIKit

class MyPageQTCell: UITableViewCell {

        @IBOutlet weak var lblTitle: UILabel!
        @IBOutlet weak var lblInsertDate: UILabel!
        @IBOutlet weak var outlet_BtnDelete: UIButton!
        
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
            print("awakeFromNib")
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
            print("setSelected")
            print("selected : \(selected)")

        }

        @IBAction func btnDelete(_ sender: UIButton) {
            print("test")
        }

}
