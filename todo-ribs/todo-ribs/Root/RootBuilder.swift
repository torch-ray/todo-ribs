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

final class RootComponent: Component<RootDependency>, TodoDependency, ProgressDependency, DoneDependency {
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
        let component = RootComponent(dependency: dependency)
        let viewController = RootTabBarController()
        let interactor = RootInteractor(presenter: viewController)
        
        let todoBuilder = TodoBuilder(dependency: component)
        let progressBuilder = ProgressBuilder(dependency: component)
        let doneBuilder = DoneBuilder(dependency: component)
        
        return RootRouter(interactor: interactor,
                          viewController: viewController,
                          todoBuildable: todoBuilder,
                          progressBuildable: progressBuilder,
                          doneBuildable: doneBuilder)
    }
}
