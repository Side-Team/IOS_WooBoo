//
//  MyPageQTableViewController.swift
//  WooBoo_Project
//
//  Created by 이민우 on 2021/02/28.
//

import UIKit

class MyPageQTableViewController: UITableViewController, Get_MyQuestions {
    func return_MyQuestions(myQuestions: NSArray) {
        self.myQuestions = myQuestions as! NSMutableArray
        let item: categoryDBModel = myQuestions[0] as! categoryDBModel
        print("MyPageQTableViewController : \(String(describing: item.qSeqno))")
        self.tvMyQuestions.reloadData()
    }
    

    @IBOutlet var tvMyQuestions: UITableView!
    
    let cellName = "MyQTCell" 
    var myQuestions: NSMutableArray = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()

//        let selectModel = LMW_SelectModel()
//        selectModel.delegate7 = self
//        selectModel.downloadItems(funcName: "select_MyQuestions", urlPath: "http://127.0.0.1:8080/ios_jsp/wooboo_Select_questionsList.jsp?user_uSeqno=\(Share.uSeqno)")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Table 재구성
        let selectModel = LMW_SelectModel()
        selectModel.delegate7 = self
        selectModel.downloadItems(funcName: "select_MyQuestions", urlPath: "http://127.0.0.1:8080/ios_jsp/wooboo_Select_questionsList.jsp?user_uSeqno=\(Share.uSeqno)")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myQuestions.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as! MyQTableViewCell

        
        // Configure the cell...
        let item: categoryDBModel = myQuestions[indexPath.row] as! categoryDBModel
        
        cell.lblTitle.text = "\(item.qTitle!)"
        cell.lblInsertDate.text = "\(item.qInsertDate!)"
        
        
        return cell
    }
    
    @IBAction func btnDelete(_ sender: UIButton) {
        print("버튼 클릭")
        let contentView = sender.superview
        let cell = contentView?.superview as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)
        let row = indexPath![1]
        let item: categoryDBModel = myQuestions[row] as! categoryDBModel
        let qSeqno = Int(item.qSeqno!)!
        
        let updateModel = LMW_UpdateModel()
        updateModel.update_MyQuestions(qSeqno: qSeqno)
        
        myQuestions.removeObject(at: row)
//
        self.tvMyQuestions.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MyQuestions"{
            let cell = sender as! UITableViewCell
            let indexPath = self.tvMyQuestions.indexPath(for: cell)
            let detailView = segue.destination as! ContentDetailViewController
            
            //let item: Students = studentsList[(indexPath! as NSIndexPath).row]
            let item: categoryDBModel = myQuestions[indexPath!.row] as! categoryDBModel // 스튜던트 리스트에서 값을 가져온다
            
            let qSeqno = item.qSeqno!
            let user_uSeqno = item.user_uSeqno!
            let qTitle = item.qTitle!
            let qSelection1 = item.qSelection1!
            let qSelection2 = item.qSelection2!
            let qSelection3 = item.qSelection3!
            let qSelection4 = item.qSelection4!
            let qSelection5 = item.qSelection5!
            let qCategory = item.qCategory!
            let qInsertDate = item.qInsertDate!
            let qDeleteDate = item.qDeleteDate!
            let qImageFileName1 = item.qImageFileName1!
            let qImageFileName2 = item.qImageFileName2!
            let qImageFileName3 = item.qImageFileName3!
            let qImageFileName4 = item.qImageFileName4!
            let qImageFileName5 = item.qImageFileName5!
            print(qSeqno)
            
            // detailView에서 받는걸 해줘야 사용 가능
            detailView.receiveItems(qSeqno, user_uSeqno, qTitle, qSelection1, qSelection2, qSelection3, qSelection4, qSelection5, qCategory, qInsertDate, qDeleteDate, qImageFileName1, qImageFileName2, qImageFileName3, qImageFileName4, qImageFileName5)
        }
    
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
