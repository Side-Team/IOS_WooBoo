//
//  LoginViewController.swift
//  WooBoo_Project
//
//  Created by ssemm on 2021/02/22.
//

import UIKit

class LoginViewController: UIViewController, LoginModelProtocol {
    
    // textfield 연결
    @IBOutlet weak var txtID: UITextField!
    @IBOutlet weak var txtPW: UITextField!
    
    var loginCheck: Int = 0
    let loginModel = LoginModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginModel.delegate = self
    }
    
    // protocol
    func checkResultValue(result: Int) {
        self.loginCheck = result
        print("checkresultvalue: \(result)")
        if loginCheck == 0 {
            print("로그인실패:\(self.loginCheck)")
            shakeTextField(textField: txtID)
            shakeTextField(textField: txtPW)
        }else{
            let vcName = self.storyboard?.instantiateViewController(withIdentifier: "MainView")
            vcName?.modalPresentationStyle = .fullScreen
            self.present(vcName!, animated: true, completion: nil)
            
            Share.userID = txtID.text!
        }
    }

    @IBAction func btnLogin(_ sender: UIButton) {
        // nilcheck를 위함
        let num1Check: Int = checkNil(str: txtID.text!)
        let num2Check: Int = checkNil(str: txtPW.text!)
        
        if num1Check + num2Check != 2{
            let nilAlert = UIAlertController(title: "경고!", message: "빈칸을 입력하세요.", preferredStyle: UIAlertController.Style.alert)
            let nilAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {ACTION in
                self.navigationController?.popViewController(animated: true)    // 현재화면 지워줌
            })
            nilAlert.addAction(nilAction)
            present(nilAlert, animated: true, completion: nil)
        }else{
            // nil값이 아니고 가입된 회원이 맞으면 이동
            let id = txtID.text
            let pw = txtPW.text
            loginModel.LoginItems(email: id!, pw: pw!)
            
            // checkResultValue로 이동하여 로그인 판단.
        }
        
    }
    
    @IBAction func btnJoin(_ sender: UIButton) {
        self.performSegue(withIdentifier: "MoveJoinUs", sender: self)
    }
    
    // ID, PW underline
    override func viewDidLayoutSubviews() {
        txtID.borderStyle = .none
        txtPW.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0,
        y: txtID.frame.size.height-1,
        width: txtID.frame.width,
            height: 1)
        border.backgroundColor = UIColor.lightGray.cgColor
        let border1 = CALayer()
        border1.frame = CGRect(x: 0,
        y: txtPW.frame.size.height-1,
        width: txtPW.frame.width,
            height: 1)
        border1.backgroundColor = UIColor.lightGray.cgColor
        txtID.layer.addSublayer((border))
        txtPW.layer.addSublayer((border1))
        txtID.textAlignment = .left
        txtPW.textAlignment = .left
        txtID.textColor = UIColor.black
        txtPW.textColor = UIColor.black
    }
    
    // 아무곳이나 눌러 softkeyboard 지우기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // nil check function
    func checkNil(str: String) -> Int{
        let check = str.trimmingCharacters(in: .whitespacesAndNewlines)
        if check.isEmpty{
            return 0
        }else{
            return 1
        }
    }
    
    // TextField 흔들기 애니메이션
       func shakeTextField(textField: UITextField) -> Void{
           UIView.animate(withDuration: 0.2, animations: {
               textField.frame.origin.x -= 10
           }, completion: { _ in
               UIView.animate(withDuration: 0.2, animations: {
                   textField.frame.origin.x += 20
               }, completion: { _ in
                   UIView.animate(withDuration: 0.2, animations: {
                       textField.frame.origin.x -= 10
                   })
               })
           })
       }

}
