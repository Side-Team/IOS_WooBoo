//
//  ContentDetailViewController.swift
//  WooBoo_Project
//
//  Created by 이민우 on 2021/02/23.
//

import UIKit

class ContentDetailViewController: UIViewController, Get_questions_Detail {
    func itemDownloaded(items: NSArray) {
        self.datas = items
    }
    
    
    var testNum = 0
    let customColor = UIColor(red: 128/255, green: 194/255, blue: 179/255, alpha: 1)
    
    var datas = NSArray()
    
    @IBOutlet weak var lblTotalSelector: UILabel!
    @IBOutlet weak var lblViews: UILabel!
    @IBOutlet weak var txtCategory: UITextField!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var outlet_BtnLike: UIButton!
    @IBOutlet weak var outlet_BtnShare: UIButton!
    @IBOutlet weak var outlet_BtnReport: UIButton!
    
    @IBOutlet weak var outlet_btn1: UIButton!
    @IBOutlet weak var outlet_btn2: UIButton!
    @IBOutlet weak var outlet_btn3: UIButton!
    @IBOutlet weak var outlet_btn4: UIButton!
    @IBOutlet weak var outlet_btn5: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDesign()
        
        let selectModel = LMW_SelectModel()
        selectModel.delegate1 = self
        selectModel.downloadItems(funcName: "get_questionsDetail", urlPath: "http://127.0.0.1:8080/ios_jsp/wooboo_get_questionsDetail.jsp?qSeqno=20") // qSeqno 테스트값 대신 cell선택 값 넣어주기
        print("")
    }
    
    @IBAction func btnLike(_ sender: UIButton) {
        if testNum == 0{
            print("0번")
            testNum = 1
            outlet_BtnLike.setImage(UIImage(systemName: "heart.fill"), for: .normal)
 
        }else{
            print("1번")
            testNum = 0
            outlet_BtnLike.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        
    }
    
    @IBAction func btnShare(_ sender: UIButton) {
    }
    
    @IBAction func btnReport(_ sender: UIButton) {
    }
    
    @IBAction func btn1(_ sender: UIButton) {
    }
    
    @IBAction func btn2(_ sender: UIButton) {
    }
    
    @IBAction func btn3(_ sender: UIButton) {
    }
    
    @IBAction func btn4(_ sender: UIButton) {
    }
    
    @IBAction func btn5(_ sender: UIButton) {
    }
    
    func setDesign(){
        outlet_BtnLike.tintColor = customColor
        
        txtCategory.layer.borderWidth = 2
        txtCategory.layer.borderColor = customColor.cgColor
        txtCategory.layer.cornerRadius = 15
        
        txtTitle.layer.borderWidth = 2
        txtTitle.layer.borderColor = customColor.cgColor
        txtTitle.layer.cornerRadius = 15
        
    }
   
}
