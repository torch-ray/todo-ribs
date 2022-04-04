//
//  RootBuilder.swift
//  todo-ribs
//
//  Created by wooseok.suh on 2022/03/21.
//

import RIBs

protocol RootDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class RootComponent: Component<RootDependency>, MainDependency {
    var mainViewController: ViewControllable

    init(mainViewController: ViewControllable, dependency: RootDependency) {
        self.mainViewController = mainViewController
        super.init(dependency: dependency)
    }
    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol RootBuildable: Buildable {
    func build() -> LaunchRouting
}

final class RootBuilder: Builder<RootDependency>, RootBuildable {

    override init(dependency: RootDependency) {
        super.init(dependency: dependency)
    }

    func build() -> LaunchRouting {
        let viewController = RootViewController()
        let component = RootComponent(mainViewController: viewController, dependency: dependency)
        let interactor = RootInteractor(presenter: viewController)
        let mainBuilder = MainBuilder(dependency: component)
        return RootRouter(interactor: interactor,
                          viewController: viewController,
                          mainBuildable: mainBuilder)
    }
}

// Root에서 Listener가 필요없는 이유?
