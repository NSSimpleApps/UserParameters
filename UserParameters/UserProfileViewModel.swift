//
//  UserProfileViewModel.swift
//  UserParameters
//
//  Created by NSSimpleApps on 03.06.17.
//  Copyright © 2017 NSSimpleApps. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage


open class UserProfileViewModel {
    
    open let userProfile: UserProfile
    fileprivate let textFieldHandler = TextFieldHandler()
    
    public init(userProfile: UserProfile) {
        
        self.userProfile = userProfile
        
        self.textFieldHandler.textFieldChangedBlock = { [weak self] textField in
            
            self?.userProfile.parameters[textField.tag].value = textField.text ?? ""
        }
    }
    
    open var canEdit: Bool {
        
        get {
            
            return self.textFieldHandler.canEdit
        }
        
        set {
            
            self.textFieldHandler.canEdit = newValue
        }
    }
}

extension UserProfileViewModel: UserProfileProtocol {
    
    public func configureImageLabelHeader(_ header: ImageLabelHeaderProtocol) {
        
        header.backgroundColor = UIColor.green
        header.label.text = self.userProfile.header.title
        
        self.setImage(from: self.userProfile.header.url,
                      imageView: header.imageView)
    }

    public func configureImageHeader(_ header: ImageHeaderProtocol) {
        
        header.backgroundColor = UIColor.green
        
        self.setImage(from: self.userProfile.header.url,
                      imageView: header.imageView)
    }
    
    private func setImage(from url: String, imageView: UIImageView) {
        
        Alamofire.request(self.userProfile.header.url).responseImage { response in
            
            if let image = response.result.value {
                
                imageView.image = image
            }
        }
    }
    
    public var numberOfRows: Int {
        
        return self.userProfile.parameters.count
    }
    
    public func configureCell(_ cell: UserParameterProtocol, at indexPath: IndexPath) {
        
        let parameter = self.userProfile.parameters[indexPath.row]
        
        cell.label.text = parameter.name
        
        cell.textField.text = parameter.value
        cell.textField.tag = indexPath.row
        
        self.textFieldHandler.configureTextField(cell.textField)
    }
}

