//
//  GetLeaguesUseCase.swift
//  FutTrack
//
//  Created by Rodrigo Cerqueira Reis on 24/04/26.
//

import Foundation

import Foundation

protocol GetLeaguesUseCase {
    func execute() async throws -> [League]
}

struct DefaultGetLeaguesUseCase: GetLeaguesUseCase {
    private let repository: LeaguesRepository

    init(repository: LeaguesRepository) {
        self.repository = repository
    }

    func execute() async throws -> [League] {
        try await repository.fetchLeagues()
    }
}
