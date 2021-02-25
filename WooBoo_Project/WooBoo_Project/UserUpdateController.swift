//
//  UserUpdateController.swift
//  WooBoo_Project
//
//  Created by 김보람 on 2021/02/24.
//

import UIKit

class UserUpdateController: UIViewController,JspUserSelectProtocol {

    
    @IBOutlet weak var lblEmail: UITextField!
    @IBOutlet weak var lblWooboo: UILabel!
    @IBOutlet weak var lblPassword: UITextField!
    @IBOutlet weak var lblPasswordCheck: UITextField!
    
    var feedItem: NSArray = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblEmail.text = Share.userID
        lblEmail.isEnabled = false
        
        let userSelect = JspUserSelect()
        userSelect.delegate = self
        userSelect.downloadItems()
    
        nawara()
    }
    
    func itemDownloaded(items: NSArray) {
        feedItem = items
        print(feedItem)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let queryModel = JspUserSelect()
        queryModel.delegate = self
        queryModel.downloadItems()
    }
    
    @IBAction func UserDelete(_ sender: UIButton) {
    }
    
    @IBAction func UserUpdate(_ sender: UIButton) {
    }
    
    @IBAction func UserOK(_ sender: UIButton) {
    }
    
    func nawara(){
        let item: UserModel = feedItem[0] as! UserModel
        print("우부\(item.uSeqno!)")

    }

    
/*    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
