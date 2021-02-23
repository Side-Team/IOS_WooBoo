//
//  LoginViewController.swift
//  WooBoo_Project
//
//  Created by ssemm on 2021/02/22.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func btnLogin(_ sender: UIButton) {
        let vcName = self.storyboard?.instantiateViewController(withIdentifier: "MainView")
        vcName?.modalPresentationStyle = .fullScreen
        self.present(vcName!, animated: true, completion: nil)
    }
    
    @IBAction func btnJoin(_ sender: UIButton) {
        self.performSegue(withIdentifier: "MoveJoinUs", sender: self)
    }

}
