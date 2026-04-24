//
//  League.swift
//  FutTrack
//
//  Created by Rodrigo Cerqueira Reis on 24/04/26.
//

import Foundation

struct League: Equatable, Identifiable {
    let id: Int
    let name: String
    let country: String
    let logoURL: URL?
}
