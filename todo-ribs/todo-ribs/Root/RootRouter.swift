//
//  RootRouter.swift
//  todo-ribs
//
//  Created by wooseok.suh on 2022/03/21.
//

import RIBs

protocol RootInteractable: Interactable, TodoListener, ProgressListener, DoneListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    func setViewControllers(_ viewControllers: [ViewControllable])
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {
    
    private let todoBuildable: TodoBuildable
    private let progressBuildable: ProgressBuildable
    private let doneBuildable: DoneBuildable
    
    private var todoRouting: TodoRouting?
    private var progressRouting: ProgressRouting?
    private var doneRouting: DoneRouting?
    
   init(interactor: RootInteractable,
                  viewController: RootViewControllable,
                  todoBuildable: TodoBuildable,
                  progressBuildable: ProgressBuildable,
                  doneBuildable: DoneBuildable
    ) {
        self.todoBuildable = todoBuildable
        self.progressBuildable = progressBuildable
        self.doneBuildable = doneBuildable
       
        super.init(interactor: interactor, viewController: viewController)
       
        interactor.router = self
    }

    func attachTabs() {
        let todoRouting = todoBuildable.build(withListener: interactor)
        let progressRouting = progressBuildable.build(withListener: interactor)
        let doneRouting = doneBuildable.build(withListener: interactor)
        
        attachChild(todoRouting)
        attachChild(progressRouting)
        attachChild(doneRouting)
        
        let viewControllers = [
            todoRouting.viewControllable,
            progressRouting.viewControllable,
            doneRouting.viewControllable
        ]
        
        viewController.setViewControllers(viewControllers)
    }
}
