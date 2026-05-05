//
//  LeaguesCoordinator.swift
//  FutTrack
//
//  Created by Rodrigo Cerqueira Reis on 24/04/26.
//

import Foundation
import UIKit

final class LeaguesCoordinator: Coordinator {
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
        let viewModel = appContainer.makeLeaguesViewModel()
        let viewController = LeaguesViewController(viewModel: viewModel)
        navigationController.setViewControllers([viewController], animated: false)
    }
}
