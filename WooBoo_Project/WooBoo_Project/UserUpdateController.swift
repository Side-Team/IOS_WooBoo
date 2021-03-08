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
        lblEmail.text = UserDefaults.standard.string(forKey: "uEmail")
        lblEmail.isEnabled = false
        lblWooboo.text = "우부" + UserDefaults.standard.string(forKey: "uSeqno")!
        design()
        
        setGestureRecognizer()
        
        // API로그인 시 비밀번호 수정 안됨
        if Share.uLogin == "kakao" || Share.uLogin == "google"{
            lblPassword.isEnabled = false
            lblPasswordCheck.isEnabled = false
        }else{
            lblPassword.isEnabled = true
            lblPasswordCheck.isEnabled = true
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        userImg.image = UIImage(named: UserDefaults.standard.string(forKey: "uImageFileName")!)
       
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
        // nilcheck를 위함
        let num1Check: Int = checkNil(str: lblPassword.text!)
        let num2Check: Int = checkNil(str: lblPasswordCheck.text!)
        
        let pw = lblPassword.text
        let pwCheck = lblPasswordCheck.text
        let uImageFileName = UserDefaults.standard.string(forKey: "uImageFileName")!
       
        
        if num1Check + num2Check != 2{
            let nilAlert = UIAlertController(title: "경고!", message: "정확히 입력하세요.", preferredStyle: UIAlertController.Style.alert)
            let nilAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            nilAlert.addAction(nilAction)
            present(nilAlert, animated: true, completion: nil)
        }else{
            // nill 완료
            // 패스워드 정규식 안맞을때
            if !isValidPassword(pwd: pw!){
                print("정규식 실패")
                let nilAlert = UIAlertController(title: "경고!", message: "비밀번호 형식을 확인해주세요!", preferredStyle: UIAlertController.Style.alert)
                let nilAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                nilAlert.addAction(nilAction)
                present(nilAlert, animated: true, completion: nil)
                print("비밀번호 실패")
            }else{  // 정규식까지 완료
                print("정규식까지 완료")
                // 비밀번호와 비밀번호확인 필드 값 확인
                if pw != pwCheck{   // 서로 다르면
                    print("비밀번호와 비밀번호체크 값이 다름")
                    let nilAlert = UIAlertController(title: "경고!", message: "비밀번호가 일치하지 않습니다", preferredStyle: UIAlertController.Style.alert)
                    let nilAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                    nilAlert.addAction(nilAction)
                    present(nilAlert, animated: true, completion: nil)
                }else{
                    print("비밀번호필드 일치")
                    let userUpdate = userUpdateModel()
                    let result = userUpdate.insertItems(pw: pw!, uImageFileName: uImageFileName)
                    if result == true{
                        let resultAlert = UIAlertController(title: "완료", message: "수정이 완료 되었습니다", preferredStyle: UIAlertController.Style.alert)
                        let onAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {ACTION in
                            self.navigationController?.popViewController(animated: true)
                        })
                        resultAlert.addAction(onAction)
                        present(resultAlert, animated: true, completion: nil)
                        
                    }else{ // 에러일 경우
                        let resultAlert = UIAlertController(title: "실패", message: "에러가 발생 되었습니다.", preferredStyle: UIAlertController.Style.alert)
                        let onAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                        resultAlert.addAction(onAction)
                        present(resultAlert, animated: true, completion: nil)
                    }
//                    let nilAlert = UIAlertController(title: "완료", message: "변경이 완료되었습니다!", preferredStyle: UIAlertController.Style.alert)
//                    let nilAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {ACTION in
//                        self.navigationController?.popViewController(animated: true)
//                    })
//                    nilAlert.addAction(nilAction)
//                    present(nilAlert, animated: true, completion: nil)
                    
                }
            }
        }
    }//====
    
    
    


    
    
    // 이미지 변경
    func setGestureRecognizer(){
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        userImg.isUserInteractionEnabled = true
        userImg.addGestureRecognizer(tapGR)
    }
    
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "moveChangeImage", sender: self)
    }
    
    
    // 비밀번호 변경
    
    // 비밀번호 형식 검사(소문자, 대문자, 숫자 8자리 이상)
    func isValidPassword(pwd: String) -> Bool {
        let passwordRegEx = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: pwd)
    }
//
//    func CheckPw(){
//        let pw = lblPassword.text
//        let pwCheck = lblPasswordCheck.text
//
//
//        if !isValidPassword(pwd: pw!){
//            let nilAlert = UIAlertController(title: "경고!", message: "비밀번호 형식을 확인해주세요!", preferredStyle: UIAlertController.Style.alert)
//            let nilAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
//            nilAlert.addAction(nilAction)
//            present(nilAlert, animated: true, completion: nil)
//            print("비밀번호 실패")
//
//        }else{  // 정규식까지 완료
//            print("정규식까지 완료")
//            // 비밀번호와 비밀번호확인 필드 값 확인
//            if pw != pwCheck{   // 서로 다르며
//                print("비밀번호와 비밀번호체크 값이 다름")
//                let nilAlert = UIAlertController(title: "경고!", message: "비밀번호가 일치하지 않습니다", preferredStyle: UIAlertController.Style.alert)
//                let nilAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
//                nilAlert.addAction(nilAction)
//                present(nilAlert, animated: true, completion: nil)
//            }else if pw == "" && pwCheck == ""{
//                let nilAlert = UIAlertController(title: "경고!", message: "빈칸없이 입력해주세요", preferredStyle: UIAlertController.Style.alert)
//                let nilAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
//                nilAlert.addAction(nilAction)
//                present(nilAlert, animated: true, completion: nil)
//
//            }else{
//                print("비밀번호필드 일치")
//
//        // 비밀번호와 비밀번호확인 필드 값 확인
//        if pw != pwCheck{   // 서로 다르며
//            print("비밀번호와 비밀번호체크 값이 다름")
//            let nilAlert = UIAlertController(title: "경고!", message: "비밀번호가 일치하지 않습니다", preferredStyle: UIAlertController.Style.alert)
//            let nilAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
//            nilAlert.addAction(nilAction)
//            present(nilAlert, animated: true, completion: nil)
//
//        }else if pw == "" && pwCheck == ""{
//            let nilAlert = UIAlertController(title: "경고!", message: "빈칸없이 입력해주세요", preferredStyle: UIAlertController.Style.alert)
//            let nilAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
//            nilAlert.addAction(nilAction)
//            present(nilAlert, animated: true, completion: nil)
//
//
//        }else{
//            print("비밀번호필드 일치")
//
//                let nilAlert = UIAlertController(title: "완료", message: "변경이 완료되었습니다!", preferredStyle: UIAlertController.Style.alert)
//                let nilAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {ACTION in
//                    self.navigationController?.popViewController(animated: true)
//                })
//                nilAlert.addAction(nilAction)
//                present(nilAlert, animated: true, completion: nil)
//
//            }
//        }
//
//    }
    
    // nil check function
    func checkNil(str: String) -> Int{
        let check = str.trimmingCharacters(in: .whitespacesAndNewlines)
        if check.isEmpty{
            return 0
        }else{
            return 1
        }
    }
    
    
    
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
        lblPassword.textAlignment = .left
        lblPasswordCheck.textAlignment = .left
        
        
        lblEmail.textColor = UIColor.black
        lblPassword.textColor = UIColor.black
        lblPasswordCheck.textColor = UIColor.black
        
        
    }//===
    
    // 아무곳이나 눌러 softkeyboard 지우기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    /*    // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    }
