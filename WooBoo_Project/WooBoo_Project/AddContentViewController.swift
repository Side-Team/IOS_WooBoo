//
//  AddContentViewController.swift
//  WooBoo_Project
//
//  Created by 이민우 on 2021/02/23.
//

import UIKit
import DropDown

class AddContentViewController: UIViewController, UITextFieldDelegate, AddImageDelegate, Get_questions_qSeqno, Get_LatestSeqno{
    func return_LatestSeqno(qSeqno: Int) {
        let inserQuestiontModel = LMW_InsertModel()
        inserQuestiontModel.insert_registerT(questions_qSeqno: qSeqno)
        
        if imageURL.count > 0{
            for i in 0..<imageURL.count{
                let imageUploadModel = ImageUploadModel()
                imageUploadModel.uploadImageFile(at: imageURL[i], completionHandler: {_,_ in print("Upload Success")})

            }
        }
    }
    

    func return_questions_qSeqno(item: Int) {
        
        let inserQuestiontModel = LMW_InsertModel()
        inserQuestiontModel.insertItems(qTitle: txtTitle.text!, qSelection1: txtContent1.text!, qSelection2: txtContent2.text!, qSelection3: checkTxtValue(txt: txtContent3.text!.trimmingCharacters(in: .whitespacesAndNewlines)), qSelection4: checkTxtValue(txt: txtContent4.text!.trimmingCharacters(in: .whitespacesAndNewlines)), qSelection5: checkTxtValue(txt: txtContent5.text!.trimmingCharacters(in: .whitespacesAndNewlines)), qCategory: makeCategoryNumber(), qImageFileName1: imageFileNames[0], qImageFileName2: imageFileNames[1], qImageFileName3: imageFileNames[2], qImageFileName4: imageFileNames[3], qImageFileName5: imageFileNames[4])
        
        print("get_qSeqno : \(item + 1)")
        
//        if result1 == true{
//            print("result1 : \(result1)")
//            qSeqnoSwitch = 1
//
//            selectModel.downloadItems(funcName: "get_qSeqno", urlPath: "http://127.0.0.1:8080/ios_jsp/wooboo_get_qSeqno.jsp")
            // insertAction을 눌렀을 경우
            print("qSeqno 뽑아오기 성공 : \(item + 1)")
            // 뽑아온 qSeqno를 이용해 register테이블에 Insert하기
            
            let resultAlert = UIAlertController(title: "완료", message: "입력이 되었습니다", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { [self]ACTION in
            
                selectModel.downloadItems(funcName: "select_LatestSeqno", urlPath: "http://127.0.0.1:8080/ios_jsp/wooboo_Select_LatestSeqno.jsp?user_uSeqno=\(Share.uSeqno)")
                
                self.navigationController?.popViewController(animated: true)
            })
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true, completion: nil)
            
                
//          // 에러일 경우
//                let resultAlert = UIAlertController(title: "실패", message: "에러가 발생 되었습니다.", preferredStyle: UIAlertController.Style.alert)
//                let onAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
//                resultAlert.addAction(onAction)
//                present(resultAlert, animated: true, completion: nil)
//
//
            
//        }
        
       
    }
    
 
    @IBOutlet weak var txtCategory: UITextField!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtContent1: UITextField!
    @IBOutlet weak var txtContent2: UITextField!
    @IBOutlet weak var txtContent3: UITextField!
    @IBOutlet weak var txtContent4: UITextField!
    @IBOutlet weak var txtContent5: UITextField!
    @IBOutlet weak var outlet_BtnAdd: UIButton!
    @IBOutlet weak var outlet_BtnAddImage: UIButton!
    
    let selectModel = LMW_SelectModel()
    
    var questions_qSeqno = 0
    
    var txtContentCount = 2
    
    var selectNum = 2
    
    let dropDown = DropDown()
    
    let customColor = UIColor(red: 128/255, green: 194/255, blue: 179/255, alpha: 1)
    
    let pickerView = UIPickerView()
    var selectData = "" // 피커뷰 선택시 값을 갖고 있다가 확인버튼 클릭시 텍스트필드에 세팅한다
    let pickerData = ["음식", "여행", "연애", "결혼", "성", "기타"]  // 피커뷰에 보여줄 테스트 데이터
    
    var imageFileNames = ["", "", "", "", ""]
    
    var tempFileNames = [String]()
    
    var imageURL = [URL]()
    
    var qSeqnoSwitch = 0
    
    var categoryValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("userId : \(Share.userID)")
        print("uSeqno : \(Share.uSeqno)")
        
        print( "높이 : ", self.view.frame.height)
        
        selectModel.delegate2 = self
        selectModel.delegate9 = self

        txtCategory.delegate = self
        txtTitle.delegate = self
        txtContent1.delegate = self
        
        makePadding()
        setDesign()
        makeDropDown()
        setGestureRecognizer_Category()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if categoryValue != 0{
            switch categoryValue{
            case 1:
                txtCategory.text = "음식"
            case 2:
                txtCategory.text = "여행"
            case 3:
                txtCategory.text = "연애"
            case 4:
                txtCategory.text = "결혼"
            case 5:
                txtCategory.text = "성"
            default:
                txtCategory.text = "기타"
            }
        }
        print("***************AddContentViewController 이미지 배열값 : ", self.imageFileNames)
        print("***************AddContentViewController temp 배열값 : ", self.tempFileNames)
    }
    @IBAction func barBtnInsert(_ sender: UIBarButtonItem) {
        print("등록하기")
        checkTxtNilValue()
    }
    
    @IBAction func btnAddImage(_ sender: UIButton) {
        
    }
    @IBAction func btnAddContent(_ sender: UIButton) {
        
        txtContentCount += 1
        selectNum += 1
        
        print("증가 : \(txtContentCount)")
        if txtContentCount >= 5{
            txtContentCount = 5
            outlet_BtnAdd.isHidden = true
        }
        
        switch txtContentCount{
        case 3:
            addRightImage(image: UIImage(systemName: "xmark.circle.fill")!, textField: txtContent3)
            txtContent3.isHidden = false
        case 4:
            addRightImage(image: UIImage(systemName: "xmark.circle.fill")!, textField: txtContent4)
            txtContent4.isHidden = false
        default:
            addRightImage(image: UIImage(systemName: "xmark.circle.fill")!, textField: txtContent5)
            txtContent5.isHidden = false
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func makePadding(){
        let paddingView1 = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: txtContent1.frame.height))
        let paddingView2 = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: txtContent2.frame.height))
        let paddingView3 = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: txtContent3.frame.height))
        let paddingView4 = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: txtContent4.frame.height))
        let paddingView5 = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: txtContent5.frame.height))
        let titlePaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: txtTitle.frame.height))

        txtTitle.leftView = titlePaddingView
        txtTitle.leftViewMode = .always
        txtTitle.rightView = titlePaddingView
        txtTitle.rightViewMode = .always
        
        txtContent1.leftView = paddingView1
        txtContent1.leftViewMode = .always
        
        txtContent2.leftView = paddingView2
        txtContent2.leftViewMode = .always

        txtContent3.leftView = paddingView3
        txtContent3.leftViewMode = .always

        txtContent4.leftView = paddingView4
        txtContent4.leftViewMode = .always

        txtContent5.leftView = paddingView5
        txtContent5.leftViewMode = .always

    }
    
    func addRightImage(image : UIImage, textField : UITextField){

        let button = UIButton(type: .custom)
        
        button.setImage(image, for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        button.frame = CGRect(x: CGFloat(textField.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
//        button.addTarget(self, action: #selector(self.deleteTxtContent), for: .touchUpInside)
        textField.rightView = button
        textField.rightView?.tintColor = customColor
        textField.rightViewMode = .always
        
        setGestureRecognizer()
    }
    
    func setGestureRecognizer(){
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.deleteTxtContent3))
        let tapGR2 = UITapGestureRecognizer(target: self, action: #selector(self.deleteTxtContent4))
        let tapGR3 = UITapGestureRecognizer(target: self, action: #selector(self.deleteTxtContent5))

        
        txtContent3.rightView?.addGestureRecognizer(tapGR)
        txtContent4.rightView?.addGestureRecognizer(tapGR2)
        txtContent5.rightView?.addGestureRecognizer(tapGR3)

    }

    
    @objc func deleteTxtContent3(){
        print("3 txtContentCount = \(txtContentCount)")

        switch txtContentCount{
        
        case 3:
            txtContent3.isHidden = true
            txtContent3.text = ""
            selectNum = 2
        case 4:
            txtContent3.text = txtContent4.text
            txtContent4.isHidden = true
            txtContent4.text = ""
            selectNum = 3
        default:
            txtContent3.text = txtContent4.text
            txtContent4.text = txtContent5.text
            txtContent5.isHidden = true
            txtContent5.text = ""
            selectNum = 4
        }
        
        txtContentCount -= 1

        outlet_BtnAdd.isHidden = false

    }
    
    @objc func deleteTxtContent4(){

        print("4 txtContentCount = \(txtContentCount)")
        switch txtContentCount{
        

        case 4:
            txtContent3.text = txtContent4.text
            txtContent4.isHidden = true
            txtContent4.text = ""
            selectNum = 3

        default:
            txtContent4.text = txtContent5.text
            txtContent5.isHidden = true
            txtContent5.text = ""
            selectNum = 4
        }
        
        txtContentCount -= 1

        outlet_BtnAdd.isHidden = false

    }
    
    @objc func deleteTxtContent5(){
        selectNum = 4

        print("5 txtContentCount = \(txtContentCount)")

//        txtContent3.text = txtContent4.text
//        txtContent4.text = txtContent5.text
        txtContent5.isHidden = true
        txtContent5.text = ""
        
        txtContentCount -= 1
        
        outlet_BtnAdd.isHidden = false

    }

    func makeDropDown(){
        dropDown.dataSource = ["음식", "여행", "연애", "결혼", "성", "기타"]
        dropDown.anchorView = txtCategory
        dropDown.bottomOffset = CGPoint(x: 10, y: (dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.width = 80
        dropDown.textFont = UIFont.systemFont(ofSize: 16)
        dropDown.cellHeight = 35
        dropDown.cornerRadius = 15
        dropDown.selectionBackgroundColor = customColor
        dropDown.backgroundColor = .white
        dropDown.customCellConfiguration = { (index, item, cell) in
            cell.optionLabel.textAlignment = .center
        }
        
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("선택한 아이템 : \(item)")
            print("인덱스 : \(index)")
            txtCategory.text = item
            self.dropDown.clearSelection()
            
        }
    }
    
    func setGestureRecognizer_Category(){
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.textCategoryGesture(sender:)))
        txtCategory.addGestureRecognizer(tapGR)
    }

    @objc func textCategoryGesture(sender: UITapGestureRecognizer){
        dropDown.show()
    }

    func setDesign(){
        txtCategory.delegate = self
        txtContent2.delegate = self
        txtContent3.delegate = self
        txtContent4.delegate = self
        txtContent5.delegate = self
        
        txtCategory.layer.borderWidth = 2
        txtCategory.layer.borderColor = customColor.cgColor
        txtCategory.layer.cornerRadius = 15
        
        txtTitle.layer.borderWidth = 2
        txtTitle.layer.borderColor = customColor.cgColor
        txtTitle.layer.cornerRadius = 15
        
        txtContent1.layer.borderWidth = 2
        txtContent1.layer.borderColor = customColor.cgColor
        txtContent1.layer.cornerRadius = 15
        
        txtContent2.layer.borderWidth = 2
        txtContent2.layer.borderColor = customColor.cgColor
        txtContent2.layer.cornerRadius = 15

        txtContent3.layer.borderWidth = 2
        txtContent3.layer.borderColor = customColor.cgColor
        txtContent3.layer.cornerRadius = 15
        txtContent3.isHidden = true

        txtContent4.layer.borderWidth = 2
        txtContent4.layer.borderColor = customColor.cgColor
        txtContent4.layer.cornerRadius = 15
        txtContent4.isHidden = true

        txtContent5.layer.borderWidth = 2
        txtContent5.layer.borderColor = customColor.cgColor
        txtContent5.layer.cornerRadius = 15
        txtContent5.isHidden = true
        
        outlet_BtnAdd.tintColor = customColor
        outlet_BtnAddImage.tintColor = customColor
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var maxLength : Int = 0
                
        if textField == txtTitle{
            maxLength = 20
        } else{
            maxLength = 10
        }
        
        let currentString: NSString = textField.text! as NSString
        
        let newString: NSString =  currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
    // Segue를 통해 데이터 보내기 (Field 값만 건드리는 것이 좋다!)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let AddImageViewController = segue.destination as! AddImageViewController
        
        AddImageViewController.selectNum = selectNum
        imageViewStatus.append(selectNum)
        print("selectNum : \(selectNum)")
        if imageFileNames.count > 0{
            AddImageViewController.imageFileNames = self.imageFileNames
            AddImageViewController.tempFileNames = self.tempFileNames
        }
        AddImageViewController.delegate = self // Main에서 Sub로 날라갈 때 권한을 준 것
    }
    
    // imagefilenames 받기
    func didSelectedImage(_ controller: AddImageViewController, imageFileNames: [String], tempFileNames : [String], imageURL: [URL]) {
        self.imageFileNames = imageFileNames
        self.tempFileNames = tempFileNames
        self.imageURL = imageURL
        
        print("***************AddContentViewController 이미지 배열값 : ", self.imageFileNames)
        print("***************AddContentViewController temp 배열값 : ", self.tempFileNames)

    }
    
    // DB Insert
    func InsertAction(){
        selectModel.downloadItems(funcName: "get_qSeqno", urlPath: "http://127.0.0.1:8080/ios_jsp/wooboo_get_qSeqno.jsp")

    }
    
    func checkTxtValue(txt : String) -> String {
        if txt.isEmpty{
            return "X"
        }else{
            return txt
        }
    }
    
    func makeCategoryNumber() -> Int{
        switch txtCategory.text!{
        case "음식":
            return 1
        case "여행":
            return 2
        case "연애":
            return 3
        case "결혼":
            return 4
        case "성":
            return 5
        default:
            return 6
        }
    }
    
    func checkTxtNilValue(){
        let alert = UIAlertController(title: "알림", message: "빈칸없이 입력해주세요.", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okAction)
        
        if txtTitle.text?.trimmingCharacters(in: .whitespacesAndNewlines).count == 0 || txtContent1.text?.trimmingCharacters(in: .whitespacesAndNewlines).count == 0 || txtContent2.text?.isEmpty == true{
            present(alert, animated: true, completion: nil)
        }else if txtContent3.isHidden == false && txtContent3.text?.trimmingCharacters(in: .whitespacesAndNewlines).count == 0{
            print("txtContent3 체크중..")
            present(alert, animated: true, completion: nil)
        }else if txtContent4.isHidden == false && txtContent4.text?.trimmingCharacters(in: .whitespacesAndNewlines).count == 0{
            print("txtContent4 체크중..")
            present(alert, animated: true, completion: nil)

        }else if txtContent5.isHidden == false && txtContent5.text?.trimmingCharacters(in: .whitespacesAndNewlines).count == 0{
            print("txtContent5 체크중..")
            present(alert, animated: true, completion: nil)
        }else{
            InsertAction()
        }
    }
//    private func registerForKeyboardNotifications() {
//        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
//    }
//
//    private func unregisterForKeyboardNotifications() {
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
//    }
//
//
//    @objc private func keyboardWillShow(_ notification: Notification) {
//      if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
//        let keybaordRectangle = keyboardFrame.cgRectValue
//        let keyboardHeight = keybaordRectangle.height - 150
//        self.view.frame.origin.y -= keyboardHeight
//        print("키보드 높이 : \(keyboardHeight)")
//      }
//    }
//
//    @objc private func keyboardWillHide(_ notification: Notification) {
//      if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
//        let keybaordRectangle = keyboardFrame.cgRectValue
//        let keyboardHeight = keybaordRectangle.height - 150
//        self.view.frame.origin.y += keyboardHeight
//      }
//    }
    
    
    
    
    
//    func makePicker(){
//        pickerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 220)
//              pickerView.delegate = self
//              pickerView.dataSource = self
//
//              // 피커뷰 툴바추가
//              let pickerToolbar : UIToolbar = UIToolbar()
//              pickerToolbar.barStyle = .default
//              pickerToolbar.isTranslucent = true  // 툴바가 반투명인지 여부 (true-반투명, false-투명)
//              pickerToolbar.backgroundColor = .lightGray
//              pickerToolbar.sizeToFit()   // 서브뷰만큼 툴바 크기를 맞춤
//              // 피커뷰 툴바에 확인/취소 버튼추가
//              let btnDone = UIBarButtonItem(title: "확인", style: .done, target: self, action: #selector(onPickDone))
//              let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
//              let btnCancel = UIBarButtonItem(title: "취소", style: .done, target: self, action: #selector(onPickCancel))
//              pickerToolbar.setItems([btnCancel , space , btnDone], animated: true)   // 버튼추가
//              pickerToolbar.isUserInteractionEnabled = true   // 사용자 클릭 이벤트 전달
//
//        txtCategory.inputView = pickerView // 피커뷰 추가
//        txtCategory.inputAccessoryView = pickerToolbar // 피커뷰 툴바 추가
//    }
//
//
//    // 피커뷰 > 확인 클릭
//      @objc func onPickDone() {
//        txtCategory.text = selectData
//        txtCategory.resignFirstResponder()
//          selectData = ""
//      }
//
//      // 피커뷰 > 취소 클릭
//      @objc func onPickCancel() {
//        txtCategory.resignFirstResponder() // 피커뷰를 내림 (텍스트필드가 responder 상태를 읽음)
//          selectData = ""
//      }
//
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1    // 구성요소(컬럼)로 지역만 있으므로 1을 리턴
//
//
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return pickerData.count
//
//    }
//
//    // 피커뷰에 보여줄 값 전달
//      func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//          return pickerData[row]
//      }
//
//      // 피커뷰에서 선택시 호출
//      func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//          selectData = pickerData[row]
//      }
//
    
}
