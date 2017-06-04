//
//  ImageLabelHeaderView.swift
//  UserParameters
//
//  Created by NSSimpleApps on 04.06.17.
//  Copyright © 2017 NSSimpleApps. All rights reserved.
//

import UIKit
import SnapKit


open class ImageLabelHeaderView: UIView {
    
    private struct Constants {
        
        public static let imageSize = CGSize(width: 86, height: 86)
        public static let labelBottomInset: CGFloat = 16
        public static let imageLabelGap: CGFloat = 16
    }
    
    open let label = UILabel()
    open let imageView = UIImageView()
    
    public override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.imageView.contentMode = .scaleAspectFit
        
        self.addSubview(self.imageView)
        
        let imageViewContainer = self.imageView.snp
        imageViewContainer.makeConstraints { (maker) in
            
            maker.top.equalToSuperview()
            maker.centerX.equalToSuperview()
            maker.size.equalTo(Constants.imageSize)
        }
        
        self.label.numberOfLines = 2
        self.label.lineBreakMode = .byTruncatingTail
        self.label.textAlignment = .center
        self.label.font = UIFont.systemFont(ofSize: 15)
        
        self.addSubview(self.label)
        
        self.label.snp.makeConstraints { (maker) in
            
            maker.width.equalToSuperview().multipliedBy(CGFloat(375 - 68 - 68)/375)
            maker.centerX.equalToSuperview()
            
            maker.top.equalTo(imageViewContainer.bottom).offset(Constants.imageLabelGap)
            maker.bottom.equalToSuperview().inset(Constants.labelBottomInset)
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override var intrinsicContentSize: CGSize {
        
        let labelSize = self.label.sizeThatFits(CGSize(width: 100, height: 1000))
        
        var size = super.intrinsicContentSize
        size.height = Constants.imageSize.height + Constants.imageLabelGap + Constants.labelBottomInset + labelSize.height
        
        return size
    }
}
