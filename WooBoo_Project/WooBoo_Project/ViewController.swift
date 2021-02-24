//
//  ViewController.swift
//  WooBoo_Project
//
//  Created by ssemm on 2021/02/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblHot: UILabel!
    @IBOutlet weak var hotPageControl: UIPageControl!
    
    @IBOutlet weak var lblNew: UILabel!
    @IBOutlet weak var newPageControl: UIPageControl!
    
    var numcount = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hotPageControl.numberOfPages = numcount // 총 페이지 갯수
        hotPageControl.currentPage = 0 // 현재 페이지가 몇번이냐
        hotPageControl.pageIndicatorTintColor = UIColor.green // 인디케이터 평소 색상 지정
        hotPageControl.currentPageIndicatorTintColor = UIColor.red // 인디케이터 선택시 색상
        lblHot.text = String(hotPageControl.currentPage + 1)
        
        newPageControl.numberOfPages = numcount // 총 페이지 갯수
        newPageControl.currentPage = 0 // 현재 페이지가 몇번이냐
        newPageControl.pageIndicatorTintColor = UIColor.green // 인디케이터 평소 색상 지정
        newPageControl.currentPageIndicatorTintColor = UIColor.red // 인디케이터 선택시 색상
        lblNew.text = String(newPageControl.currentPage + 1)
       
    }

   
    @IBAction func changeHotPage(_ sender: UIPageControl) {
        lblHot.text = String(hotPageControl.currentPage + 1)
        lblNew.text = String(newPageControl.currentPage + 1)
    }
    
}

