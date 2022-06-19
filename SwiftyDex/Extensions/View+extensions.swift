//
//  View+extensions.swift
//  SwiftyDex
//
//  Created by Kamaal M Farah on 19/06/2022.
//

import SwiftUI

extension View {
    func padding(_ edges: Edge.Set = .all, _ length: AppSizes) -> some View {
        padding(edges, length.rawValue)
    }

    func cornerRadius(_ radius: AppSizes) -> some View {
        cornerRadius(radius.rawValue)
    }
}
