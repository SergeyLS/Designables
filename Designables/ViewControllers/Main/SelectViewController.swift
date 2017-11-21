//
//  SelectViewController.swift
//  Designables
//
//  Created by Sergey Leskov on 11/16/17.
//  Copyright © 2017 Sergey Leskov. All rights reserved.
//

import UIKit

class SelectViewController: BaseTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



//==================================================
// MARK: - UITableViewDataSource, UITableViewDelegate
//==================================================
extension SelectViewController {
    
    //MARK: UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        var cell = UITableViewCell()
        
        switch row {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "viewsCell", for: indexPath)
            cell.textLabel?.text = "Views"
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: "buttonsCell", for: indexPath)
            cell.textLabel?.text = "Buttons"
        default:
            return cell
        }
        return cell
    }
    
    //MARK: UITableViewDelegate
    
    //    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        tableView.deselectRow(at: indexPath, animated: true)
    //    }
}

