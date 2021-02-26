//
//  CategoryTableViewController.swift
//  WooBoo_Project
//
//  Created by 유민규 on 2021/02/26.
//

import UIKit
var categoryvalue = ""
class CategoryTableViewController: UITableViewController, CategoryModelProtocol {

    
    @IBOutlet var listViewTable: UITableView!
    
    var feedItem: NSArray = NSArray()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let categoryModel = CategoryModel()
        categoryModel.delegate = self
        categoryModel.categoryItems(category: categoryvalue)
        print("테이블에서 카테고리 값 : \(categoryvalue)")
       
    }
    
    func itemDownloaded(items: NSArray) {
        self.feedItem = items
        self.listViewTable.reloadData()
//        let item:categoryDBModel = feedItem[0] as! categoryDBModel
//
//        print("Items.FeedItem = \(String(describing: item.qTitle))")
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return feedItem.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        let item: categoryDBModel = feedItem[indexPath.row] as! categoryDBModel
        cell.textLabel?.text = "\(item.qTitle!)"
        cell.detailTextLabel?.text = "\(item.qInsertDate!)"
        print("나와아라랑")
        // Configure the cell...

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
