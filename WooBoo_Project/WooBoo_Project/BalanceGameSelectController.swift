//
//  BalanceGameSelectController.swift
//  WooBoo_Project
//
//  Created by 김보람 on 2021/02/24.
//

import UIKit

class BalanceGameSelectController: UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnSelect1: UIButton!
    @IBOutlet weak var btnSelect2: UIButton!
    @IBOutlet weak var lblSelect1percent: UILabel!
    @IBOutlet weak var lblSelect2percent: UILabel!
    @IBOutlet weak var lblSelect2Count: UILabel!
    @IBOutlet weak var lblSelect1Count: UILabel!
    
    var btitle: String = ""
    var select1: String = "바뀌나"
    var select2: String = ""
    var select1Percent : String = ""
    var select1Count: String = ""
    var select2Percent: String = ""
    var select2Count: String = ""
    var checkValue = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        design()
        

    }
    
    @IBAction func btnSelect1(_ sender: UIButton) {
        checkValue = 0
        checkButtonStatus()
    }
    
    @IBAction func btnSelect2(_ sender: UIButton) {
        checkValue = 1
        checkButtonStatus()
    }
    

    
    func checkButtonStatus(){

            if checkValue == 0{
                btnSelect1.backgroundColor = UIColor(red: 128/255, green: 194/255, blue: 179/255, alpha: 1)
                btnSelect1.setTitleColor(UIColor.white, for: UIControl.State.normal)
                btnSelect2.backgroundColor = UIColor.white
                btnSelect2.setTitleColor(UIColor.black, for: UIControl.State.normal)
                
                // 여기에 버튼 클릭됐을때 밑에 퍼센트값이랑 카운트 보이고 안보이고넣기

            }else{
                btnSelect1.backgroundColor = UIColor.white
                btnSelect1.setTitleColor(UIColor.black, for: UIControl.State.normal)
                btnSelect2.backgroundColor = UIColor(red: 128/255, green: 194/255, blue: 179/255, alpha: 1)
                btnSelect2.setTitleColor(UIColor.white, for: UIControl.State.normal)
                // 여기에 버튼 클릭됐을때 밑에 퍼센트값이랑 카운트 보이고 안보이고넣기
            }
        } // checkButtonStatus 끝
    
    
    func design(){
        
        //btnSelect1.setTitle(select1, for: UIControl.State.normal)
        btnSelect1.layer.cornerRadius = 10
        btnSelect1.layer.borderWidth = 2
        btnSelect1.layer.borderColor = UIColor(red: 128/255, green: 194/255, blue: 179/255, alpha: 1).cgColor
        
        btnSelect2.layer.cornerRadius = 10
        btnSelect2.layer.borderWidth = 2
        btnSelect2.layer.borderColor = UIColor(red: 128/255, green: 194/255, blue: 179/255, alpha: 1).cgColor
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
