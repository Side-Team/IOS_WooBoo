//
//  BalanceGameSelectController.swift
//  WooBoo_Project
//
//  Created by 김보람 on 2021/02/24.
//

import UIKit

class BalanceGameSelectController: UIViewController, balancegameSelectModelProtocol {

    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnSelect1: UIButton!
    @IBOutlet weak var btnSelect2: UIButton!
    @IBOutlet weak var lblSelect1percent: UILabel!
    @IBOutlet weak var lblSelect2percent: UILabel!
    @IBOutlet weak var lblSelect2Count: UILabel!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var lblSelect1Count: UILabel!
    
    var bSeqno: Int = 0
    var btitle: String = ""
    var select1: String = "바뀌나"
    var select2: String = ""
    var select1Percent : String = ""
    var select1Count: String = ""
    var select2Percent: String = ""
    var select2Count: String = ""
    var checkValue = -1
    

    //db
    var feedItem: NSArray = NSArray()
   
    
    func itemDownloaded(items: NSArray) {
        feedItem = items
        loadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        design()
        
        let balanceSelectModel = balancegameSelectModel()
        balanceSelectModel.delegate = self
        balanceSelectModel.downloadItems()
        
        
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        let gameSelectModel = balancegameSelectModel()
//        gameSelectModel.delegate = self
//        gameSelectModel.downloadItems()
//        loadData()
//    }
 
    
    @IBAction func btnSelect1(_ sender: UIButton) {
        checkValue = 0
        checkButtonStatus()
    }
    
    @IBAction func btnSelect2(_ sender: UIButton) {
        checkValue = 1
        checkButtonStatus()
    }
    
    @IBAction func btnNext(_ sender: UIButton) {
        loadData()
        clickDesign()

    }
    
    
    func checkButtonStatus(){

            if checkValue == 0{
                btnSelect1.backgroundColor = UIColor(red: 128/255, green: 194/255, blue: 179/255, alpha: 1)
                btnSelect1.setTitleColor(UIColor.white, for: UIControl.State.normal)
                btnSelect2.backgroundColor = UIColor.white
                btnSelect2.setTitleColor(UIColor.black, for: UIControl.State.normal)
                btnNext.setTitle("다음", for: UIControl.State.normal)
                clickDataUpdate()

            }else{
                btnSelect1.backgroundColor = UIColor.white
                btnSelect1.setTitleColor(UIColor.black, for: UIControl.State.normal)
                btnSelect2.backgroundColor = UIColor(red: 128/255, green: 194/255, blue: 179/255, alpha: 1)
                btnSelect2.setTitleColor(UIColor.white, for: UIControl.State.normal)
                btnNext.setTitle("다음", for: UIControl.State.normal)
                clickDataUpdate()
            }
        } // checkButtonStatus 끝
    
    
    
    func loadData(){
        let num = Int.random(in: 1...43)
        let item: balancegameModel = feedItem[num] as! balancegameModel
        bSeqno = Int(item.bSeqno!)!
        lblTitle.text = "\(item.bTitle!)"
        btnSelect1.setTitle("\(item.bSelection1!)", for: UIControl.State.normal)
        btnSelect2.setTitle("\(item.bSelection2!)", for: UIControl.State.normal)
        print(num)
        print("1", item.bSeqno!)
        print("2", item.bTitle!)
        print("3", item.bSelection1!)
        print("4", item.bSelection2!)
    }
    
    func loadClick(){
        // 몇명이 눌렀는지 select로 보여줘야함
    }
    
    func clickDataUpdate(){
        let balancegame_bSeqno = String(bSeqno)
        let user_uSeqno = UserDefaults.standard.string(forKey: "uSeqno")!
        let sbSelection = String(checkValue)
        
        let balanceInsert = balanceInsertModle()
        let result = balanceInsert.insertItems(balancegame_bSeqno: balancegame_bSeqno, user_uSeqno: user_uSeqno, sbSelection: sbSelection)
        if result == true{
            loadClick()
            }else{ // 에러일 경우
            let resultAlert = UIAlertController(title: "실패", message: "에러가 발생 되었습니다.", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true, completion: nil)
        }
       
    }//
    

    
    func design(){
        
        //btnSelect1.setTitle(select1, for: UIControl.State.normal)
        btnSelect1.layer.cornerRadius = 10
        btnSelect1.layer.borderWidth = 2
        btnSelect1.layer.borderColor = UIColor(red: 128/255, green: 194/255, blue: 179/255, alpha: 1).cgColor
        
        btnSelect2.layer.cornerRadius = 10
        btnSelect2.layer.borderWidth = 2
        btnSelect2.layer.borderColor = UIColor(red: 128/255, green: 194/255, blue: 179/255, alpha: 1).cgColor
    }
    
    func clickDesign(){
        btnSelect1.backgroundColor = UIColor.white
        btnSelect1.setTitleColor(UIColor.black, for: UIControl.State.normal)
        btnSelect2.backgroundColor = UIColor.white
        btnSelect2.setTitleColor(UIColor.black, for: UIControl.State.normal)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

} // 끝
