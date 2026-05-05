//
//  LeaguesRepository..swift
//  FutTrack
//
//  Created by Rodrigo Cerqueira Reis on 24/04/26.
//

import Foundation

protocol LeaguesRepository {
    func fetchLeagues() async throws -> [League]
}
