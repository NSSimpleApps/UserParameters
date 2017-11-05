//
//  EditUserProfileViewController.swift
//  UserParameters
//
//  Created by NSSimpleApps on 03.06.17.
//  Copyright © 2017 NSSimpleApps. All rights reserved.
//

import UIKit
import SnapKit

extension ImageHeaderView: ImageHeaderProtocol {}
extension ImageLabelHeaderView: ImageLabelHeaderProtocol {}

open class EditUserProfileViewController: UITableViewController {
    
    public enum HeaderType {
        
        case none
        case imageLabel
        case image
    }
    
    open var viewModel: UserProfileProtocol!
    open var headerType: HeaderType = .none
    
    override open func viewDidLoad() {
        
        super.viewDidLoad()
        
        let v = UIView()
        v.backgroundColor = .red
        
        self.tableView.addSubview(v)
        self.tableView.rowHeight = 44
        
        v.snp.makeConstraints { (maker) in
            
            maker.bottom.equalTo(self.tableView.snp.top)
            maker.centerX.equalToSuperview()
            maker.width.equalToSuperview()
            maker.height.equalTo(10000)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { 
            
            print(v.frame)
        }
        
        self.tableView.backgroundColor = .white
        self.tableView.register(UserProfileCell.self, forCellReuseIdentifier: String(describing: UserProfileCell.self))
        
        let tableHeaderView: UIView?
        
        switch self.headerType {
        
        case .imageLabel:
            let imageLabelHeaderView = ImageLabelHeaderView()
            self.viewModel.configureImageLabelHeader(imageLabelHeaderView)
            imageLabelHeaderView.frame.size = imageLabelHeaderView.intrinsicContentSize
            
            tableHeaderView = imageLabelHeaderView
            
        case .image:
            let imageHeaderView = ImageHeaderView()
            self.viewModel.configureImageHeader(imageHeaderView)
            imageHeaderView.frame.size = imageHeaderView.intrinsicContentSize
            
            tableHeaderView = imageHeaderView
            
        default:
            tableHeaderView = nil
        }
        
        self.tableView.tableHeaderView = tableHeaderView
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
