//
//  RootRouter.swift
//  todo-ribs
//
//  Created by wooseok.suh on 2022/03/21.
//

import RIBs

protocol RootInteractable: Interactable, MainListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {

    let mainBuildable: MainBuildable
    var mainRouting: Routing?

    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: RootInteractable,
                  viewController: RootViewControllable,
                  mainBuildable: MainBuildable) {
        self.mainBuildable = mainBuildable
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }

    func attachMain() {
        guard mainRouting == nil else {
            return
        }
        let router = mainBuildable.build(withListener: interactor)
        mainRouting = router
        attachChild(router)
    }

    func detachMain() {
        guard let router = mainRouting else {
            return
        }
        detachChild(router)
        self.mainRouting = nil
    }
}
