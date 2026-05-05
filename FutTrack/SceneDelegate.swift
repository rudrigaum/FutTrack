//
//  SceneDelegate.swift
//  FutTrack
//
//  Created by Rodrigo Cerqueira Reis on 09/04/26.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    private var appCoordinator: AppCoordinator?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else { return }

        let navigationController = UINavigationController()
        let appContainer = AppContainer()
        let appCoordinator = AppCoordinator(
            navigationController: navigationController,
            appContainer: appContainer
        )

        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        self.window = window
        self.appCoordinator = appCoordinator

        appCoordinator.start()
    }
}
