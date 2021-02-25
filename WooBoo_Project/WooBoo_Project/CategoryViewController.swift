//
//  CategoryViewController.swift
//  WooBoo_Project
//
//  Created by 이민우 on 2021/02/25.
//

import UIKit

class CategoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnFood(_ sender: UIButton) {
        performSegue(withIdentifier: "MoveList", sender: self)
    }
    
    @IBAction func btnTravel(_ sender: UIButton) {
        performSegue(withIdentifier: "MoveList", sender: self)
    }
    
    @IBAction func btnEtc(_ sender: UIButton) {
        performSegue(withIdentifier: "MoveList", sender: self)
    }
    
    @IBAction func btnLove(_ sender: UIButton) {
        performSegue(withIdentifier: "MoveList", sender: self)
    }
    
    @IBAction func btnMarry(_ sender: Any) {
        performSegue(withIdentifier: "MoveList", sender: self)
    }
    
    @IBAction func btn19(_ sender: UIButton) {
        performSegue(withIdentifier: "MoveList", sender: self)
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
