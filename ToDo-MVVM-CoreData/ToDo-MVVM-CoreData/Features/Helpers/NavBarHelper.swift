//
//  NavBarHelper.swift
//  ToDo-MVVM-CoreData
//
//  Created by Arslan Kaan AYDIN on 30.04.2022.
//

import Foundation
import UIKit

class NavBarHelper {
    static func changeNavBarAppearance() {
        let barButtonItemAppearance = UIBarButtonItem.appearance()
        barButtonItemAppearance.setBackButtonBackgroundImage(UIImage(systemName: "list.bullet.indent"), for: .normal, barMetrics: .default)
        
        let navAppearance = UINavigationBar.appearance()
        
        let emptyImage = UIImage()
        navAppearance.backIndicatorImage = emptyImage
        navAppearance.backIndicatorTransitionMaskImage = emptyImage
        
    }
}
