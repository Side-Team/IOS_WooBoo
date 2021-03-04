//
//  ViewController.swift
//  WooBoo_Project
//
//  Created by ssemm on 2021/02/22.
//

import UIKit

class ViewController: UIViewController, QuestionProtocol, panHotProtocol {

    
   
    @IBOutlet weak var lblHot: UILabel!
    @IBOutlet weak var hotPageControl: UIPageControl!
    @IBOutlet weak var lblNew: UILabel!
    @IBOutlet weak var newPageControl: UIPageControl!
    
    
    var feedItem: NSArray = NSArray()
    var hotItem: NSArray = NSArray()
    
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
    
    //new
    var titleName: [String] = [""]
    var numNewTitle = 0
    
    // hot
    var hotTitle: [String] = [""]
    var numHotTitle = 0
    var hotSeqno: [String] = [""]

    override func viewDidLoad() {
            super.viewDidLoad()

        // 보람 추가
        
        //핫
        let hotModel = panHot()
        hotModel.delegate = self
        hotModel.downloadItems()
        
        titleHot(number: numHotTitle)
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        
        hotPageControl.numberOfPages = 3
        hotPageControl.currentPage = 0
        
        //실시간글
        let questionModel = QuestionModel()
        questionModel.delegate = self
        questionModel.downloadItems()
        
    
        NewTitle(number: numNewTitle)
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        
        newPageControl.numberOfPages = 3
        newPageControl.currentPage = 0
        
        
            
          
        }
    
   
    func itemDownloaded(items: NSArray) {
        feedItem = items
        loadDataNew()
       
    }
    
    func hotitemDownloaded(items: NSArray) {
        hotItem = items
        loadDataHot()
    }
    

    // 보람 추가
    func loadDataNew(){
    
        titleName.remove(at: 0)
        
        let item: DBModel = feedItem[0] as! DBModel
        titleName.insert(item.stitle!, at: 0)
       
        
        let item2: DBModel = feedItem[1] as! DBModel
        titleName.append(item2.stitle!)
       
        
        let item3: DBModel = feedItem[2] as! DBModel
        titleName.append(item3.stitle!)
        
        
        print(titleName)
        

    }
    
    func loadDataHot(){
    
        hotTitle.remove(at: 0)
        hotSeqno.remove(at: 0)
        
        let item: DBModel = hotItem[0] as! DBModel
        hotTitle.insert(item.hotTitle!, at: 0)
        hotSeqno.insert(item.qSeqno!, at: 0)
        
        let item2: DBModel = hotItem[1] as! DBModel
        hotTitle.append(item2.hotTitle!)
        hotSeqno.append(item2.qSeqno!)
        
        let item3: DBModel = hotItem[2] as! DBModel
        hotTitle.append(item3.hotTitle!)
        hotSeqno.append(item3.qSeqno!)
        
        print(hotTitle)
        print(hotSeqno)

    }
    
    
    func NewTitle(number : Int)  {
        
        lblNew.text = titleName[number]
    }
    
    func titleHot(number : Int)  {
        
        lblHot.text = hotTitle[number]
    }
    
    // Async Task 3초마다 글씨 변경
    @objc func updateTime(){
      
        if Int(interval) % 3 == 0 {

            numNewTitle += 1
            newPageControl.currentPage -= 1

            numHotTitle += 1
            hotPageControl.currentPage -= 1

            if numNewTitle >= titleName.count{
                numNewTitle = 0
                newPageControl.currentPage = 2

                numHotTitle = 0
                hotPageControl.currentPage = 2

        }

            NewTitle(number: numNewTitle)
            titleHot(number: numHotTitle)

        }
    }
            
    @IBAction func hotChange(_ sender: Any) {
        lblHot.text = hotTitle[newPageControl.currentPage]
        //makeSingleTouch()
    }
    
    @IBAction func newChange(_ sender: UIPageControl) {
        lblNew.text = titleName[newPageControl.currentPage]
       // makeSingleTouch()
    }
   
//    // 한 손가락 Gesture 구성
//    func makeSingleTouch(){
//        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_ :)))
//        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
//        self.view.addGestureRecognizer(swipeLeft)
//
//        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_ :)))
//        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
//        self.view.addGestureRecognizer(swipeRight)
//    }
//
//    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer){
//        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
//
//            lblNew.text = titleName[newPageControl.currentPage]
//            lblHot.text = hotTitle[newPageControl.currentPage]
//
//            // 어떤 제스쳐가 들어왔는지 판단
//            switch swipeGesture.direction{
//            case UISwipeGestureRecognizer.Direction.left:
//                newPageControl.currentPage -= 1
//                lblNew.text = titleName[newPageControl.currentPage]
//
//                hotPageControl.currentPage -= 1
//                lblHot.text = hotTitle[newPageControl.currentPage]
//
//            case UISwipeGestureRecognizer.Direction.right:
//                newPageControl.currentPage += 1
//                lblNew.text = titleName[newPageControl.currentPage]
//
//                hotPageControl.currentPage += 1
//                lblHot.text = hotTitle[newPageControl.currentPage]
//
//            default:
//                break
//            }
//        }
//    }
    
}//====

