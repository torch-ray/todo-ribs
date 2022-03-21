//
//  SceneDelegate.swift
//  todo-ribs
//
//  Created by wooseok.suh on 2022/03/14.
//

import UIKit
import RIBs

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var router: LaunchRouting?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        let router = RootBuilder(dependency: AppComponent()).build()
        router.launch(from: window)
        
        self.window = window
        self.router = router
    }
    
    /*
     router를 변수로 안들고 있으면 앱 죽음
     Thread 1: Assertion failed: <<todo_ribs.RootViewController: 0x7ff411904b60>: 3295809679965133574> has leaked. Objects are expected to be deallocated at this time
     */
}

