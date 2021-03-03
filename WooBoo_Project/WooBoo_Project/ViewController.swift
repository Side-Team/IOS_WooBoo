//
//  ViewController.swift
//  WooBoo_Project
//
//  Created by ssemm on 2021/02/22.
//

import UIKit

class ViewController: UIViewController, QuestionProtocol {
    
    func itemDownloaded(items: NSArray) {
       
    }
    
    
    
        @IBOutlet weak var lblHot: UILabel!
        @IBOutlet weak var hotPageControl: UIPageControl!
        
        @IBOutlet weak var lblNew: UILabel!
        @IBOutlet weak var newPageControl: UIPageControl!
    
    
    var feedItem: NSArray = NSArray()
    var numcount = 5
    
    // 받아올 값을 담아둘 변수 설정
    var receiveTitle = ""
    
    // 이미지
    var  numImage:Int = 0
    
    var titleName = ["오늘 아침밥", "오늘 점심밥", "오늘 저녁밥", "내일 아침밥", "내일 점심밥", "내일 저녁밥"]

        override func viewDidLoad() {
            super.viewDidLoad()

            // 세미 테스트중
            print("ShareID : \(Share.userID)")
            print("ShareuSeqno : \(Share.uSeqno)")
            print("ShareusePW : \(Share.userPW)")
            
        }
    
   

        
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        hotPageControl.numberOfPages = numcount // 총 페이지 갯수
//        hotPageControl.currentPage = 0 // 현재 페이지가 몇번이냐
//        hotPageControl.pageIndicatorTintColor = UIColor.green // 인디케이터 평소 색상 지정
//        hotPageControl.currentPageIndicatorTintColor = UIColor.red // 인디케이터 선택시 색상
//        lblHot.text = String(hotPageControl.currentPage + 1)
//
//        newPageControl.numberOfPages = numcount // 총 페이지 갯수
//        newPageControl.currentPage = 0 // 현재 페이지가 몇번이냐
//        newPageControl.pageIndicatorTintColor = UIColor.green // 인디케이터 평소 색상 지정
//        newPageControl.currentPageIndicatorTintColor = UIColor.red // 인디케이터 선택시 색상
//        lblNew.text = String(newPageControl.currentPage + 1)
//
//    }
//    @IBAction func changeHotPage(_ sender: UIPageControl) {
//        lblHot.text = String(hotPageControl.currentPage + 1)
//    }
//
//    @IBAction func changeNewPage(_ sender: UIPageControl) {
//        lblNew.text = String(newPageControl.currentPage + 1)
//    }
    
    
}

