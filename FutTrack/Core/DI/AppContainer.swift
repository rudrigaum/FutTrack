//
//  AppContainer.swift
//  FutTrack
//
//  Created by Rodrigo Cerqueira Reis on 24/04/26.
//

import Foundation

final class AppContainer {
    lazy var leaguesRepository: LeaguesRepository = LeaguesRepositoryImpl()

    lazy var getLeaguesUseCase: GetLeaguesUseCase = DefaultGetLeaguesUseCase(
        repository: leaguesRepository
    )

    @MainActor
    func makeLeaguesViewModel() -> LeaguesViewModel {
        LeaguesViewModel(getLeaguesUseCase: getLeaguesUseCase)
    }
}
