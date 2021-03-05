//
//  BalanceGameSelectController.swift
//  WooBoo_Project
//
//  Created by 김보람 on 2021/02/24.
//

import UIKit

class BalanceGameSelectController: UIViewController, balancegameSelectModelProtocol, balancrgamePeopleProtocol,balancegameBtn1countProtocol,balancegameBtn2countProtocol {
   

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnSelect1: UIButton!
    @IBOutlet weak var btnSelect2: UIButton!
    @IBOutlet weak var lblSelect1percent: UILabel!
    @IBOutlet weak var lblSelect2percent: UILabel!
    @IBOutlet weak var lblSelect2Count: UILabel!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var lblSelect1Count: UILabel!
    
    var bSeqno: Int = 0
    var checkValue = -1
    var checkPeople:Int = 0

    //db
    var feedItem: NSArray = NSArray()
    var countItem:NSArray = NSArray()
    var btn1Item: NSArray = NSArray()
    var btn2Item: NSArray = NSArray()
    
    func itemDownloaded(items: NSArray) {
        feedItem = items
        loadData()
        loadbtn()
    
    }
    
    func itemPeopleCount(items: NSArray) {
        countItem = items
        loadClickPeople()
    }
    
    func itemBtn1Count(items: NSArray) {
        
        btn1Item = items
//        loadClick1()
        
    }
    
    func itemBtn2Count(items: NSArray) {
        
        btn2Item = items
//        loadClick2()
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        design()

        
        
        let balanceSelectModel = balancegameSelectModel()
        balanceSelectModel.delegate = self
        balanceSelectModel.downloadItems()
        
        
        let peopleCount = balancegamePeopleCountModel()
        peopleCount.delegate = self
        peopleCount.downloadItems()


        let btn1Count = balancegameBtn1count()
        btn1Count.delegate = self
        btn1Count.downloadItems()

        let btn2Count = balancegameBtn2count()
        btn2Count.delegate = self
        btn2Count.downloadItems()
       
       
       
    }
    

    
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
        loadbtn()
        

    }
    
    
    func checkButtonStatus(){

            if checkValue == 0{
                btnSelect1.backgroundColor = UIColor(red: 128/255, green: 194/255, blue: 179/255, alpha: 1)
                btnSelect1.setTitleColor(UIColor.white, for: UIControl.State.normal)
                btnSelect2.backgroundColor = UIColor.white
                btnSelect2.setTitleColor(UIColor.black, for: UIControl.State.normal)
                btnNext.setTitle("다음", for: UIControl.State.normal)
                clickDataUpdate()
                loadClick1()
                loadClick2()
               
                

            }else{
                btnSelect1.backgroundColor = UIColor.white
                btnSelect1.setTitleColor(UIColor.black, for: UIControl.State.normal)
                btnSelect2.backgroundColor = UIColor(red: 128/255, green: 194/255, blue: 179/255, alpha: 1)
                btnSelect2.setTitleColor(UIColor.white, for: UIControl.State.normal)
                btnNext.setTitle("다음", for: UIControl.State.normal)
                clickDataUpdate()
                loadClick1()
                loadClick2()
            }
        } // checkButtonStatus 끝
    
    
    
    func loadData(){
        let num = Int.random(in: 1...43)
        let item: balancegameModel = feedItem[num] as! balancegameModel
        bSeqno = Int(item.bSeqno!)!
        lblTitle.text = "\(item.bTitle!)"
        btnSelect1.setTitle("\(item.bSelection1!)", for: UIControl.State.normal)
        btnSelect2.setTitle("\(item.bSelection2!)", for: UIControl.State.normal)
        Share.gameNum = num
        print("shareGameNum",Share.gameNum)

    }
    
    
    func loadClickPeople(){
        let item: SelectgameModel = countItem[0] as! SelectgameModel
        checkPeople = Int(item.count!)!
        print("checkPeople\(checkPeople)")
       
    }
    
    func loadClick1(){
        
        
        let item: SelectgameModel = btn1Item[0] as! SelectgameModel
        lblSelect1Count.text = "\(item.btn1!) 명"
        print("btn1 \(item.btn1!)")
        lblSelect1percent.text = "\(String(format: "%.f", ((Double(item.btn1!)!)/Double(checkPeople)) * 100))%"
        
        
    }
    
    func loadClick2(){
        
        let item: SelectgameModel = btn2Item[0] as! SelectgameModel
        lblSelect2Count.text = "\(item.btn2!) 명"
        print("btn2 \(item.btn2!)")
        lblSelect2percent.text = "\(String(format: "%.f", ((Double(item.btn2!)!)/Double(checkPeople)) * 100))%"
      
    }
  
    func loadbtn(){
        let peopleCount = balancegamePeopleCountModel()
        peopleCount.delegate = self
        peopleCount.downloadItems()
        
        
        let btn1Count = balancegameBtn1count()
        btn1Count.delegate = self
        btn1Count.downloadItems()
        
        let btn2Count = balancegameBtn2count()
        btn2Count.delegate = self
        btn2Count.downloadItems()
        
    }
    
    
    func clickDataUpdate(){
        let balancegame_bSeqno = String(bSeqno)
        let user_uSeqno = UserDefaults.standard.string(forKey: "uSeqno")!
        let sbSelection = String(checkValue)
        
        let balanceInsert = balanceInsertModle()
        let result = balanceInsert.insertItems(balancegame_bSeqno: balancegame_bSeqno, user_uSeqno: user_uSeqno, sbSelection: sbSelection)
        if result == true{
           print("안써도 되나?")
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
        lblSelect1percent.text = ""
        lblSelect1Count.text = ""
        lblSelect2percent.text = ""
        lblSelect2Count.text = ""
        btnNext.setTitle("", for: UIControl.State.normal)
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
