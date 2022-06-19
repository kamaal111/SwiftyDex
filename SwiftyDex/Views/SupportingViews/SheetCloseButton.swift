//
//  SheetCloseButton.swift
//  SwiftyDex
//
//  Created by Kamaal M Farah on 19/06/2022.
//

import SwiftUI

struct SheetCloseButton: View {
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text("Close")
                .bold()
                .foregroundColor(.accentColor)
        }
        .buttonStyle(.plain)
    }
}

struct SheetCloseButton_Previews: PreviewProvider {
    static var previews: some View {
        SheetCloseButton(action: { })
    }
}
