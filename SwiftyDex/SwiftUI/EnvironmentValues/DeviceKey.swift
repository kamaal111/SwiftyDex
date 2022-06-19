//
//  DeviceKey.swift
//  SwiftyDex
//
//  Created by Kamaal M Farah on 19/06/2022.
//

import SwiftUI

struct DeviceKey: EnvironmentKey {
    static let defaultValue: Devices = {
        #if canImport(UIKit)
        if UIDevice.current.userInterfaceIdiom == .pad {
            return .iPad
        }
        return .iPhone
        #else
        return .mac
        #endif
    }()
}

extension EnvironmentValues {
    var device: Devices {
        get { self[DeviceKey.self] }
        set { self[DeviceKey.self] = newValue }
    }
}

enum Devices: Hashable {
    case iPhone
    case iPad
    case mac
}
