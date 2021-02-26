//
//  UserUpdateController.swift
//  WooBoo_Project
//
//  Created by 김보람 on 2021/02/24.
//

import UIKit

class UserUpdateController: UIViewController{
    
    @IBOutlet weak var lblEmail: UITextField!
    @IBOutlet weak var lblWooboo: UILabel!
    @IBOutlet weak var lblPassword: UITextField!
    @IBOutlet weak var lblPasswordCheck: UITextField!
    @IBOutlet weak var userImg: UIImageView!

    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblEmail.text = Share.userID
        lblEmail.isEnabled = false
        lblWooboo.text = "우부\(Share.uSeqno)"
        design()

    }
    
  
    
    
    @IBAction func UserDelete(_ sender: UIButton) {
        let userdelete = userDeleteModel()
        let result = userdelete.insertItems()
        if result == true{
            let resultAlert = UIAlertController(title: "완료", message: "회원탈퇴가 완료되었습니다", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {ACTION in
                let vcName = self.storyboard?.instantiateViewController(withIdentifier: "LoginView")
                            vcName?.modalPresentationStyle = .fullScreen
                            self.present(vcName!, animated: true, completion: nil)
            })
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true, completion: nil)
            
        }else{ // 에러일 경우
            let resultAlert = UIAlertController(title: "실패", message: "에러가 발생 되었습니다.", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true, completion: nil)
            
        }
    }//
    
    @IBAction func UserUpdate(_ sender: UIButton) {
    }
    
    @IBAction func UserOK(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func design(){
        userImg.layer.cornerRadius = 45
        userImg.layer.borderColor = UIColor(red: 128/255, green: 194/255, blue: 179/255, alpha: 1).cgColor
        userImg.layer.borderWidth = 2
        
    }


    
/*    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
