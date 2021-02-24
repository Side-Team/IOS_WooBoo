//
//  ViewController.swift
//  WooBoo_Project
//
//  Created by ssemm on 2021/02/22.
//

import UIKit

class ViewController: UIViewController, QuestionProtocol {
    
    // 시간
          let interval = 3.0 // 3초
          let timeSelector: Selector = #selector(ViewController.updateTime)
          
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
    var titleNmae = [""]
//          var titleNmae = ["오늘 아침밥", "오늘 점심밥", "오늘 저녁밥", "내일 아침밥", "내일 점심밥", "내일 저녁밥"]
          var titleNmae2 = ["아침 간식", "오늘 점심 간식", "오늘 저녁 간식", "내일 아침 간식", "내일 점심 간식", "내일 저녁 간식"]
    

            
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            // 이미지 이름 저장
            displayTitle(number: numImage)
                    Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
            
            let questionModel = QuestionModel()
            questionModel.delegate = self
            questionModel.downloadItems()
            
        }
    
   
    
    func itemDownloaded(items: NSArray) {
        feedItem = items
        // 불러온 값을 텍스트 필드에 세팅 해준다
       // lblHot.text = String(receiveTitle)
        print("feed = \(feedItem[1])")
        
    }
    
    // 선택한 값 받아와서 넣어주기
    func receiveItems(_ stitle: String){
        receiveTitle = stitle
       print("\(stitle)")
    }
        
        func displayTitle(number : Int)  {
            //let feed = feedItem[IndexPath]
            //lblHot.text = feed as? String
                lblNew.text = titleNmae2[number]
                
           }
           
           // Async Task 3초마다 이미지 변경
           @objc func updateTime(){
             
               if Int(interval) % 3 == 0 {
                   numImage += 1
                   if numImage >= titleNmae2.count{
                   numImage = 0
               }

                displayTitle(number: numImage)

               }
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

