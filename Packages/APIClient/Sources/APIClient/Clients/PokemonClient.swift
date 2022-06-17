//
//  PokemonClient.swift
//  
//
//  Created by Kamaal Farah on 17/06/2022.
//

import Foundation
import ClientKit
import XiphiasNet

public struct PokemonClient: ClientKit {
    public let networker: XiphiasNet

    init(networker: XiphiasNet) {
        self.networker = networker
    }
}

extension Endpoint { }
