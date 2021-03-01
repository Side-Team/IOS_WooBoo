//
//  SearchTableViewController.swift
//  WooBoo_Project
//
//  Created by 유민규 on 2021/03/01.
//

import UIKit

class SearchTableViewController: UITableViewController, UISearchBarDelegate {
    
    let data = ["Apples", "Oranges", "Pears", "Bananas", "Plums"]
    var filteredData: [String]!
 

    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        searchBar.delegate = self
        filteredData = data
       
    }

    // MARK: - Table view data source
    
    // 한번에 보여줄 데이터 값
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    // 몇개의 데이터를 보여줄 것이냐
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredData.count
    }
    
    // 프로그램에 내가 뭘 하고싶은지 보여주고싶은지 작성
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // TableCell의 identifier 값
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        
        // label에 data값
        cell.textLabel?.text = filteredData[indexPath.row]
        
        return cell
    }
    
    // MARK: Search Bar Config
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        filteredData = []
        
        // 빈칸일때
        if searchText == ""{
            filteredData = data
        }
        
        else{
            for fruit in data {
                
                if fruit.lowercased().contains(searchText.lowercased()){
                    
                    filteredData.append(fruit)
                }
            }
            
            self.tableView.reloadData()
        }
    }

}
