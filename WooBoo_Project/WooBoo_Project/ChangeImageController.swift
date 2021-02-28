//
//  ChangeImageController.swift
//  WooBoo_Project
//
//  Created by 김보람 on 2021/02/26.
//

import UIKit


class ChangeImageController: UIViewController {

    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var img5: UIImageView!
    @IBOutlet weak var img6: UIImageView!
    @IBOutlet weak var img7: UIImageView!
    @IBOutlet weak var img8: UIImageView!
    @IBOutlet weak var img9: UIImageView!
    
    
    var clickImageName = "img_calmness.png"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        clickImageOnlyOne(image: img3)
        setGestureRecognizer()
        
    }
    
    
    
    @IBAction func btnSelect(_ sender: UIButton) {
        Share.uImageFileName = clickImageName 
        self.navigationController?.popViewController(animated: true)
    }
    
    
    // 여기서부터 쓰담에서 가져옴..ㅎㅎㅎ

    @objc func imageTapped(sender: UITapGestureRecognizer) {
        tapActions(imageName: "img_Pleasure.png", imageView: img1)
    }
    
    @objc func imageTapped2(sender: UITapGestureRecognizer){
        tapActions(imageName: "img_Proud.png", imageView: img2)
    }
    
    @objc func imageTapped3(sender: UITapGestureRecognizer){
        tapActions(imageName: "img_calmness.png", imageView: img3)
    }
    
    @objc func imageTapped4(sender: UITapGestureRecognizer){
        tapActions(imageName: "img_Happy.png", imageView: img4)
    }
    
    @objc func imageTapped5(sender: UITapGestureRecognizer){
        tapActions(imageName: "img_Anger.png", imageView: img5)
    }
    
    @objc func imageTapped6(sender: UITapGestureRecognizer){
        tapActions(imageName: "img_Embarrassment.png", imageView: img6)
    }
    
    @objc func imageTapped7(sender: UITapGestureRecognizer){
        tapActions(imageName: "img_Sad.png", imageView: img7)
    }
    
    @objc func imageTapped8(sender: UITapGestureRecognizer){
        tapActions(imageName: "img_Tired.png", imageView: img8)
    }
    
    @objc func imageTapped9(sender: UITapGestureRecognizer){
        tapActions(imageName: "img_Depressed.png", imageView: img9)
    }

    
    func setGestureRecognizer(){
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        let tapGR2 = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped2))
        let tapGR3 = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped3))
        let tapGR4 = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped4))
        let tapGR5 = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped5))
        let tapGR6 = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped6))
        let tapGR7 = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped7))
        let tapGR8 = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped8))
        let tapGR9 = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped9))
    
        
        img1.addGestureRecognizer(tapGR)
        img2.addGestureRecognizer(tapGR2)
        img3.addGestureRecognizer(tapGR3)
        img4.addGestureRecognizer(tapGR4)
        img5.addGestureRecognizer(tapGR5)
        img6.addGestureRecognizer(tapGR6)
        img7.addGestureRecognizer(tapGR7)
        img8.addGestureRecognizer(tapGR8)
        img9.addGestureRecognizer(tapGR9)
       
    }
    
    
    func clickImageOnlyOne(image : UIImageView){
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.lightGray.cgColor
        image.layer.cornerRadius = 10
    }

    func resetBorder(){
        img1.layer.borderWidth = 0
        img2.layer.borderWidth = 0
        img3.layer.borderWidth = 0
        img4.layer.borderWidth = 0
        img5.layer.borderWidth = 0
        img6.layer.borderWidth = 0
        img7.layer.borderWidth = 0
        img8.layer.borderWidth = 0
        img9.layer.borderWidth = 0
      
    }
    
    func tapActions(imageName : String, imageView : UIImageView){
        clickImageName = imageName
        resetBorder()
        clickImageOnlyOne(image: imageView)
    }
    
    
        /*    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
