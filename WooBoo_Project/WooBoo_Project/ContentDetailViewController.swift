//
//  ContentDetailViewController.swift
//  WooBoo_Project
//
//  Created by 이민우 on 2021/02/23.
//

import UIKit

class ContentDetailViewController: UIViewController {
    
    var testNum = 0
    let customColor = UIColor(red: 128/255, green: 194/255, blue: 179/255, alpha: 1)
    
    @IBOutlet weak var txtCategory: UITextField!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var outlet_BtnLike: UIButton!
    @IBOutlet weak var outlet_BtnShare: UIButton!
    @IBOutlet weak var outlet_BtnReport: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDesign()
    }
    
    @IBAction func btnLike(_ sender: UIButton) {
        if testNum == 0{
            print("0번")
            testNum = 1
            outlet_BtnLike.setImage(UIImage(systemName: "heart.fill"), for: .normal)
 
        }else{
            print("1번")
            testNum = 0
            outlet_BtnLike.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        
    }
    
    @IBAction func btnShare(_ sender: UIButton) {
    }
    
    @IBAction func btnReport(_ sender: UIButton) {
    }
    
    func setDesign(){
        outlet_BtnLike.tintColor = customColor
        
        txtCategory.layer.borderWidth = 2
        txtCategory.layer.borderColor = customColor.cgColor
        txtCategory.layer.cornerRadius = 15
        
        txtTitle.layer.borderWidth = 2
        txtTitle.layer.borderColor = customColor.cgColor
        txtTitle.layer.cornerRadius = 15
        
    }
   
}
