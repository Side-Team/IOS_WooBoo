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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
    }// viewDidLoad
    
    // 가입하기 버튼 클릭
    @IBAction func btnJoinOk(_ sender: UIButton) {
        // nilcheck를 위함
        let num1Check: Int = checkNil(str: txtEmail.text!)
        let num2Check: Int = checkNil(str: txtCode.text!)
        let num3Check: Int = checkNil(str: txtPW.text!)
        let num4Check: Int = checkNil(str: txtPWCheck.text!)
        
        if num1Check + num2Check + num3Check + num4Check != 4 {
            let nilAlert = UIAlertController(title: "경고!", message: "빈칸을 입력하세요.", preferredStyle: UIAlertController.Style.alert)
            let nilAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {ACTION in
                self.navigationController?.popViewController(animated: true)    // 현재화면 지워줌
            })
            nilAlert.addAction(nilAction)
            present(nilAlert, animated: true, completion: nil)
        }else{
            let nilAlert = UIAlertController(title: "완료", message: "가입 되었습니다!", preferredStyle: UIAlertController.Style.alert)
            let nilAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            nilAlert.addAction(nilAction)
            present(nilAlert, animated: true, completion: nil)
        }
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
