//
//  ContentDetailViewController.swift
//  WooBoo_Project
//
//  Created by 이민우 on 2021/02/23.
//

import UIKit
import KakaoSDKTalk
import KakaoSDKAuth
import KakaoSDKLink
import KakaoSDKTemplate
import KakaoSDKCommon
import MessageUI

class ContentDetailViewController: UIViewController, return_sqSelection,  Get_resgister_count, Get_select_question_countSelector, Get_like_count, Get_report_count {
    
    // ------------------프로토콜-------------------
    func return_report_count(count: Int) {
        report_SwitchNum = count
        if count == 1{
            outlet_BtnReport.setImage(UIImage(systemName: "exclamationmark.triangle.fill"), for: .normal)
        }

    }
    
    func return_like_count(count: Int) {
        like_SwitchNum = count
        
        if like_SwitchNum == 1{
            outlet_BtnLike.setImage(UIImage(systemName: "heart.fill"), for: .normal)

        }else{
            outlet_BtnLike.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        
        print("return_like_count 값 : ", like_SwitchNum)

    }
    
    func return_select_question_countSelector(countSelector: Int, cnts: [Int]) {
        print("countSelector : \(countSelector)")
        
        self.countSelector = countSelector
        self.cnts = cnts
        
        selectedButton()
        
        
        
        
        print("cnts : \(cnts)")
        
        if countSelector == 0{
            lblTotalSelector.text = "아직 참여한 우부가 없습니다.."

            outlet_btn1.setTitle("\(receiveqSelection1) (0명/0%)", for: .normal)
            outlet_btn2.setTitle("\(receiveqSelection2) (0명/0%)", for: .normal)
            outlet_btn3.setTitle("\(receiveqSelection3) (0명/0%)", for: .normal)
            outlet_btn4.setTitle("\(receiveqSelection4) (0명/0%)", for: .normal)
            outlet_btn5.setTitle("\(receiveqSelection5) (0명/0%)", for: .normal)
            
           
        }else{
            lblTotalSelector.text = "총 \(countSelector)명이 참여했습니다"

            outlet_btn1.setTitle("\(receiveqSelection1) (\(cnts[0])명/\(String(format: "%.f", ((Double(cnts[0]))/Double(countSelector)) * 100))%)", for: .normal)
            outlet_btn2.setTitle("\(receiveqSelection2) (\(cnts[1])명/\(String(format: "%.f", ((Double(cnts[1]))/Double(countSelector)) * 100))%)", for: .normal)
            outlet_btn3.setTitle("\(receiveqSelection3) (\(cnts[2])명/\(String(format: "%.f", ((Double(cnts[2]))/Double(countSelector)) * 100))%)", for: .normal)
            outlet_btn4.setTitle("\(receiveqSelection4) (\(cnts[3])명/\(String(format: "%.f", ((Double(cnts[3]))/Double(countSelector)) * 100))%)", for: .normal)
            outlet_btn5.setTitle("\(receiveqSelection5) (\(cnts[4])명/\(String(format: "%.f", ((Double(cnts[4]))/Double(countSelector)) * 100))%)", for: .normal)
            
        }
        
        if receiveqSelection3 != "X"{
            outlet_btn3.isHidden = false

        }
        
        if receiveqSelection4 != "X"{
            outlet_btn4.isHidden = false
  
        }
        
        if receiveqSelection5 != "X"{
            outlet_btn5.isHidden = false
          
        }
   
        findMaxIndex()
        setFocus()

    }
    
    func return_register_count(count: Int, views: Int) {
        print("직전 조회수 : \(views)")
        if count == 0{
            let updateModel = LMW_UpdateModel()
            // questions_qSeqno에 받은 값 넣어주기
            updateModel.update_rViews(questions_qSeqno: Int(receiveqSeqno)!, views: views + 1)
            
            lblViews.text = "조회수 \(String(views + 1))"
            
//            let selectModel = LMW_SelectModel()
//            selectModel.downloadItems(funcName: "get_register_views", urlPath: "http://127.0.0.1:8080/ios_jsp/wooboo_Select_views.jsp?questions_qSeqno=20")
        }else{
//            let selectModel = LMW_SelectModel()
//            selectModel.downloadItems(funcName: "get_register_views", urlPath: "http://127.0.0.1:8080/ios_jsp/wooboo_Select_views.jsp?questions_qSeqno=20")
            
            lblViews.text = "조회수 \(String(views))"
        }
    }
    
    func itemDownloaded(sqSelection: Int) {
        print("itemDownloaded")

        self.sqSelection = sqSelection
        self.setDesign()
        print("sqSelection : \(sqSelection)")
    }
    
    // ------------------------------------------
    
    // --------------- 02.28 민규 / 테이블에서 받아온 값 -----------------
    // 받아올 값을 담아둘 변수 설정
    var receiveqSeqno = ""
    var receiveuser_qSeqno = ""
    var receiveqTitle = ""
    var receiveqSelection1 = ""
    var receiveqSelection2 = ""
    var receiveqSelection3 = ""
    var receiveqSelection4 = ""
    var receiveqSelection5 = ""
    var receiveqCategory = ""
    var receiveqInsertDate = ""
    var receiveqDeleteDate = ""
    var receiveqImageFileName1 = ""
    var receiveqImageFileName2 = ""
    var receiveqImageFileName3 = ""
    var receiveqImageFileName4 = ""
    var receiveqImageFileName5 = ""
    
    
    // -------------------------------------------------

    // ------------------변수 및 outlet-------------------
    var sqSelection = 0
    var like_SwitchNum = -1
    var report_SwitchNum = -1
    var countSelector = 0
    var cnts = [Int]()
    
    
    let customColor = UIColor(red: 128/255, green: 194/255, blue: 179/255, alpha: 1)
    
        
    @IBOutlet weak var lblTotalSelector: UILabel!
    @IBOutlet weak var lblViews: UILabel!
    @IBOutlet weak var txtCategory: UITextField!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var outlet_BtnLike: UIButton!
    @IBOutlet weak var outlet_BtnShare: UIButton!
    @IBOutlet weak var outlet_BtnReport: UIButton!
    
    @IBOutlet weak var outlet_btn1: UIButton!
    @IBOutlet weak var outlet_btn2: UIButton!
    @IBOutlet weak var outlet_btn3: UIButton!
    @IBOutlet weak var outlet_btn4: UIButton!
    @IBOutlet weak var outlet_btn5: UIButton!
    
    // ------------------------------------------

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoadsdasdasd")

//        view.addSubview(outlet_BtnShare)
//        outlet_BtnShare.addTarget(self, action: #selector(didTapSendButton(_:)), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        print("1")
        let selectModel = LMW_Select_sqSelection()
        selectModel.delegate = self
        selectModel.downloadItems(questions_qSeqno: Int(receiveqSeqno)!)
        print("2")

        let selectModel2 = LMW_SelectModel()
        selectModel2.delegate3 = self
        selectModel2.delegate4 = self
        selectModel2.delegate5 = self
        selectModel2.delegate6 = self

        selectModel2.downloadItems(funcName: "check_register", urlPath: "http://127.0.0.1:8080/ios_jsp/wooboo_Select_register.jsp?questions_qSeqno=\(receiveqSeqno)&user_uSeqno=\(Share.uSeqno)")
        selectModel2.downloadItems(funcName: "get_countSelector", urlPath: "http://127.0.0.1:8080/ios_jsp/wooboo_Select_countSelector.jsp?questions_qSeqno=\(receiveqSeqno)")
        selectModel2.downloadItems(funcName: "check_like", urlPath: "http://127.0.0.1:8080/ios_jsp/wooboo_Select_like.jsp?questions_qSeqno=\(receiveqSeqno)&user_uSeqno=\(Share.uSeqno)")
        selectModel2.downloadItems(funcName: "check_report", urlPath: "http://127.0.0.1:8080/ios_jsp/wooboo_Select_report.jsp?questions_qSeqno=\(receiveqSeqno)&user_uSeqno=\(Share.uSeqno)")
        
    }
    
    // --------------- 02.28 민규 / 선택한 값 받아주기 -----------------
    func receiveItems(_ qSeqno: String, _ user_qSeqno: String, _ qTitle: String, _ qSelection1: String,  _ qSelection2: String,  _ qSelection3: String,  _ qSelection4: String,  _ qSelection5: String, _ qCategory: String, _ qInsertDate: String, _ qDeleteDate: String, _ qImageFileName1: String,  _ qImageFileName2: String,  _ qImageFileName3: String,  _ qImageFileName4: String,  _ qImageFileName5: String){
        receiveqSeqno = qSeqno
        receiveuser_qSeqno = user_qSeqno
        receiveqTitle = qTitle
        receiveqSelection1 = qSelection1
        receiveqSelection2 = qSelection2
        receiveqSelection3 = qSelection3
        receiveqSelection4 = qSelection4
        receiveqSelection5 = qSelection5
        receiveqCategory = qCategory
        receiveqInsertDate = qInsertDate
        receiveqDeleteDate = qDeleteDate
        receiveqImageFileName1 = qImageFileName1
        receiveqImageFileName2 = qImageFileName2
        receiveqImageFileName3 = qImageFileName3
        receiveqImageFileName4 = qImageFileName4
        receiveqImageFileName5 = qImageFileName5
   
        print("넘어온 값 확인하기 : \(receiveqSeqno)")
        print("넘어온 값 확인하기 : \(receiveuser_qSeqno)")
        print("넘어온 값 확인하기 : \(receiveqTitle)")
        print("넘어온 값 확인하기 : \(receiveqSelection1)")
        print("넘어온 값 확인하기 : \(receiveqSelection2)")
        print("넘어온 값 확인하기 : \(receiveqSelection3)")
        print("넘어온 값 확인하기 : \(receiveqSelection4)")
        print("넘어온 값 확인하기 : \(receiveqSelection5)")
        print("넘어온 값 확인하기 : \(receiveqCategory)")
        print("넘어온 값 확인하기 : \(qInsertDate)")
        print("넘어온 값 확인하기 : \(qDeleteDate)")
        print("넘어온 값 확인하기 : \(qImageFileName1)")
        print("넘어온 값 확인하기 : \(qImageFileName2)")
        print("넘어온 값 확인하기 : \(qImageFileName3)")
        print("넘어온 값 확인하기 : \(qImageFileName4)")
        print("넘어온 값 확인하기 : \(qImageFileName5)")
     
    }
    
    
    // ------------------Actions-------------------
    @IBAction func btnLike(_ sender: UIButton) {

        print("btnLike 값 : ", like_SwitchNum)
        if like_SwitchNum == 0{
            let insertModel = LMW_InsertModel()
            let result = insertModel.insert_like(questions_qSeqno: Int(receiveqSeqno)!) // questions_qSeqno 넣어주기
            
            if result == true{
                print("like \(result)")
            }else{
                print("like \(result)")
            }
            
            print("0번")
            
            
            like_SwitchNum = 1
            outlet_BtnLike.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            
 
        }else{
            let deleteModel = LMW_DeleteModel()
            let result = deleteModel.delete_like(questions_qSeqno: Int(receiveqSeqno)!) // questions_qSeqno 넣어주기
            
            if result == true{
                print("like 삭제 \(result)")
            }else{
                print("like 삭제 \(result)")
            }
            
            print("1번")
            like_SwitchNum = 0
            outlet_BtnLike.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        
    }
    
    @IBAction func btnShare(_ sender: UIButton) {
//        kakaoTalkMessage()
//        guard MFMessageComposeViewController.canSendText() else{
//            print("SMS services are not avaliable")
//            return
//
//        }
//        let composeViewController = MFMessageComposeViewController()
//        composeViewController.messageComposeDelegate = self
//        composeViewController.recipients = ["123456789"]
//        composeViewController.body = """
//test
//test
//test
//test
//test
//"""
//        present(composeViewController, animated: true, completion: nil)
        
        share()
        
        
    }
    
    @IBAction func btnReport(_ sender: UIButton) {
        
        if report_SwitchNum == 0{
            
            let alert = UIAlertController(title: "신고", message: "허위 신고 시 제재를 받을 수 있습니다", preferredStyle: UIAlertController.Style.alert)
            alert.addTextField { [self] (myTextField) in
            myTextField.textColor = customColor
            myTextField.placeholder = "신고사유를 적어주세요."
            }
            
            let sendAction = UIAlertAction(title: "전송", style: UIAlertAction.Style.destructive, handler: { [self]ACTION in
                let insertModel = LMW_InsertModel()
                insertModel.insert_report(questions_qSeqno: Int(receiveqSeqno)!, content: alert.textFields![0].text!)
                print("신고사유 : \(alert.textFields![0].text!)")
                
                let addAlert = UIAlertController(title: "신고 완료", message: "정상적으로 신고되었습니다.", preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: {ACTION in
                    outlet_BtnReport.setImage(UIImage(systemName: "exclamationmark.triangle.fill"), for: .normal)
                })
                
                addAlert.addAction(okAction)
                

                present(addAlert, animated: true, completion: nil)
                
                report_SwitchNum = 1
            })
            
            let cancelAction = UIAlertAction(title: "취소", style: UIAlertAction.Style.default, handler: nil)
            
            alert.addAction(sendAction)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: "신고 완료", message: "이미 신고한 글입니다.", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
            
            alert.addAction(okAction)
            

            present(alert, animated: true, completion: nil)
        }
        

    }
    
    @IBAction func btn1(_ sender: UIButton) {
        clickButtonAction(clickNum: 1)
    }
    
    @IBAction func btn2(_ sender: UIButton) {
        clickButtonAction(clickNum: 2)
    }
    
    @IBAction func btn3(_ sender: UIButton) {
        clickButtonAction(clickNum: 3)
    }
    
    @IBAction func btn4(_ sender: UIButton) {
        clickButtonAction(clickNum: 4)
    }
    
    @IBAction func btn5(_ sender: UIButton) {
        clickButtonAction(clickNum: 5)
    }
    
    // ------------------------------------------

    
    // func -------------------------------------
    func setDesign(){
        selectedButton()
        
        lblViews.textColor = customColor
        
        outlet_BtnLike.tintColor = customColor
        
        txtCategory.text = getCategory()
        txtCategory.layer.borderWidth = 2
        txtCategory.layer.borderColor = customColor.cgColor
        txtCategory.layer.cornerRadius = 15
        
        txtTitle.text = receiveqTitle
        txtTitle.layer.borderWidth = 2
        txtTitle.layer.borderColor = customColor.cgColor
        txtTitle.layer.cornerRadius = 15
        
        // Title에 민규가 준 값 넣기
        outlet_btn1.layer.borderWidth = 2
        outlet_btn1.layer.cornerRadius = 15
        outlet_btn1.layer.borderColor = customColor.cgColor
        outlet_btn1.setTitleColor(customColor, for: .normal)

        outlet_btn2.layer.borderWidth = 2
        outlet_btn2.layer.cornerRadius = 15
        outlet_btn2.layer.borderColor = customColor.cgColor
        outlet_btn2.setTitleColor(customColor, for: .normal)

        outlet_btn3.isHidden = true
        outlet_btn3.layer.borderWidth = 2
        outlet_btn3.layer.cornerRadius = 15
        outlet_btn3.layer.borderColor = customColor.cgColor
        outlet_btn3.setTitleColor(customColor, for: .normal)

        outlet_btn4.isHidden = true
        outlet_btn4.layer.borderWidth = 2
        outlet_btn4.layer.cornerRadius = 15
        outlet_btn4.layer.borderColor = customColor.cgColor
        outlet_btn4.setTitleColor(customColor, for: .normal)

        outlet_btn5.isHidden = true
        outlet_btn5.layer.borderWidth = 2
        outlet_btn5.layer.cornerRadius = 15
        outlet_btn5.layer.borderColor = customColor.cgColor
        outlet_btn5.setTitleColor(customColor, for: .normal)

    }
    
    func selectedButton(){

        outlet_btn1.isEnabled = false
        outlet_btn2.isEnabled = false
        outlet_btn3.isEnabled = false
        outlet_btn4.isEnabled = false
        outlet_btn5.isEnabled = false
        
        switch sqSelection{
        case 0:
            outlet_btn1.isEnabled = true
            outlet_btn2.isEnabled = true
            outlet_btn3.isEnabled = true
            outlet_btn4.isEnabled = true
            outlet_btn5.isEnabled = true
            
        case 1:
            outlet_btn1.backgroundColor = customColor
            outlet_btn1.titleLabel?.font = UIFont(name: outlet_btn1.titleLabel!.font.fontName, size: 20)
            outlet_btn1.setTitleColor(.white, for: .normal)

        case 2:
            outlet_btn2.backgroundColor = customColor
            outlet_btn2.titleLabel?.font = UIFont(name: outlet_btn2.titleLabel!.font.fontName, size: 20)
            outlet_btn2.setTitleColor(.white, for: .normal)

        case 3:
            outlet_btn3.backgroundColor = customColor
            outlet_btn3.titleLabel?.font = UIFont(name: outlet_btn3.titleLabel!.font.fontName, size: 20)
            outlet_btn3.setTitleColor(.white, for: .normal)

        case 4:
            outlet_btn4.backgroundColor = customColor
            outlet_btn4.titleLabel?.font = UIFont(name: outlet_btn4.titleLabel!.font.fontName, size: 20)
            outlet_btn4.setTitleColor(.white, for: .normal)

        default:
            outlet_btn5.backgroundColor = customColor
            outlet_btn5.titleLabel?.font = UIFont(name: outlet_btn5.titleLabel!.font.fontName, size: 20)
            outlet_btn5.setTitleColor(.white, for: .normal)


        }
    }
    
    func clickButtonAction(clickNum : Int){
        imageFileName_ImageView = returnImageFileName(clickNum: clickNum)
        
        var alertTitle = ""
        
        switch clickNum{
        case 1:
            alertTitle = receiveqSelection1
        case 2:
            alertTitle = receiveqSelection2
        case 3:
            alertTitle = receiveqSelection3
        case 4:
            alertTitle = receiveqSelection4
        default:
            alertTitle = receiveqSelection5
        }
        
        let alert = UIAlertController(title: alertTitle, message: "한번 선택하면 수정할 수 없습니다.\n선택하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "선택", style: UIAlertAction.Style.destructive, handler: { [self]ACTION in
            let insertModel = LMW_InsertModel()
            insertModel.insert_sqSelection(questions_qSeqno: Int(receiveqSeqno)!, sqSelection: clickNum)

            sqSelection = clickNum
            selectedButton()
            
            lblTotalSelector.text = "총 \(countSelector + 1)명이 참여했습니다"

            cnts[clickNum - 1] += 1
            
            outlet_btn1.setTitle("\(receiveqSelection1) (\(cnts[0])명/\(String(format: "%.f", ((Double(cnts[0]))/Double(countSelector + 1)) * 100))%)", for: .normal)
            outlet_btn2.setTitle("\(receiveqSelection2) (\(cnts[1])명/\(String(format: "%.f", ((Double(cnts[1]))/Double(countSelector + 1)) * 100))%)", for: .normal)
            outlet_btn3.setTitle("\(receiveqSelection3) (\(cnts[2])명/\(String(format: "%.f", ((Double(cnts[2]))/Double(countSelector + 1)) * 100))%)", for: .normal)
            outlet_btn4.setTitle("\(receiveqSelection4) (\(cnts[3])명/\(String(format: "%.f", ((Double(cnts[3]))/Double(countSelector + 1)) * 100))%)", for: .normal)
            outlet_btn5.setTitle("\(receiveqSelection5) (\(cnts[4])명/\(String(format: "%.f", ((Double(cnts[4]))/Double(countSelector + 1)) * 100))%)", for: .normal)

            findMaxIndex()
            setFocus()
            
        })
        
        let cancelAction = UIAlertAction(title: "취소", style: UIAlertAction.Style.default, handler: nil)
        
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)

        //컨텐트 뷰 영역에 들어갈 컨트롤러를 생성하고, 알림창에 등록한다.
        let contentVC = ImageViewController()
        
        // 뷰 컨트롤러 알림창의 콘텐츠 뷰 컨트롤러 속성에 등록한다.
        alert.setValue(contentVC, forKeyPath: "contentViewController")

        present(alert, animated: true, completion: nil)
        
        
    }
    
    func makeCategoryString(categoryNum : Int) -> String{
        switch categoryNum{
        case 0:
           return "음식"
        case 1:
            return "여행"
        case 2:
            return "연애"
        case 3:
            return "결혼"
        case 4:
            return "성"
        default:
            return "기타"
        }
    }
    
    func kakaoTalkMessage(){
//        let title = "피드 메시지"
//        let description = "피드 메시지 예제"

        let feedTemplateJsonStringData =
            """
            {
                "object_type": "feed",
                "content": {
                    "title": "딸기 치즈 케익",
                    "description": "#케익 #딸기 #삼평동 #카페 #분위기 #소개팅",
                    "image_url": "http://mud-kage.kakao.co.kr/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png",
                    "link": {
                        "mobile_web_url": "https://developers.kakao.com",
                        "web_url": "https://developers.kakao.com"
                    }
                },
                "social": {
                    "comment_count": 45,
                    "like_count": 286,
                    "shared_count": 845
                },
                "buttons": [
                    {
                        "title": "웹으로 보기",
                        "link": {
                            "mobile_web_url": "https://developers.kakao.com",
                            "web_url": "https://developers.kakao.com"
                        }
                    },
                    {
                        "title": "앱으로 보기",
                        "link": {
                            "android_execution_params": "key1=value1&key2=value2",
                            "ios_execution_params": "key1=value1&key2=value2"
                        }
                    }
                ]
            }
            """.data(using: .utf8)!

        
        
        // templatable은 메시지 만들기 항목 참고
        if let templatable = try? SdkJSONDecoder.custom.decode(FeedTemplate.self, from: feedTemplateJsonStringData) {
            LinkApi.shared.defaultLink(templatable: templatable) {(linkResult, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("defaultLink() success.")

                    if let linkResult = linkResult {
                        UIApplication.shared.open(linkResult.url, options: [:], completionHandler: nil)
                    }
                }
            }
        }
    }
    
    func share() {
        
        var objectsToShare = [outlet_btn1.titleLabel?.text!, outlet_btn2.titleLabel?.text!, outlet_btn3.titleLabel?.text!, outlet_btn4.titleLabel?.text!, outlet_btn5.titleLabel?.text!]
        var text = objectsToShare[0]! + " VS " + objectsToShare[1]!
      
        if objectsToShare[2] != "X" || objectsToShare[2] != "Button"{
            text = text + " VS " + objectsToShare[2]!
        }
        
        if objectsToShare[3] != "X" || objectsToShare[3] != "Button"{
            text = text + " VS " + objectsToShare[3]!
        }
        
        if objectsToShare[4] != "X" || objectsToShare[4] != "Button"{
            text = text + " VS " + objectsToShare[4]!
        }
        
        objectsToShare.removeAll()
        objectsToShare.append(text)
        print("text : \(text)")
  
        let activityVC = UIActivityViewController(activityItems: objectsToShare as [Any], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        activityVC.isModalInPresentation = true
        
        // 공유하기 기능 중 제외할 기능이 있을 때 사용
        //        activityVC.excludedActivityTypes = [UIActivityType.airDrop, UIActivityType.addToReadingList]
        self.present(activityVC, animated: true, completion: nil)
        
        activityVC.completionWithItemsHandler = { (activityType: UIActivity.ActivityType?, completed: Bool, arrayReturnedItems: [Any]?, error: Error?) in
            if completed { self.showToast(message: "share success")
                
            }else { self.showToast(message: "share cancel") }
            if let shareError = error {
                self.showToast(message: "\(shareError.localizedDescription)")
                
            }
            
        }

    }
    
    func showToast(message : String) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height/2, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: { toastLabel.alpha = 0.0 }, completion: {(isCompleted) in toastLabel.removeFromSuperview() })
        
    }
    
    func findMaxIndex(){
        
        var maxIndex = 0
        
        for i in 0..<cnts.count{
            if i == 0{
                maxIndex = 0
            }else if cnts[i] > cnts[i - 1]{
                if cnts[i] > cnts[0]{
                    maxIndex = i
                }
                if cnts[i] == cnts[0]{
                    maxIndex = -1
                }
            }
        }
        
        print("maxIndex : \(maxIndex)")

    }
    
    func setFocus(){
        
        print("setFocus")
        // Store text change NSMutableAttributedString Type
        var attributedStr = NSMutableAttributedString(string: outlet_btn1.titleLabel!.text!)
        attributedStr.addAttribute(.foregroundColor, value: UIColor.red, range: (outlet_btn1.titleLabel!.text! as NSString).range(of: "(\(cnts[0])명/\(String(format: "%.f", ((Double(cnts[0]))/Double(countSelector)) * 100))%)"))
        attributedStr = NSMutableAttributedString(string: outlet_btn2.titleLabel!.text!)
        attributedStr.addAttribute(.foregroundColor, value: UIColor.red, range: (outlet_btn2.titleLabel!.text! as NSString).range(of: "(\(cnts[1])명/\(String(format: "%.f", ((Double(cnts[1]))/Double(countSelector)) * 100))%)"))
        attributedStr = NSMutableAttributedString(string: outlet_btn3.titleLabel!.text!)
        attributedStr.addAttribute(.foregroundColor, value: UIColor.red, range: (outlet_btn3.titleLabel!.text! as NSString).range(of: "(\(cnts[2])명/\(String(format: "%.f", ((Double(cnts[2]))/Double(countSelector)) * 100))%)"))
        attributedStr = NSMutableAttributedString(string: outlet_btn4.titleLabel!.text!)
        attributedStr.addAttribute(.foregroundColor, value: UIColor.red, range: (outlet_btn4.titleLabel!.text! as NSString).range(of: "(\(cnts[3])명/\(String(format: "%.f", ((Double(cnts[3]))/Double(countSelector)) * 100))%)"))
        attributedStr = NSMutableAttributedString(string: outlet_btn5.titleLabel!.text!)
        attributedStr.addAttribute(.foregroundColor, value: UIColor.red, range: (outlet_btn5.titleLabel!.text! as NSString).range(of: "(\(cnts[4])명/\(String(format: "%.f", ((Double(cnts[4]))/Double(countSelector)) * 100))%)"))
    }
    
    func getCategory() -> String{
        switch Int(receiveqCategory){
        case 1:
        return "음식"
        case 2:
        return "여행"
        case 3:
        return "연애"
        case 4:
        return "결혼"
        case 5:
        return "성"
        default:
            return "기타"
  
        }
    }
    
    func returnImageFileName(clickNum : Int) -> String{
        switch clickNum{
        case 1:
            return receiveqImageFileName1
        case 2:
            return receiveqImageFileName2
        case 3:
            return receiveqImageFileName3
        case 4:
            return receiveqImageFileName4
        default:
            return receiveqImageFileName5
        }
    }

}

extension ContentDetailViewController: MFMessageComposeViewControllerDelegate{
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch result{
        case .cancelled:
            print("cancelled")
            dismiss(animated: true, completion: nil)

        case .sent:
            print("sent")
            dismiss(animated: true, completion: nil)

        case .failed:
            print("failed")
            dismiss(animated: true, completion: nil)
            
        @unknown default:
            print("default")
            dismiss(animated: true, completion: nil)

        }
    }
}
