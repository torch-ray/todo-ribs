//
//  DoneRouter.swift
//  todo-ribs
//
//  Created by wooseok.suh on 2022/04/18.
//

import RIBs

protocol DoneInteractable: Interactable {
    var router: DoneRouting? { get set }
    var listener: DoneListener? { get set }
}

protocol DoneViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class DoneRouter: ViewableRouter<DoneInteractable, DoneViewControllable>, DoneRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: DoneInteractable, viewController: DoneViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
