//
//  BaseTableViewController.swift
//  Shopping List
//
//  Created by Sergey Leskov on 6/16/17.
//  Copyright © 2017 Sergey Leskov. All rights reserved.
//

import UIKit
import CoreData

class BaseTableViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
}

//==================================================
// MARK: - UITableViewDataSource, UITableViewDelegate
//==================================================

extension BaseTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    //MARK: UITableViewDataSource
    
    internal func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        assert(false, "Subclasses must override the method")
        return 0
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "None", for: indexPath)
        assert(false, "Subclasses must override the method")
        return cell
    }
    
    //MARK: UITableViewDelegate
    
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


