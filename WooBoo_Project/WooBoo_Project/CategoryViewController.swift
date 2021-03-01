//
//  CategoryViewController.swift
//  WooBoo_Project
//
//  Created by 이민우 on 2021/02/25.
//

import UIKit

class CategoryViewController: UIViewController {
    
    var feedItem: NSArray = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
  
    @IBAction func btnFood(_ sender: UIButton) {
        performSegue(withIdentifier: "MoveList", sender: self)
        
        categoryvalue = "1"
        //categoryModel.categoryItems(category: "1") // CategoryModel로 보내주는 곳
    }
    
    @IBAction func btnTravel(_ sender: UIButton) {
        performSegue(withIdentifier: "MoveList", sender: self)
        categoryvalue = "2"
    }
    
    @IBAction func btnEtc(_ sender: UIButton) {
        performSegue(withIdentifier: "MoveList", sender: self)
        categoryvalue = "3"
    }
    
    @IBAction func btnLove(_ sender: UIButton) {
        performSegue(withIdentifier: "MoveList", sender: self)
        categoryvalue = "4"
    }
    
    @IBAction func btnMarry(_ sender: Any) {
        performSegue(withIdentifier: "MoveList", sender: self)
        categoryvalue = "5"
    }
    
    @IBAction func btn19(_ sender: UIButton) {
        performSegue(withIdentifier: "MoveList", sender: self)
        categoryvalue = "6"
    }
    
//    // 다음 페이지로 값 보내주는 작업
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//    }
    

}
