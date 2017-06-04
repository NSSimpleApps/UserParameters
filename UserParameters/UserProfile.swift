//
//  UserProfile.swift
//  UserParameters
//
//  Created by NSSimpleApps on 02.06.17.
//  Copyright © 2017 NSSimpleApps. All rights reserved.
//

import Foundation


open class UserProfile {
    
    public struct Header {
        
        public var title: String
        public let url: String
    }
    
    public struct Parameter {
        
        public let name: String
        public var value: String
    }
    
    public var header: Header
    public var parameters: [Parameter]
    
    public init(header: Header, parameters: [Parameter]) {
        
        self.header = header
        self.parameters = parameters
    }
}
