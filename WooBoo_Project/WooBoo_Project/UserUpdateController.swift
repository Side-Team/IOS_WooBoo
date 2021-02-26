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
        lblWooboo.text = "우부 \(Share.uSeqno)"
        design()
        //userImg.image = UIImage(named: 이름 불러와서 넣을꺼임)

    }
    
  
    
    // 회원탈퇴 버튼
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
    }//===
    
    
    
    // 저장 눌렀을때
    @IBAction func UserUpdate(_ sender: UIButton) {
    }//====
    
    
    
    // 확인 눌렀을떄
    @IBAction func UserOK(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }//===
    
    
    
    // 디자인
    func design(){
        userImg.layer.cornerRadius = 45
        userImg.layer.borderColor = UIColor(red: 128/255, green: 194/255, blue: 179/255, alpha: 1).cgColor
        userImg.layer.borderWidth = 2
        
        lblEmail.borderStyle = .none
        lblPassword.borderStyle = .none
        lblPasswordCheck.borderStyle = .none

        let border = CALayer()
        border.frame = CGRect(x: 0,
                              y: lblEmail.frame.size.height-1,
                              width: lblEmail.frame.width,
                              height: 1)
        border.backgroundColor = UIColor.lightGray.cgColor
        let border1 = CALayer()
        border1.frame = CGRect(x: 0,
                               y: lblPassword.frame.size.height-1,
                               width: lblPassword.frame.width,
                               height: 1)
        border1.backgroundColor = UIColor.lightGray.cgColor
        let border2 = CALayer()
        border2.frame = CGRect(x: 0,
                               y: lblPasswordCheck.frame.size.height-1,
                               width: lblPasswordCheck.frame.width,
                               height: 1)
        border2.backgroundColor = UIColor.lightGray.cgColor

        lblEmail.layer.addSublayer((border))
        lblPassword.layer.addSublayer((border1))
        lblPasswordCheck.layer.addSublayer((border2))
    
        lblEmail.textAlignment = .center
        lblPassword.textAlignment = .center
        lblPasswordCheck.textAlignment = .center
       
        
        lblEmail.textColor = UIColor.black
        lblPassword.textColor = UIColor.black
        lblPasswordCheck.textColor = UIColor.black

        
    }//===
    


    
/*    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
