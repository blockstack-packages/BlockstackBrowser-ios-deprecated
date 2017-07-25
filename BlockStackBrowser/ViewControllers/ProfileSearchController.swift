//
//  ProfileSearchController.swift
//  BlockStackBrowser
//
//  Created by lsease on 6/26/17.
//  Copyright © 2017 blockstack. All rights reserved.
//

import UIKit
import BlockstackCoreApi_iOS
import SeaseAssist

class ProfileSearchController: UIViewController {
    
    @IBOutlet var tableView : UITableView!
    @IBOutlet var searchText : UITextField!
    var results : [SearchResponse.SearchResult] = []
    
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
            CoreApi.search(query: query) { (response, error) in
                print(response ?? (error ?? "No response"))
                if let results = response?.results{
                    self.results = results
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let index = tableView.indexPathForSelectedRow
        {
            tableView.deselectRow(at: index, animated: false)
            
            if let vc = segue.destination as? ProfileViewController
            {
                vc.profile = results[index.row].profile
                vc.username = results[index.row].username
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
        
        cell.imageView?.image = nil
        
        // Configure the cell...
        if indexPath.row < results.count
        {
            let result = results[indexPath.row]
            cell.textLabel?.text = result.username
            cell.imageView?.bounds = CGRect(x: 0, y: 0, width: 25, height: 25)
            cell.imageView?.setImageFromUrl(result.profile.image?.first?.contentUrl, withDefault: UIImage(named: "avatar.png"), rounding: true, completion: { (loaded) in
                if let image = cell.imageView?.image
                {
                    cell.imageView?.image = image.scalingProportionally(to: CGSize(width: 25, height: 25))
                }
            })
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
