//
//  MyPageQTableViewController.swift
//  WooBoo_Project
//
//  Created by 이민우 on 2021/02/28.
//

import UIKit

class MyPageQTableViewController: UITableViewController, Get_MyQuestions {
    func return_MyQuestions(myQuestions: NSArray) {
        self.myQuestions = myQuestions
        self.tvMyQuestions.reloadData()
    }
    

    @IBOutlet var tvMyQuestions: UITableView!
    
    let cellName = "MyQTCell" 
    var myQuestions: NSArray = NSArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tvMyQuestions.delegate = self
        tvMyQuestions.dataSource = self

        let selectModel = LMW_SelectModel()
        selectModel.delegate7 = self
        selectModel.downloadItems(funcName: "select_MyQuestions", urlPath: "http://127.0.0.1:8080/ios_jsp/wooboo_Select_questionsList.jsp?user_uSeqno=\(Share.uSeqno)")
        
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
        print("feedItem")
        
        return cell
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
