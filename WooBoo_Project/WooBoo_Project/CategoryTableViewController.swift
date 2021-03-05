//
//  CategoryTableViewController.swift
//  WooBoo_Project
//
//  Created by 유민규 on 2021/02/26.
//

import UIKit
var categoryvalue = ""
class CategoryTableViewController: UITableViewController, CategoryModelProtocol, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    var filteredData: [String]!
    var temp = [String]()

    @IBOutlet var listViewTable: UITableView!
    @IBOutlet weak var lblCategoryName: UILabel!
    
    var feedItem: NSArray = NSArray()
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        let categoryModel = CategoryModel()
        categoryModel.delegate = self
        categoryModel.categoryItems(category: categoryvalue)
        print("테이블에서 카테고리 값 : \(categoryvalue)")
        
        switch categoryvalue{
        case "1":
            lblCategoryName.text = "음식"
        case "2":
            lblCategoryName.text = "여행"
        case "3":
            lblCategoryName.text = "연애"
        case "4":
            lblCategoryName.text = "결혼"
        case "5":
            lblCategoryName.text = "성"
        case "6":
            lblCategoryName.text = "기타"
        default:
            print("default")
        }
        
        searchBar.delegate = self
        filteredData = temp
        print(filteredData as Any)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear")
        
        filteredData.removeAll()
        temp.removeAll()
    }

    func itemDownloaded(items: NSArray) {
        self.feedItem = items
        
        print("itemDownloaded feedItem 개수 : \(feedItem.count)")
        
        
        for i in 0..<feedItem.count{
            let item: categoryDBModel = feedItem[i] as! categoryDBModel
            temp.append(item.qTitle!)
        }
        filteredData = temp
        print("itemDownloaded filteredData 개수 : \(filteredData.count)")


       print("temp 확인 : \(temp)")
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
        return filteredData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        let item: categoryDBModel = feedItem[indexPath.row] as! categoryDBModel
        
        print("tableView filteredData 개수 : \(filteredData.count)")
        print("tableView feedItem 개수 : \(feedItem.count)")

        cell.textLabel?.text = filteredData[indexPath.row]
        cell.detailTextLabel?.text = "\(item.qInsertDate!)"
        print("나와아라랑")
        // Configure the cell...

        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        filteredData = []
        print(temp)
        // 빈칸일때
        if searchText == ""{
            filteredData = temp
            print("tableView filteredData 개수 : \(filteredData.count)")

        }
        
        else{
            for fruit in temp {
                
                if fruit.lowercased().contains(searchText.lowercased()){
                    
                    filteredData.append(fruit)
                }
            }
        }
        self.tableView.reloadData()

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

    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgDetail"{
            let cell = sender as! UITableViewCell
            let indexPath = self.listViewTable.indexPath(for: cell)
            let detailView = segue.destination as! ContentDetailViewController
            
            //let item: Students = studentsList[(indexPath! as NSIndexPath).row]
            let item: categoryDBModel = feedItem[indexPath!.row] as! categoryDBModel // 스튜던트 리스트에서 값을 가져온다
            
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
}
