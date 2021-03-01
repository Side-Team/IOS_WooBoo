//
//  MypageViewController.swift
//  WooBoo_Project
//
//  Created by ssemm on 2021/02/26.
//

import UIKit
import KakaoSDKUser

class MypageViewController: UIViewController {

    
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblwooboo: UILabel!
    @IBOutlet weak var backView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backView.layer.cornerRadius = 25
        imgUser.layer.cornerRadius = 45
        lblwooboo.text = "우부 \(Share.uSeqno)"
        imgUser.image = UIImage(named: Share.uImageFileName)
    }
    
    // 로그아웃 버튼 클릭
    @IBAction func btnLogout(_ sender: UIButton) {
        let checkAlert = UIAlertController(title: "로그아웃!", message: "로그아웃 하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil)
        let checkAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {ACTION in
            UserDefaults.standard.removeObject(forKey: "autoId")
            UserDefaults.standard.removeObject(forKey: "autoPw")
            UserDefaults.standard.removeObject(forKey: "autoLoginValue")
            let vcName = self.storyboard?.instantiateViewController(withIdentifier: "LoginView")
            vcName?.modalPresentationStyle = .fullScreen
            self.present(vcName!, animated: true, completion: nil)
            
        })
        checkAlert.addAction(cancelAction)
        checkAlert.addAction(checkAction)
        present(checkAlert, animated: true, completion: nil)
        
        // 카카오 로그아웃
        
        UserApi.shared.unlink {(error) in
            if let error = error {
                print(error)
            }
            else {
                print("unlink() success.")
            }
        }
        
        UserApi.shared.logout {(error) in
            if let error = error {
                print(error)
            }
            else {
                print("logout() success.")
            }
        }
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
