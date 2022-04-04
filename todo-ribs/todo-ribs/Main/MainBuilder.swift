//
//  MainBuilder.swift
//  todo-ribs
//
//  Created by 박수빈 on 2022/04/04.
//

import RIBs

protocol MainDependency: Dependency {
    // TODO: Make sure to convert the variable into lower-camelcase.
    var mainViewController: ViewControllable { get }
    // TODO: Declare the set of dependencies required by this RIB, but won't be
    // created by this RIB.
}

final class MainComponent: Component<MainDependency> {

    // TODO: Make sure to convert the variable into lower-camelcase.
    fileprivate var mainViewController: ViewControllable {
        return dependency.mainViewController
    }

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol MainBuildable: Buildable {
    func build(withListener listener: MainListener) -> MainRouting
}

final class MainBuilder: Builder<MainDependency>, MainBuildable {

    override init(dependency: MainDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: MainListener) -> MainRouting {
        let component = MainComponent(dependency: dependency)
        let interactor = MainInteractor()
        interactor.listener = listener
        return MainRouter(interactor: interactor, viewController: component.mainViewController)
    }
}
