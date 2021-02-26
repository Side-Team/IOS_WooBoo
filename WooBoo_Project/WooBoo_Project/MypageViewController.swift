//
//  MypageViewController.swift
//  WooBoo_Project
//
//  Created by ssemm on 2021/02/26.
//

import UIKit

class MypageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // 로그아웃 버튼 클릭
    @IBAction func btnLogout(_ sender: UIButton) {
        let checkAlert = UIAlertController(title: "로그아웃!", message: "로그아웃 하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil)
        let checkAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {ACTION in
            UserDefaults.standard.removeObject(forKey: "autoId")
            UserDefaults.standard.removeObject(forKey: "autoPw")
            let vcName = self.storyboard?.instantiateViewController(withIdentifier: "LoginView")
            vcName?.modalPresentationStyle = .fullScreen
            self.present(vcName!, animated: true, completion: nil)
            
        })
        checkAlert.addAction(cancelAction)
        checkAlert.addAction(checkAction)
        present(checkAlert, animated: true, completion: nil)
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
