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

public protocol ImageHeaderProtocol: class {
    
    var imageView: UIImageView { get }
    var backgroundColor: UIColor? { get set }
}

public protocol ImageLabelHeaderProtocol: ImageHeaderProtocol {
    
    var label: UILabel { get }
}

public protocol UserProfileProtocol {
    
    var numberOfRows: Int { get }
    func configureImageHeader(_ header: ImageHeaderProtocol)
    func configureImageLabelHeader(_ header: ImageLabelHeaderProtocol)
    func configureCell(_ cell: UserParameterProtocol, at indexPath: IndexPath)
}

extension UserProfileCell: UserParameterProtocol {}

public class UserProfileViewController: UIViewController {
    
    public let button = UIButton()
    public let editUserProfileViewController = EditUserProfileViewController(style: .grouped)
    
    override public func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.edgesForExtendedLayout = []
        
        self.button.setTitle("Выход", for: .normal)
        self.button.setTitleColor(UIColor.red, for: .normal)
        self.button.setTitleColor(UIColor.lightGray, for: .highlighted)
        
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
        
        self.addChild(self.editUserProfileViewController)
        self.editUserProfileViewController.didMove(toParent: self)
    }
    
    public func reloadData() {
        
        self.editUserProfileViewController.tableView.reloadData()
    }
}


