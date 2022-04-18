//
//  DoneBuilder.swift
//  todo-ribs
//
//  Created by wooseok.suh on 2022/04/18.
//

import RIBs

protocol DoneDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class DoneComponent: Component<DoneDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol DoneBuildable: Buildable {
    func build(withListener listener: DoneListener) -> DoneRouting
}

final class DoneBuilder: Builder<DoneDependency>, DoneBuildable {

    override init(dependency: DoneDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: DoneListener) -> DoneRouting {
        let component = DoneComponent(dependency: dependency)
        let viewController = DoneViewController()
        let interactor = DoneInteractor(presenter: viewController)
        interactor.listener = listener
        return DoneRouter(interactor: interactor, viewController: viewController)
    }
}
