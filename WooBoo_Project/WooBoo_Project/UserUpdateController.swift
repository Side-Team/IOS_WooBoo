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
        
        let item: UserModel = feedItem as! UserModel
        lblWooboo?.text = "우부\(item.uSeqno!)"
    }
    
    func itemDownloaded(items: NSArray) {
        feedItem = items
    
    }
    
    
    @IBAction func UserDelete(_ sender: UIButton) {
    }
    
    @IBAction func UserUpdate(_ sender: UIButton) {
    }
    
    @IBAction func UserOK(_ sender: UIButton) {
    }
    

    
/*    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
