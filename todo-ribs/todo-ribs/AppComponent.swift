//
//  AppComponent.swift
//  todo-ribs
//
//  Created by wooseok.suh on 2022/03/21.
//

import Foundation
import RIBs

final class AppComponent: Component<EmptyDependency>, RootDependency {
    
    init() {
        super.init(dependency: EmptyComponent())
    }
}
