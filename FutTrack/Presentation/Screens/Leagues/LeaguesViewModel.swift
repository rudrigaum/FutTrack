//
//  LeaguesViewModel.swift
//  FutTrack
//
//  Created by Rodrigo Cerqueira Reis on 24/04/26.
//

import Foundation
import Combine

@MainActor
final class LeaguesViewModel: ObservableObject {
    @Published private(set) var leagues: [League] = []
    @Published private(set) var isLoading = false

    private let getLeaguesUseCase: GetLeaguesUseCase

    init(getLeaguesUseCase: GetLeaguesUseCase) {
        self.getLeaguesUseCase = getLeaguesUseCase
    }

    func load() async {
        isLoading = true
        defer { isLoading = false }

        do {
            leagues = try await getLeaguesUseCase.execute()
        } catch {
            leagues = []
        }
    }
}
