//
//  AppDelegate.swift
//  UserParameters
//
//  Created by NSSimpleApps on 02.06.17.
//  Copyright © 2017 NSSimpleApps. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func embedInNavigationController() -> UINavigationController {
        
        let nc = UINavigationController(rootViewController: self)
        nc.navigationBar.isTranslucent = false
        
        return nc
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var userProfile: UserProfile!
    var userProfileViewModel: UserProfileViewModel!
    
    let userProfileViewController = UserProfileViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let header =
            UserProfile.Header(title: "Константин Константиновский-Дмитриев",
                               url: "http://smalldata.io/startup/common-files/icons/sdl_logo.png")
        
        let parameters = [UserProfile.Parameter(name: "Фамилия", value: "Константиновский-Дмитриев"),
                          UserProfile.Parameter(name: "Имя", value: "Константин"),
                          UserProfile.Parameter(name: "Должность", value: "Работник"),
                          UserProfile.Parameter(name: "E-mail", value: "mail@gmail.com")
        ]
        
        self.userProfile = UserProfile(header: header, parameters: parameters)
        self.userProfileViewModel = UserProfileViewModel(userProfile: self.userProfile)
        
        self.userProfileViewController.editUserProfileViewController.headerType = .imageLabel
        self.userProfileViewController.editUserProfileViewController.viewModel = self.userProfileViewModel
        self.userProfileViewController.navigationItem.leftBarButtonItem =
            UIBarButtonItem(title: "Изменить", style: .plain, target: self, action: #selector(self.editUserProfile(_:)))
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = self.userProfileViewController.embedInNavigationController()
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    @objc func editUserProfile(_ sender: UIBarButtonItem) {
        
        self.userProfileViewModel.canEdit = true
        
        let editUserProfileViewController = EditUserProfileViewController(style: .grouped)
        editUserProfileViewController.headerType = .image
        editUserProfileViewController.viewModel = self.userProfileViewModel
        editUserProfileViewController.navigationItem.rightBarButtonItem =
            UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.saveUserProfile(_:)))
        
        let nc = editUserProfileViewController.embedInNavigationController()
        
        self.window?.rootViewController?.present(nc, animated: true, completion: nil)
    }
    
    @objc func saveUserProfile(_ sender: UIBarButtonItem) {
        
        self.userProfileViewController.dismiss(animated: true) {
            
            self.userProfileViewModel.canEdit = false
            self.userProfileViewController.reloadData()
        }        
    }
}

