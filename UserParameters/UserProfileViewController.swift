//
//  UserProfileViewController.swift
//  UserParameters
//
//  Created by NSSimpleApps on 02.06.17.
//  Copyright © 2017 NSSimpleApps. All rights reserved.
//

import UIKit
import SnapKit

public protocol UserParameterProtocol {
    
    var label: UILabel { get }
    var textField: UITextField { get }
}

public protocol UserHeaderProtocol {
    
    var label: UILabel { get }
    var imageView: UIImageView { get }
    var backgroundColor: UIColor? { get set }
}

public protocol UserProfileProtocol {
    
    var numberOfRows: Int { get }
    func configureHeader(_ header: UserHeaderProtocol)
    func configureCell(_ cell: UserParameterProtocol, at indexPath: IndexPath)
}

extension UserProfileCell: UserParameterProtocol {}

open class UserProfileViewController: UIViewController {
    
    open let button = UIButton()
    open let editUserProfileViewController = EditUserProfileViewController(style: .grouped)
    
    override open func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.edgesForExtendedLayout = []
        
        self.view.addSubview(self.button)
        
        let buttonContainer = self.button.snp
        buttonContainer.makeConstraints { (maker) in
            
            maker.width.equalToSuperview()
            maker.bottom.equalTo(self.bottomLayoutGuide.snp.top)
            maker.height.equalToSuperview().multipliedBy(CGFloat(59.5)/667)
        }
        
        let separator = UIView()
        separator.backgroundColor = .black
        
        self.view.addSubview(separator)
        
        let separatorContainer = separator.snp
        separatorContainer.makeConstraints { (maker) in
            
            maker.height.equalTo(0.5)
            maker.width.equalToSuperview()
            maker.bottom.equalTo(buttonContainer.top)
        }
        
        self.view.addSubview(self.editUserProfileViewController.view)
        
        self.editUserProfileViewController.view.snp.makeConstraints { (maker) in
            
            maker.top.equalTo(self.topLayoutGuide.snp.bottom)
            maker.width.equalToSuperview()
            maker.bottom.equalTo(separatorContainer.top)
        }
        
        self.addChildViewController(self.editUserProfileViewController)
        self.editUserProfileViewController.didMove(toParentViewController: self)
    }
    
    open func reloadData() {
        
        self.editUserProfileViewController.tableView.reloadData()
    }
}


