//
//  Text+extensions.swift
//  SwiftyDex
//
//  Created by Kamaal M Farah on 20/06/2022.
//

import SwiftUI

extension Text {
    func bold(_ active: Bool) -> Text {
        if !active {
            return self
        }

        return bold()
    }

    static func empty() -> Text {
        self.init("")
    }
}
