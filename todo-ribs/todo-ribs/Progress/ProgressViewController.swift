//
//  ProgressViewController.swift
//  todo-ribs
//
//  Created by wooseok.suh on 2022/04/18.
//

import RIBs
import RxSwift
import UIKit

protocol ProgressPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class ProgressViewController: UIViewController, ProgressPresentable, ProgressViewControllable {

    weak var listener: ProgressPresentableListener?
}
