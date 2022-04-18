//
//  ProgressInteractor.swift
//  todo-ribs
//
//  Created by wooseok.suh on 2022/04/18.
//

import RIBs
import RxSwift

protocol ProgressRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol ProgressPresentable: Presentable {
    var listener: ProgressPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol ProgressListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class ProgressInteractor: PresentableInteractor<ProgressPresentable>, ProgressInteractable, ProgressPresentableListener {

    weak var router: ProgressRouting?
    weak var listener: ProgressListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: ProgressPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}
