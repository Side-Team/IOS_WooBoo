//
//  JoinViewController.swift
//  WooBoo_Project
//
//  Created by ssemm on 2021/02/23.
//

import UIKit

class JoinViewController: UIViewController {
    
    // textfield 연결
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtCode: UITextField!
    @IBOutlet weak var txtPW: UITextField!
    @IBOutlet weak var txtPWCheck: UITextField!
    @IBOutlet weak var lblpwCheck: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let pwCheck = txtPWCheck.text!
//        let txtpw = txtPW.text!
//        
//        if txtpw != pwCheck{
//            lblpwCheck.text! = "비밀번호가 일치하지 않습니다."
//        }else{
//            lblpwCheck.text! = "비밀번호가 일치합니다."
//        }
        
    }//------------viewDidLoad
    
    // 가입하기 버튼 클릭
    @IBAction func btnJoinOk(_ sender: UIButton) {
        // nilcheck를 위함
        let num1Check: Int = checkNil(str: txtEmail.text!)
        let num2Check: Int = checkNil(str: txtCode.text!)
        let num3Check: Int = checkNil(str: txtPW.text!)
        let num4Check: Int = checkNil(str: txtPWCheck.text!)
        
        if num1Check + num2Check + num3Check + num4Check != 4 {
            let nilAlert = UIAlertController(title: "경고!", message: "정확히 입력하세요.", preferredStyle: UIAlertController.Style.alert)
            let nilAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            nilAlert.addAction(nilAction)
            present(nilAlert, animated: true, completion: nil)
        }else{
            // nil이 아닐 경우
            let email = txtEmail.text!
            let pw = txtPW.text!
            
            // 정규식 검사
            if !isValidPassword(pwd: pw) && !isValidEmail(testStr: email){
                let nilAlert = UIAlertController(title: "경고!", message: "이메일과 비밀번호를 확인해주세요!", preferredStyle: UIAlertController.Style.alert)
                let nilAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                nilAlert.addAction(nilAction)
                present(nilAlert, animated: true, completion: nil)
                print("비밀번호 또는 이메일 실패")
            }else{
            
                let joinModel = JoinModel()
                let result = joinModel.joinItems(email: email, pw: pw)
                
                if result == true{
                    let nilAlert = UIAlertController(title: "완료", message: "가입 되었습니다!", preferredStyle: UIAlertController.Style.alert)
                    let nilAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {ACTION in
                        self.dismiss(animated: true, completion: nil)
                    })
                    nilAlert.addAction(nilAction)
                    present(nilAlert, animated: true, completion: nil)
                }else{
                    let resultAlert = UIAlertController(title: "실패", message: "에러가 발생 되었습니다.", preferredStyle: UIAlertController.Style.alert)
                    let onAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                    resultAlert.addAction(onAction)
                    present(resultAlert, animated: true, completion: nil)
                }
            }
        }
    }
    
    // 이메일 형식 검사(@ 앞에 알파벳, 숫자, 특수문자가 포함될 수 있고 @ 뒤에는 알파벳, 숫자, .뒤에는 알파벳 2자리 이상)
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    // 비밀번호 형식 검사(소문자, 대문자, 숫자 8자리 이상)
    func isValidPassword(pwd: String) -> Bool {
        let passwordRegEx = "^[a-zA-Z0-9]{8,}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: pwd)
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
    
    // textfield underline
    override func viewDidLayoutSubviews() {
        txtEmail.borderStyle = .none
        txtCode.borderStyle = .none
        txtPW.borderStyle = .none
        txtPWCheck.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0,
                              y: txtEmail.frame.size.height-1,
                              width: txtEmail.frame.width,
                              height: 1)
        border.backgroundColor = UIColor.lightGray.cgColor
        let border1 = CALayer()
        border1.frame = CGRect(x: 0,
                               y: txtCode.frame.size.height-1,
                               width: txtCode.frame.width,
                               height: 1)
        border1.backgroundColor = UIColor.lightGray.cgColor
        let border2 = CALayer()
        border2.frame = CGRect(x: 0,
                               y: txtPW.frame.size.height-1,
                               width: txtPW.frame.width,
                               height: 1)
        border2.backgroundColor = UIColor.lightGray.cgColor
        let border3 = CALayer()
        border3.frame = CGRect(x: 0,
                               y: txtPWCheck.frame.size.height-1,
                               width: txtPWCheck.frame.width,
                               height: 1)
        border3.backgroundColor = UIColor.lightGray.cgColor
        txtEmail.layer.addSublayer((border))
        txtCode.layer.addSublayer((border1))
        txtPW.layer.addSublayer((border2))
        txtPWCheck.layer.addSublayer((border3))
        txtEmail.textAlignment = .center
        txtCode.textAlignment = .center
        txtPW.textAlignment = .center
        txtPWCheck.textAlignment = .center
        txtEmail.textColor = UIColor.black
        txtCode.textColor = UIColor.black
        txtPW.textColor = UIColor.black
        txtPWCheck.textColor = UIColor.black
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
