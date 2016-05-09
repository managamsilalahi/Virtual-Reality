//
//  VirtualRealityTabBarController.swift
//  Virtual Reality
//
//  Created by Admin on 5/9/16.
//  Copyright © 2016 Morra. All rights reserved.
//

import UIKit

class VirtualRealityTabBarController: UITabBarController {
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewWillLayoutSubviews() {
        
        var tabFrame: CGRect = self.tabBar.frame
        tabFrame.size.height = 70
        tabFrame.origin.y = self.view.frame.size.height - 60
        self.tabBar.frame = tabFrame
        
    }

}
