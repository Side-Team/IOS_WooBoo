//
//  ViewController.swift
//  WooBoo_Project
//
//  Created by ssemm on 2021/02/22.
//

import UIKit

class ViewController: UIViewController, QuestionProtocol, panHotProtocol {

    
   
    
    @IBOutlet weak var lblHot: UIButton!
    @IBOutlet weak var hotPageControl: UIPageControl!
    @IBOutlet weak var lblNew: UIButton!
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
    var titleName = [""]
    var numNewTitle = 0
    var newSeqno: [String] = [""]
    
    // hot
    var hotTitle = [""]
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
        newSeqno.remove(at: 0)

        let item: DBModel = feedItem[0] as! DBModel
        titleName.insert(item.stitle!, at: 0)
        newSeqno.insert(item.nSeqno!, at: 0)


        let item2: DBModel = feedItem[1] as! DBModel
        titleName.append(item2.stitle!)
        newSeqno.append(item2.nSeqno!)


        let item3: DBModel = feedItem[2] as! DBModel
        titleName.append(item3.stitle!)
        newSeqno.append(item3.nSeqno!)


        print(titleName)
        print(newSeqno)


    }
    
    func loadDataHot(){
    
        hotTitle.remove(at: 0)
        hotSeqno.remove(at: 0)
        
        let item: DBModel = hotItem[0] as! DBModel
        hotTitle.append(item.hotTitle!)
        hotSeqno.append(item.qSeqno!)
        
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
        
        lblNew.setTitle(titleName[number], for: UIControl.State.normal)
    }
    
    func titleHot(number : Int)  {
        
        lblHot.setTitle(hotTitle[number], for: UIControl.State.normal)
    }
    
    // Async Task 3초마다 글씨 변경
    @objc func updateTime(){
      
        if Int(interval) % 3 == 0 {

            numNewTitle += 1
           newPageControl.currentPage += 1

            numHotTitle += 1
            hotPageControl.currentPage += 1

            if numNewTitle >= titleName.count{
                numNewTitle = 0
                newPageControl.currentPage = 0

                numHotTitle = 0
                hotPageControl.currentPage = 0

        }

            NewTitle(number: numNewTitle)
            titleHot(number: numHotTitle)
            
        

        }
    }
    
    // hot글로 이동
    @IBAction func moveHot(_ sender: UIButton) {
        //ContentDetailViewController
        let vcName = self.storyboard?.instantiateViewController(withIdentifier: "ContentDetailViewController")
                    vcName?.modalPresentationStyle = .fullScreen
                    self.present(vcName!, animated: true, completion: nil)
    }
    
    @IBAction func moveNew(_ sender: UIButton) {
    }
    
    
    
            
    @IBAction func hotChange(_ sender: Any) {
        lblHot.setTitle(hotTitle[hotPageControl.currentPage], for: UIControl.State.normal)
        makeSingleTouch()
        
    }
    
    @IBAction func newChange(_ sender: UIPageControl) {
        lblNew.setTitle(titleName[newPageControl.currentPage], for: UIControl.State.normal)
        makeSingleTouch()
    }
    
   
    // 한 손가락 Gesture 구성
    func makeSingleTouch(){
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_ :)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)

        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_ :)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
    }

    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{

            lblNew.setTitle(titleName[newPageControl.currentPage], for: UIControl.State.normal)
            lblHot.setTitle(hotTitle[hotPageControl.currentPage], for: UIControl.State.normal)

            // 어떤 제스쳐가 들어왔는지 판단
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.left:
                newPageControl.currentPage -= 1
                lblNew.setTitle(titleName[newPageControl.currentPage], for: UIControl.State.normal)
                hotPageControl.currentPage -= 1
                lblNew.setTitle(titleName[newPageControl.currentPage], for: UIControl.State.normal)

            case UISwipeGestureRecognizer.Direction.right:
                newPageControl.currentPage += 1
                lblNew.setTitle(titleName[newPageControl.currentPage], for: UIControl.State.normal)
                hotPageControl.currentPage += 1
                lblNew.setTitle(titleName[newPageControl.currentPage], for: UIControl.State.normal)
            default:
                break
            }
        }
    }
    
}//====

