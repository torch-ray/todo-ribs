//
//  DoneViewController.swift
//  todo-ribs
//
//  Created by wooseok.suh on 2022/04/18.
//

import RIBs
import RxSwift
import UIKit

protocol DonePresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class DoneViewController: UIViewController, DonePresentable, DoneViewControllable {

    weak var listener: DonePresentableListener?

    init() {
        super.init(nibName: nil, bundle: nil)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    private func setupViews() {
        tabBarItem.title = "Done"
        tabBarItem.image = UIImage(systemName: "house")
    }
}
