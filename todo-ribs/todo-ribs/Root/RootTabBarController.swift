//
//  RootViewController.swift
//  todo-ribs
//
//  Created by wooseok.suh on 2022/03/21.
//

import RIBs
import UIKit

protocol RootPresentableListener: AnyObject {
}

final class RootTabBarController: UITabBarController, RootPresentable, RootViewControllable {

    weak var listener: RootPresentableListener?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.isTranslucent = false
        tabBar.tintColor = .black
        tabBar.backgroundColor = .white
    }

    func setViewControllers(_ viewControllers: [ViewControllable]) {
        super.setViewControllers(viewControllers.map(\.uiviewController), animated: false)
    }
}
