//
//  TextFieldHandler.swift
//  UserParameters
//
//  Created by NSSimpleApps on 04.06.17.
//  Copyright © 2017 NSSimpleApps. All rights reserved.
//

import UIKit

public class TextFieldHandler: NSObject {
    
    public var canEdit = false
    public var textFieldChangedBlock: ((UITextField) -> Void)?
    
    @objc public func textFieldChanged(_ sender: UITextField) {
        
        self.textFieldChangedBlock?(sender)
    }
    
    public func configureTextField(_ textField: UITextField) {
        
        textField.delegate = self
        textField.removeTarget(nil, action: nil, for: .allEvents)
        textField.addTarget(self,
                            action: #selector(self.textFieldChanged(_:)),
                            for: .editingChanged)
    }
}

extension TextFieldHandler: UITextFieldDelegate {
    
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        return self.canEdit
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
}

