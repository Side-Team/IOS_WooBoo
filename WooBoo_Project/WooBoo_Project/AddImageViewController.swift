//
//  ImageAddViewController.swift
//  WooBoo_Project
//
//  Created by 이민우 on 2021/02/24.
//

import UIKit

// EditViewController에서 ViewController의 함수를 실행해서 데이터 전달하는 것
protocol AddImageDelegate { // Java의 Interface
    func didSelectedImage(_ controller : AddImageViewController, imageFileNames : [String])
}

class AddImageViewController: UIViewController {

    var delegate : AddImageDelegate? // 위에서 선언한 EditDelegate를 사용
    var count = 0
    var imageFileNames = [String]()
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setGestureRecognizer()
        setDesign()
        
    }

    @IBAction func btnSave(_ sender: UIBarButtonItem) {
        if delegate != nil{
            delegate?.didSelectedImage(self, imageFileNames: imageFileNames)
        }
        navigationController?.popViewController(animated: true) // 가장 마지막에 뜬 화면을 사라지게 하기
    }
    @IBAction func btnClear(_ sender: UIBarButtonItem) {
        imageFileNames.removeAll()
        image1.image = UIImage(systemName: "photo")
        image2.image = UIImage(systemName: "photo")
        image3.image = UIImage(systemName: "photo")
        image4.image = UIImage(systemName: "photo")
        image5.image = UIImage(systemName: "photo")
    }
    
    // Set GestureRecognizer each buttons
    func setGestureRecognizer(){
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        let tapGR2 = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped2))
        let tapGR3 = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped3))
        let tapGR4 = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped4))
        let tapGR5 = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped5))

        
        image1.addGestureRecognizer(tapGR)
        image2.addGestureRecognizer(tapGR2)
        image3.addGestureRecognizer(tapGR3)
        image4.addGestureRecognizer(tapGR4)
        image5.addGestureRecognizer(tapGR5)
  
    }
    
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        print("1")
        image1.image = UIImage(systemName: "heart")
        imageFileNames.append("image1")
    }
    
    @objc func imageTapped2(sender: UITapGestureRecognizer){
        print("2")
        image2.image = UIImage(systemName: "heart")
        imageFileNames.append("image2")
    }
    
    @objc func imageTapped3(sender: UITapGestureRecognizer){
        print("3")
        image3.image = UIImage(systemName: "heart")
        imageFileNames.append("image3")

    }
    
    @objc func imageTapped4(sender: UITapGestureRecognizer){
        print("4")
        image4.image = UIImage(systemName: "heart")
        imageFileNames.append("image4")
    }
    
    @objc func imageTapped5(sender: UITapGestureRecognizer){
        print("5")
        image5.image = UIImage(systemName: "heart")
        imageFileNames.append("image5")
    }
    
    // A collection of functions
    func tapAction(imageName : String, imageView : UIImageView){
     
    }
    
    func setDesign(){
        image3.isHidden = true
        image4.isHidden = true
        image5.isHidden = true
      
        if count == 3{
            image3.isHidden = false
        }
        
        if count == 4{
            image4.isHidden = false
            image5.isHidden = false
        }
        
        if count == 5{
            image3.isHidden = false
            image4.isHidden = false
            image5.isHidden = false

        }
    }
}
