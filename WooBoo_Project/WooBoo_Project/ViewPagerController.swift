//
//  ViewPagerController.swift
//  WooBoo_Project
//
//  Created by 이민우 on 2021/03/05.
//

import UIKit

class ViewPagerController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var imgView: UIImageView!
    
    // 페이지
    var images = ["image1.jpeg", "image2.jpeg", "img_calmness.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 페이지 설정
        pageControl.currentPage = 0
        pageControl.numberOfPages = images.count
        
        // 초기 이미지 설정
        imgView.image = UIImage(named: images[0])
        
        // 한 손가락 Gesture 구성
        makeSingleTouch()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func btnMoveLogin(_ sender: UIButton) {
        let vcName = self.storyboard?.instantiateViewController(withIdentifier: "LoginView")
        vcName?.modalPresentationStyle = .fullScreen
        self.present(vcName!, animated: true, completion: nil)
    }
    
    @IBAction func pageChange(_ sender: UIPageControl) {
        imgView.image = UIImage(named: images[pageControl.currentPage])
    }
    @IBAction func btnNeverShow(_ sender: UIButton) {
        UserDefaults.standard.set("true", forKey: "neverShow")
        
        let vcName = self.storyboard?.instantiateViewController(withIdentifier: "LoginView")
        vcName?.modalPresentationStyle = .fullScreen
        self.present(vcName!, animated: true, completion: nil)
    }

    
    // selector 설정 (한 손가락)
    @objc func respondToSwipeGesture(_ gesture : UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{

            // 방향값에 따라 이미지 변경
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.left:
                pagePrevious() // 이전 페이지 이동 함수
            case UISwipeGestureRecognizer.Direction.right:
                pageNext() // 다음 페이지 이동 함수
            default:
                break;
            }
        }
    }

    // Gesture 함수
    func makeSingleTouch(){
        
        // left
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_ :)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        // right
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_ :)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    // 이전 페이지 이동 함수
    func pagePrevious(){
        print("pagePrevious : \(pageControl.currentPage)")
        if pageControl.currentPage - 1 < 0{ // 0페이지에서 왼쪽으로 swipe할 경우
            pageControl.currentPage = 2
            imgView.image = UIImage(named: images[pageControl.currentPage])
        }else{
            pageControl.currentPage = pageControl.currentPage - 1
            imgView.image = UIImage(named: images[pageControl.currentPage])
        }
    }
    
    // 다음 페이지 이동 함수
    func pageNext(){
        print("pageNext : \(pageControl.currentPage)")
        if pageControl.currentPage + 1 > 2{ // 2페이지에서 오른쪽으로 swipe할 경우
            pageControl.currentPage = 0
            imgView.image = UIImage(named: images[pageControl.currentPage])
        }else{
            pageControl.currentPage = pageControl.currentPage + 1
            imgView.image = UIImage(named: images[pageControl.currentPage])
        }
    }
}
