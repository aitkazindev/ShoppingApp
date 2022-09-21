//
//  ItemsTableViewController.swift
//  ShoppingApp
//
//  Created by GreyResearch_design on 2022/09/21.
//

import UIKit

class ItemsTableViewController: UITableViewController {
    
    //MARK: Vars
    var category: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    // MARK: - Navigation

        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "itemToAddItemSeg" {
                let vc = segue.destination as! AddItemViewController
                vc.category = category!
            }
        }

}
