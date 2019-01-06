//
//  TopViewController.swift
//  TabBarSample
//
//  Created by subta90 on 2019/01/06.
//  Copyright © 2019 subta90. All rights reserved.
//

import UIKit

private enum ButtonType: Int {
    case Three = 0
    case Five = 1
}

class TopViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let pushedButton = sender as? UIButton else {
            return
        }
        
        guard let pushedButtonType = ButtonType(rawValue: pushedButton.tag) else {
            return
        }
        
        let destination = segue.destination as? MainTabBarViewController
        
        switch pushedButtonType {
        case .Three:
            destination?.segueType = .Three
        case .Five:
            destination?.segueType = .Five
        }
    }
    
    
}

