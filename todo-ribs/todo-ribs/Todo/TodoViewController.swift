//
//  TodoViewController.swift
//  todo-ribs
//
//  Created by wooseok.suh on 2022/04/18.
//

import RIBs
import RxSwift
import UIKit

protocol TodoPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class TodoViewController: UIViewController, TodoPresentable, TodoViewControllable {

    weak var listener: TodoPresentableListener?
}
