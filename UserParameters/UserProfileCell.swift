//
//  UserProfileCell.swift
//  UserParameters
//
//  Created by NSSimpleApps on 02.06.17.
//  Copyright © 2017 NSSimpleApps. All rights reserved.
//

import UIKit
import SnapKit

open class UserProfileCell: UITableViewCell {
    
    open let label = UILabel()
    open let textField = UITextField()
    
    public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        let contentViewContainer = self.contentView.snp
        let gap: CGFloat = 8
        let inset = self.layoutMargins.left + self.contentView.layoutMargins.left + gap
        
        self.contentView.addSubview(self.label)
        
        let labelContainer = self.label.snp
        labelContainer.makeConstraints { (maker) in
            
            maker.left.equalTo(contentViewContainer.leftMargin)
            maker.centerY.equalToSuperview()
            maker.width.equalTo(contentViewContainer.width).multipliedBy(CGFloat(150 - inset)/375)
        }
        
        self.contentView.addSubview(self.textField)
        
        self.textField.borderStyle = .none
        self.textField.snp.makeConstraints { (maker) in
            
            maker.right.equalTo(contentViewContainer.rightMargin)
            maker.top.equalToSuperview()
            maker.bottom.equalToSuperview()
            maker.left.equalTo(labelContainer.right).offset(gap)
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
