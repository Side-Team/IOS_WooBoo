//
//  ViewController.swift
//  WooBoo_Project
//
//  Created by ssemm on 2021/02/22.
//

import UIKit

class ViewController: UIViewController, QuestionProtocol {
    
   

        @IBOutlet weak var lblHot: UILabel!
        @IBOutlet weak var hotPageControl: UIPageControl!
        
        @IBOutlet weak var lblNew: UILabel!
        @IBOutlet weak var newPageControl: UIPageControl!
    
    
    var feedItem: NSArray = NSArray()
//    var numcount = 5
//
//    // 받아올 값을 담아둘 변수 설정
//    var receiveTitle = ""
//
//    // 이미지
//    var  numImage:Int = 0
    
    // 시간
    let interval = 3.0 // 3초
    let timeSelector: Selector = #selector(ViewController.updateTime)
    
    //new----
    var titleName: [String] = [""]
    var numNewTitle = 0
    

        override func viewDidLoad() {
            super.viewDidLoad()

            
            
            // 보람 추가
            
            let questionModel = QuestionModel()
            questionModel.delegate = self
            questionModel.downloadItems()
            
        
            
            NewTitle(number: numNewTitle)
            Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
            
        }
    
   
    func itemDownloaded(items: NSArray) {
        feedItem = items
        loadData()
       
    }

    // 보람 추가
    func loadData(){
    
        let item: DBModel = feedItem[0] as! DBModel
        titleName.append(item.stitle!)
        
        let item2: DBModel = feedItem[1] as! DBModel
        titleName.append(item2.stitle!)
        
        let item3: DBModel = feedItem[2] as! DBModel
        titleName.append(item3.stitle!)
        print(titleName)

    }
    
    func NewTitle(number : Int)  {
        
        lblNew.text = titleName[number]
    }
    
    // Async Task 3초마다 이미지 변경
    @objc func updateTime(){
      
        if Int(interval) % 3 == 0 {
            numNewTitle += 1
            if numNewTitle >= titleName.count{
                numNewTitle = 0
        }

            NewTitle(number: numNewTitle)

        }
    }
    
  // override func viewDidLoad() {
    
    
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

