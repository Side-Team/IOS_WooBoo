//
//  ContentDetailViewController.swift
//  WooBoo_Project
//
//  Created by 이민우 on 2021/02/23.
//

import UIKit

class ContentDetailViewController: UIViewController, return_sqSelection,  Get_resgister_count, Get_select_question_countSelector {
    func return_select_question_countSelector(countSelector: Int) {
        print("countSelector : \(countSelector)")
        lblTotalSelector.text = "\(countSelector)명의 선택!"
    }
    
    func return_register_count(count: Int, views: Int) {
        print("직전 조회수 : \(views)")
        if count == 0{
            let updateModel = LMW_UpdateModel()
            // questions_qSeqno에 받은 값 넣어주기
            updateModel.update_rViews(questions_qSeqno: 20, views: views + 1)
            
            lblViews.text = "조회수 \(String(views + 1))"
            
//            let selectModel = LMW_SelectModel()
//            selectModel.downloadItems(funcName: "get_register_views", urlPath: "http://127.0.0.1:8080/ios_jsp/wooboo_Select_views.jsp?questions_qSeqno=20")
        }else{
//            let selectModel = LMW_SelectModel()
//            selectModel.downloadItems(funcName: "get_register_views", urlPath: "http://127.0.0.1:8080/ios_jsp/wooboo_Select_views.jsp?questions_qSeqno=20")
            
            lblViews.text = "조회수 \(String(views))"
        }
    }
    
    func itemDownloaded(sqSelection: Int) {
        self.sqSelection = sqSelection
        self.setDesign()
        print("sqSelection : \(sqSelection)")
    }
    
    var sqSelection = 0
    var like_SwitchNum = 0
    let customColor = UIColor(red: 128/255, green: 194/255, blue: 179/255, alpha: 1)
        
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
        
       


    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let selectModel = LMW_Select_sqSelection()
        selectModel.delegate = self
        selectModel.downloadItems(questions_qSeqno: 20)
        
        let selectModel2 = LMW_SelectModel()
        selectModel2.delegate3 = self
        selectModel2.delegate4 = self

        selectModel2.downloadItems(funcName: "check_register", urlPath: "http://127.0.0.1:8080/ios_jsp/wooboo_Select_register.jsp?questions_qSeqno=20&user_uSeqno=\(Share.uSeqno)")
        selectModel2.downloadItems(funcName: "get_countSelector", urlPath: "http://127.0.0.1:8080/ios_jsp/wooboo_Select_countSelector.jsp?questions_qSeqno=20")



    }

    @IBAction func btnLike(_ sender: UIButton) {
        if like_SwitchNum == 0{
            let insertModel = LMW_InsertModel()
            let result = insertModel.insert_like(questions_qSeqno: 20) // questions_qSeqno 넣어주기
            
            if result == true{
                print("like \(result)")
            }else{
                print("like \(result)")
            }
            
            print("0번")
            
            
            like_SwitchNum = 1
            outlet_BtnLike.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            
 
        }else{
            let deleteModel = LMW_DeleteModel()
            let result = deleteModel.delete_like(questions_qSeqno: 20) // questions_qSeqno 넣어주기
            
            if result == true{
                print("like 삭제 \(result)")
            }else{
                print("like 삭제 \(result)")
            }
            
            print("1번")
            like_SwitchNum = 0
            outlet_BtnLike.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        
    }
    
    @IBAction func btnShare(_ sender: UIButton) {
    }
    
    @IBAction func btnReport(_ sender: UIButton) {
    }
    
    @IBAction func btn1(_ sender: UIButton) {
        clickButtonAction(clickNum: 1)
    }
    
    @IBAction func btn2(_ sender: UIButton) {
        clickButtonAction(clickNum: 2)
    }
    
    @IBAction func btn3(_ sender: UIButton) {
        clickButtonAction(clickNum: 3)
    }
    
    @IBAction func btn4(_ sender: UIButton) {
        clickButtonAction(clickNum: 4)
    }
    
    @IBAction func btn5(_ sender: UIButton) {
        clickButtonAction(clickNum: 5)
    }
    
    func setDesign(){
        selectedButton()
        
        lblViews.textColor = customColor
        
        outlet_BtnLike.tintColor = customColor
        
        txtCategory.layer.borderWidth = 2
        txtCategory.layer.borderColor = customColor.cgColor
        txtCategory.layer.cornerRadius = 15
        
        txtTitle.layer.borderWidth = 2
        txtTitle.layer.borderColor = customColor.cgColor
        txtTitle.layer.cornerRadius = 15
        
        // Title에 민규가 준 값 넣기
        outlet_btn1.setTitle("1번 선택", for: .normal)
        outlet_btn1.layer.borderWidth = 2
        outlet_btn1.layer.cornerRadius = 15
        outlet_btn1.layer.borderColor = customColor.cgColor

        outlet_btn2.setTitle("2번 선택", for: .normal)
        outlet_btn2.layer.borderWidth = 2
        outlet_btn2.layer.cornerRadius = 15
        outlet_btn2.layer.borderColor = customColor.cgColor
        
        outlet_btn3.setTitle("3번 선택", for: .normal)
        outlet_btn3.layer.borderWidth = 2
        outlet_btn3.layer.cornerRadius = 15
        outlet_btn3.layer.borderColor = customColor.cgColor
        
        outlet_btn4.setTitle("4번 선택", for: .normal)
        outlet_btn4.layer.borderWidth = 2
        outlet_btn4.layer.cornerRadius = 15
        outlet_btn4.layer.borderColor = customColor.cgColor
        
        outlet_btn5.setTitle("5번 선택", for: .normal)
        outlet_btn5.layer.borderWidth = 2
        outlet_btn5.layer.cornerRadius = 15
        outlet_btn5.layer.borderColor = customColor.cgColor

    }
    
    func selectedButton(){

        outlet_btn1.isEnabled = false
        outlet_btn2.isEnabled = false
        outlet_btn3.isEnabled = false
        outlet_btn4.isEnabled = false
        outlet_btn5.isEnabled = false
        
        switch sqSelection{
        case 0:
            outlet_btn1.isEnabled = true
            outlet_btn2.isEnabled = true
            outlet_btn3.isEnabled = true
            outlet_btn4.isEnabled = true
            outlet_btn5.isEnabled = true
            
        case 1:
            outlet_btn1.backgroundColor = customColor
            outlet_btn1.setTitleColor(.white, for: .normal)
            outlet_btn1.titleLabel?.font = UIFont(name: outlet_btn1.titleLabel!.font.fontName, size: 20)
        case 2:
            outlet_btn2.backgroundColor = customColor
            outlet_btn2.setTitleColor(.white, for: .normal)
            outlet_btn2.titleLabel?.font = UIFont(name: outlet_btn2.titleLabel!.font.fontName, size: 20)
        case 3:
            outlet_btn3.backgroundColor = customColor
            outlet_btn3.setTitleColor(.white, for: .normal)
            outlet_btn3.titleLabel?.font = UIFont(name: outlet_btn3.titleLabel!.font.fontName, size: 20)
        case 4:
            outlet_btn4.backgroundColor = customColor
            outlet_btn4.setTitleColor(.white, for: .normal)
            outlet_btn4.titleLabel?.font = UIFont(name: outlet_btn4.titleLabel!.font.fontName, size: 20)
        default:
            outlet_btn5.backgroundColor = customColor
            outlet_btn5.setTitleColor(.white, for: .normal)
            outlet_btn5.titleLabel?.font = UIFont(name: outlet_btn5.titleLabel!.font.fontName, size: 20)

        }
    }
   
    func setValues(){
        
//        let item: LMW_questionsT = datas[0] as! LMW_questionsT
//        
//        txtCategory.text! = makeCategoryString(categoryNum: item.qCategory!)
//        txtTitle.text! = item.qTitle!
//        outlet_btn1.setTitle(item.qSelection1, for: .normal)
//        outlet_btn2.setTitle(item.qSelection2, for: .normal)
//        
//        if item.qSelection3 != "X"{
//            outlet_btn3.isHidden = false
//            outlet_btn3.setTitle(item.qSelection3, for: .normal)
//        }
//        
//        if item.qSelection4 != "X"{
//            outlet_btn4.isHidden = false
//            outlet_btn4.setTitle(item.qSelection4, for: .normal)
//        }
//        
//        if item.qSelection5 != "X"{
//            outlet_btn5.isHidden = false
//            outlet_btn5.setTitle(item.qSelection5, for: .normal)
//        }
    }
    
    func clickButtonAction(clickNum : Int){
        let insertModel = LMW_InsertModel()
        insertModel.insert_sqSelection(questions_qSeqno: 20, sqSelection: clickNum)
        
        sqSelection = clickNum
        selectedButton()
        
    }
    
    func makeCategoryString(categoryNum : Int) -> String{
        switch categoryNum{
        case 0:
           return "음식"
        case 1:
            return "여행"
        case 2:
            return "연애"
        case 3:
            return "결혼"
        case 4:
            return "성"
        default:
            return "기타"
        }
    }

}
