//
//  ProfileSearchController.swift
//  BlockStackBrowser
//
//  Created by lsease on 6/26/17.
//  Copyright © 2017 blockstack. All rights reserved.
//

import UIKit
import BlockstackCoreApi_iOS

class ProfileSearchController: UIViewController {
    
    @IBOutlet var tableView : UITableView!
    @IBOutlet var searchText : UITextField!
    var results : [BSSearchResponse.BSSearchResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func searchPressed()
    {
        if let query = searchText.text
        {
            BSCoreApi.search(query: query) { (response, error) in
                print(response ?? (error ?? "No response"))
                if let results = response?.results{
                    self.results = results
                    self.tableView.reloadData()
                }
            }
        }
    }

}

extension ProfileSearchController : UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if results.count == 0
        {
            return 1
        }
        
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // Configure the cell...
        if indexPath.row < results.count
        {
            cell.textLabel?.text = results[indexPath.row].profile.description
        }else{
            if let query = searchText.text, query.count > 0{
                cell.textLabel?.text = "No Results Found For '\(query)'"
            }else{
                cell.textLabel?.text = ""
            }
        }
        
        return cell
    }
    
}
