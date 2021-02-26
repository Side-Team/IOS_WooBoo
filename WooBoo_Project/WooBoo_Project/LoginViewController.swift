//
//  LoginViewController.swift
//  WooBoo_Project
//
//  Created by ssemm on 2021/02/22.
//

import UIKit
import KakaoSDKAuth     // 카카오 로그인
import KakaoSDKUser     // 카카오 유저정보
import GoogleSignIn     // 구글 로그인

class LoginViewController: UIViewController, LoginModelProtocol, JspUserSelectProtocol {
    func itemDownloaded(items: NSArray) {
        
    }
    
    // textfield 연결
    @IBOutlet weak var txtID: UITextField!
    @IBOutlet weak var txtPW: UITextField!
    @IBOutlet weak var swOnOff: UISwitch!
    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var signInButton: GIDSignInButton!
    @IBOutlet weak var lblEmail: UILabel!
    
    
    //생성된 Main.storyboard와 연동작업 (변수에 담는 작업)
    let myStoryBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    var loginCheck: Int = 0
    let loginModel = LoginModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginModel.delegate = self
       
        checkSwitchValue()
        checkAutoLogin()
        
        
//        GIDSignIn.sharedInstance()?.presentingViewController = self// 로그인화면 불러오기
//        GIDSignIn.sharedInstance()?.restorePreviousSignIn() // 자동로그인
//        
//        let user = AppDelegate.user
//        
//        print("user: ", user?.profile.name!)
//        
//        self.lblName.text = user?.profile.name
//       
//        self.lblEmail.text = user?.profile.email
        
        
//        print("autoID 값 : \(String(describing: UserDefaults.standard.string(forKey: "autoId")))")
//        print("스위치값 : \(String(describing: UserDefaults.standard.string(forKey: "autoLoginValue")))")
    }
    
    // protocol
    func checkResultValue(result: Int) {
        self.loginCheck = result
        print("checkresultvalue: \(result)")
        if loginCheck == 0 {
            let failAlert = UIAlertController(title: "경고!", message: "정보가 일치하지 않습니다..", preferredStyle: UIAlertController.Style.alert)
            let failAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {ACTION in
                self.navigationController?.popViewController(animated: true)    // 현재화면 지워줌
            })
            failAlert.addAction(failAction)
            present(failAlert, animated: true, completion: nil)
            print("로그인실패:\(self.loginCheck)")
            shakeTextField(textField: txtID)
            shakeTextField(textField: txtPW)
        }else{
 
            let vcName = self.storyboard?.instantiateViewController(withIdentifier: "MainView")
            vcName?.modalPresentationStyle = .fullScreen
            self.present(vcName!, animated: true, completion: nil)

            print("로그인할때스위치값 : \(String(describing: UserDefaults.standard.string(forKey: "autoLoginValue")))")
            Share.userID = txtID.text!
            
            let jspUserSelect = JspUserSelect()
            jspUserSelect.delegate = self
            jspUserSelect.downloadItems()
    
        }
    }
    @IBAction func btnLogout(_ sender: UIButton) {
        GIDSignIn.sharedInstance()?.signOut()
        print("logout")
    }
    
    @IBAction func btnLogin(_ sender: UIButton) {
        // nilcheck를 위함
        let num1Check: Int = checkNil(str: txtID.text!)
        let num2Check: Int = checkNil(str: txtPW.text!)
        
        if num1Check + num2Check != 2{
            let nilAlert = UIAlertController(title: "경고!", message: "정확히 입력하세요.", preferredStyle: UIAlertController.Style.alert)
            let nilAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {ACTION in
                self.navigationController?.popViewController(animated: true)    // 현재화면 지워줌
            })
            nilAlert.addAction(nilAction)
            present(nilAlert, animated: true, completion: nil)
        }else{
            // nil값이 아니고 가입된 회원이 맞으면 이동
            let id = txtID.text
            let pw = txtPW.text
            
            
            // 자동로그인 하기 위해 저장
            if swOnOff.isOn == true{    // 자동로그인 스위치가 켜져있으면
                let autoLogin = UserDefaults.standard       // UserDefaults.standard 정의
                autoLogin.setValue(id, forKey: "autoId")    // autoId 키값에 id 저장
                autoLogin.setValue(pw, forKey: "autoPw")
               // autoLogin.setValue("true", forKey: "autoLoginValue")
                
                print("유저 정보 저장")
            }else{  // 자동로그인 스위치가 꺼져있으면
                let autoLogin = UserDefaults.standard
                autoLogin.setValue("nil", forKey: "autoId")
                autoLogin.setValue("nil", forKey: "autoPw")
              // autoLogin.setValue("false", forKey: "autoLoginValue")
            }
            
            loginModel.LoginItems(email: id!, pw: pw!)
            
            // checkResultValue로 이동하여 로그인 판단.
        }
    }
    
    // 자동로그인 스위치
    @IBAction func swAutoLogin(_ sender: UISwitch) {
        
        checkAutoLogin()

    }
    
    // 비밀번호 찾기 버튼
    @IBAction func btnFindpw(_ sender: UIButton) {
        // 클릭하면 alert띄워서 이메일 받기
        let findAlert = UIAlertController(title: "비밀번호 찾기", message: "이메일을 입력해주세요!", preferredStyle: UIAlertController.Style.alert)
        findAlert.addTextField()
        let findAction = UIAlertAction(title: "인증번호 발송", style: UIAlertAction.Style.default, handler: {ACTION in
            self.navigationController?.popViewController(animated: true)
            // 인증번호 발송 액션
        })
        let findCancel = UIAlertAction(title: "닫기", style: UIAlertAction.Style.default, handler: {ACTION in
            self.navigationController?.popViewController(animated: true)
        })
        findAlert.addAction(findAction)
        findAlert.addAction(findCancel)
        present(findAlert, animated: true, completion: nil)
        // 이메일인증 인증번호 전송
        // 인증번호 확인
        
        
    }
    
    // 회원가입 버튼
    @IBAction func btnJoin(_ sender: UIButton) {
        self.performSegue(withIdentifier: "MoveJoinUs", sender: self)
    }
    
    // 카카오 로그인 버튼
    @IBAction func btnKakao(_ sender: UIButton) {
        
        // 카카오톡 설치 여부 확인
        if (AuthApi.isKakaoTalkLoginAvailable()) {
                   AuthApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                       if let error = error {
                        
                           // 예외 처리 (로그인 취소 등)
                           print(error)
                       }
                       else {
                           print("loginWithKakaoTalk() success.")
                           // do something
                           _ = oauthToken
                           // 어세스토큰
                        let accessToken = oauthToken?.accessToken
                           
                           //카카오 로그인을 통해 사용자 토큰을 발급 받은 후 사용자 관리 API 호출
                        self.setUserInfo()
                        
                        //aController에 이동할 storyBoard의 ID를 지정합니다. (다음화면의 ID)
                        let vcName = self.storyboard?.instantiateViewController(withIdentifier: "MainView")
                        vcName?.modalPresentationStyle = .fullScreen
                        self.present(vcName!, animated: true, completion: nil)
                        //show함수에 생성한 aController 변수를 매개변수로 넘겨줌으로써 클릭이벤트가 발생하면 이동할 storyBaord ID와 매칭되어 화면이 전환됩니다.
//                        self.show(aController, sender: self)
                        
                       }
                   }
               }
    }
    
    // 카카오 웹
    @IBAction func btnKakaoweb(_ sender: UIButton) {
        
        // AuthApi.shared.loginWithKakaoAccount(prompts:[.Login])으로 지정하면 로그인 상태여도 로그인을 물어봄
        AuthApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                   if let error = error {
                       print("error",error)
                   }
                   else {
                       print("loginWithKakaoAccount() success.")
                       
                       //do something
                       _ = oauthToken
                       // 어세스토큰
                       let accessToken = oauthToken?.accessToken
                    
                       //카카오 로그인을 통해 사용자 토큰을 발급 받은 후 사용자 관리 API 호출
                       self.setUserInfo()
                   }
               }
    }
    
    
    // 카카오에서 받아온 정보
    func setUserInfo() {
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                print("me() success.")
                //do something
                _ = user
                print("유저정보", (user?.kakaoAccount?.profile?.nickname)!)
                print("이메일", (user?.kakaoAccount?.email)!)
               // print("성별", (user?.kakaoAccount?.gender)!)

                Share.userID = (user?.kakaoAccount?.email)!
                print("Share",Share.userID)
                self.lblName.text = user?.kakaoAccount?.profile?.nickname


                if let url = user?.kakaoAccount?.profile?.profileImageUrl,
                    let data = try? Data(contentsOf: url) {
                    self.ivImage.image = UIImage(data: data)
                    self.ivImage.layer.cornerRadius = 50
                    self.ivImage.layer.borderWidth = 1
                    self.ivImage.layer.borderColor = UIColor.clear.cgColor
                    self.ivImage.clipsToBounds = true
                    self.ivImage.layer.masksToBounds = true
                }
            }
        }
    }
    
    // 자동로그인
    func checkAutoLogin(){
        
        if swOnOff.isOn == true{
            print("스위치on")
            UserDefaults.standard.setValue("true", forKey: "autoLoginValue")
        }else{
            UserDefaults.standard.setValue("false", forKey: "autoLoginValue")
            print("스위치off")
        }
    }
    
    func checkSwitchValue(){
        print("\(String(describing: UserDefaults.standard.string(forKey: "autoLoginValue")))")
        
        // true이면 switch를 on으로 해야함
        if let switchValue =  UserDefaults.standard.string(forKey: "autoLoginValue"){
            print("check스위치값 : \(switchValue)")
            if switchValue == "true"{
                print("켜짐")
                swOnOff.isOn = true
            }else{
                print("꺼짐")
                swOnOff.isOn = false
            }
        }
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
