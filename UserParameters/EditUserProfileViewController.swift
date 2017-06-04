//
//  EditUserProfileViewController.swift
//  UserParameters
//
//  Created by NSSimpleApps on 03.06.17.
//  Copyright © 2017 NSSimpleApps. All rights reserved.
//

import UIKit

open class EditUserProfileViewController: UITableViewController {
    
    open var viewModel: UserProfileProtocol!
    
    override open func viewDidLoad() {
        
        super.viewDidLoad()

        self.tableView.register(UserProfileCell.self, forCellReuseIdentifier: String(describing: UserProfileCell.self))
    }
    
    override open func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.viewModel.numberOfRows
    }
    
    override open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserProfileCell", for: indexPath) as! UserProfileCell
        cell.selectionStyle = .none
        
        self.viewModel.configureCell(cell, at: indexPath)
        
        return cell
    }
}
