//
//  UserProfileViewModel.swift
//  UserParameters
//
//  Created by NSSimpleApps on 03.06.17.
//  Copyright © 2017 NSSimpleApps. All rights reserved.
//

import UIKit


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
    
    public var numberOfRows: Int {
        
        return self.userProfile.parameters.count
    }
    
    public func configureHeader(_ header: UserHeaderProtocol) {
        
        
    }
    
    public func configureCell(_ cell: UserParameterProtocol, at indexPath: IndexPath) {
        
        let parameter = self.userProfile.parameters[indexPath.row]
        
        cell.label.text = parameter.name
        
        cell.textField.text = parameter.value
        cell.textField.tag = indexPath.row
        
        self.textFieldHandler.configureTextField(cell.textField)
    }
}

