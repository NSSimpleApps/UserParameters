//
//  SubtitleTableViewController.swift
//  UserParameters
//
//  Created by NSSimpleApps on 17.06.17.
//  Copyright © 2017 NSSimpleApps. All rights reserved.
//

import UIKit

struct Pair {
    
    let top: String
    let bottom: String
}

class SubtitleTableViewController: UITableViewController {
    
    let pairs = [Pair(top: "Top", bottom: "Bottom"),
                 Pair(top: "Top Top", bottom: "Bottom Bottom Bottom Bottom Bottom Bottom Bottom"),
                 Pair(top: "Top Top Top", bottom: "Bottom Bottom Bottom Bottom Bottom Bottom Bottom Bottom Bottom Bottom Bottom Bottom Bottom Bottom Bottom")
    ]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.tableView.register(SubtitleTableViewCell.self, forCellReuseIdentifier: String(describing: SubtitleTableViewCell.self))
        self.tableView.estimatedRowHeight = 50
        self.tableView.rowHeight = UITableView.automaticDimension
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.pairs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let pair = self.pairs[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SubtitleTableViewCell.self), for: indexPath) as! SubtitleTableViewCell
        cell.topLabel.text = pair.top
        cell.bottomLabel.text = pair.bottom
        
        return cell
    }    
}
