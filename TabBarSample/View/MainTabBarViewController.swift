//
//  MainTabBarViewController.swift
//  TabBarSample
//
//  Created by subta90 on 2019/01/06.
//  Copyright © 2019 subta90. All rights reserved.
//

import UIKit

internal enum TabBarCountType {
    case Three
    case Five
}

private enum TabBarItemTag: Int {
    case First = 0
    case Second = 1
    case Third = 2
    case Fourth = 3
    case Fifth = 4
}

class MainTabBarViewController: UIViewController {
    
    var segueType: TabBarCountType = .Three
    
    private var currentChildViewController: UIViewController?
    
    @IBOutlet weak var variableTabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        variableTabBar.delegate = self
        
        if segueType == .Five {
            let fourthTabBarItem = UITabBarItem(title: "fourth", image: nil, selectedImage: nil)
            fourthTabBarItem.tag = TabBarItemTag.Fourth.rawValue
            variableTabBar.items?.append(fourthTabBarItem)
            
            let fifthTabBarItem = UITabBarItem(title: "five", image: nil, selectedImage: nil)
            fifthTabBarItem.tag = TabBarItemTag.Fifth.rawValue
            variableTabBar.items?.append(fifthTabBarItem)
        }
    }
}

extension MainTabBarViewController: UITabBarDelegate {
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let itemTag = TabBarItemTag(rawValue: item.tag) else {
            return
        }
        
        let destinationViewController = createDestinationViewController(from: itemTag)
        
        cycleFromViewController(newChildViewController: destinationViewController)
    }
    
    private func createDestinationViewController(from itemTag: TabBarItemTag) -> UIViewController {
        
        switch itemTag {
        case TabBarItemTag.First:
            return FirstViewController()
        case TabBarItemTag.Second:
            return SecondViewController()
        case TabBarItemTag.Third:
            return ThirdViewController()
        case TabBarItemTag.Fourth:
            return FourthViewController()
        case TabBarItemTag.Fifth:
            return FifthViewController()
        }
    }
    
    private func cycleFromViewController(newChildViewController: UIViewController) {
        currentChildViewController?.willMove(toParent: nil)
        
        self.addChild(newChildViewController)
        self.view.addSubview(newChildViewController.view)
        newChildViewController.didMove(toParent: self)
        
        currentChildViewController = newChildViewController
    }
}
