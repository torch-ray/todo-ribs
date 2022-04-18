//
//  ProgressRouter.swift
//  todo-ribs
//
//  Created by wooseok.suh on 2022/04/18.
//

import RIBs

protocol ProgressInteractable: Interactable {
    var router: ProgressRouting? { get set }
    var listener: ProgressListener? { get set }
}

protocol ProgressViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class ProgressRouter: ViewableRouter<ProgressInteractable, ProgressViewControllable>, ProgressRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: ProgressInteractable, viewController: ProgressViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
