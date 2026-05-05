//
//  AppCoordinator.swift
//  FutTrack
//
//  Created by Rodrigo Cerqueira Reis on 24/04/26.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get }
    func start()
}

final class AppCoordinator: Coordinator {
    let navigationController: UINavigationController
    private let appContainer: AppContainer

    init(
        navigationController: UINavigationController,
        appContainer: AppContainer
    ) {
        self.navigationController = navigationController
        self.appContainer = appContainer
    }

    func start() {
        let leaguesCoordinator = LeaguesCoordinator(
            navigationController: navigationController,
            appContainer: appContainer
        )
        leaguesCoordinator.start()
    }
}
