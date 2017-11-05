//
//  SubtitleTableViewCell.swift
//  UserParameters
//
//  Created by NSSimpleApps on 17.06.17.
//  Copyright © 2017 NSSimpleApps. All rights reserved.
//

import UIKit
import SnapKit

class SubtitleTableViewCell: UITableViewCell {
    
    let topLabel = UILabel()
    let bottomLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        let contentViewContainter = self.contentView.snp
        self.contentView.preservesSuperviewLayoutMargins = true
        
        self.topLabel.font = UIFont.systemFont(ofSize: 12)
        self.topLabel.textColor = UIColor.lightGray
        self.topLabel.setContentHuggingPriority(UILayoutPriority(UILayoutPriority.defaultLow.rawValue + 1), for: .vertical)
        
        self.contentView.addSubview(self.topLabel)
        
        let topLabelContainter = self.topLabel.snp
        topLabelContainter.makeConstraints { (maker) in
            
            maker.left.equalTo(contentViewContainter.leftMargin)
            maker.top.equalTo(contentViewContainter.topMargin)
            maker.right.equalTo(contentViewContainter.rightMargin)
        }
        
        self.bottomLabel.numberOfLines = 3
        self.bottomLabel.lineBreakMode = .byTruncatingTail
        self.bottomLabel.font = UIFont.systemFont(ofSize: 15)
        self.bottomLabel.textColor = UIColor.darkGray
        self.bottomLabel.setContentHuggingPriority(UILayoutPriority(UILayoutPriority.defaultLow.rawValue + 1), for: .vertical)
        
        self.contentView.addSubview(self.bottomLabel)
        
        self.bottomLabel.snp.makeConstraints { (maker) in
            
            maker.top.equalTo(topLabelContainter.bottom).offset(8)
            maker.left.equalTo(contentViewContainter.leftMargin)
            maker.right.equalTo(contentViewContainter.rightMargin)
            maker.bottom.equalTo(contentViewContainter.bottomMargin)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
