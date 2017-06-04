//
//  ImageHeaderView.swift
//  UserParameters
//
//  Created by NSSimpleApps on 04.06.17.
//  Copyright © 2017 NSSimpleApps. All rights reserved.
//

import UIKit

open class ImageHeaderView: UIView {
    
    private struct Constants {
        
        public static let imageSize = CGSize(width: 86, height: 86)
        public static let imageBottomInset: CGFloat = 16
    }
    
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
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override var intrinsicContentSize: CGSize {
        
        var size = super.intrinsicContentSize
        size.height = Constants.imageSize.height + Constants.imageBottomInset
        
        return size
    }
}
