//
//  PokemonDetailsSheet.swift
//  SwiftyDex
//
//  Created by Kamaal M Farah on 12/06/2022.
//

import SwiftUI
import SalmonUI
import APIModels

struct PokemonDetailsSheet: View {
    @Environment(\.device) private var device

    @StateObject private var viewModel = ViewModel()

    @Binding var headerSize: CGSize

    let pokemon: Pokemon
    let close: () -> Void

    var body: some View {
        ZStack {
            if device == .mac {
                KSheetStack(
                    leadingNavigationButton: { Text.empty() },
                    trailingNavigationButton: { SheetCloseButton(action: close) }
                ) {
                    mainView
                }
            } else {
                mainView
            }
        }
        .kBindToFrameSize($viewModel.frameSize)
    }

    private var mainView: some View {
        VStack {
            header
                .kBindToFrameSize($headerSize)
            tabs
            activeTab
                .padding(.vertical, .extraExtraSmall)
        }
        .padding(.top, .medium)
        .ktakeSizeEagerly(alignment: .top)
    }

    private var header: some View {
        VStack(spacing: 0) {
            HStack(spacing: 2) {
                Text(pokemon.formattedPokedexNumber)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .bold()
                Text(pokemon.name.capitalized)
                    .font(.headline)
            }
            PokemonProfileImage(pokemon: pokemon, size: viewModel.profileImageSize, withBorder: false)
            HStack {
                ForEach(pokemon.pokemonTypes, id: \.self) { type in
                    PokemonTypeView(type: type)
                }
            }
        }
    }

    private var tabs: some View {
        HStack {
            ForEach(viewModel.tabs, id: \.self) { tab in
                Button(action: { Task { await viewModel.selectTab(tab) } }) {
                    Text(tab.title)
                        .bold(viewModel.isActiveTab(tab))
                        .foregroundColor(.accentColor)
                        .underline(viewModel.isActiveTab(tab))
                }
                .buttonStyle(.plain)
            }
        }
    }

    private var activeTab: some View {
        switch viewModel.activeTab {
        case .about: return PokemonDetailsAboutTab(pokemon: pokemon)
        }
    }
}

extension PokemonDetailsSheet {
    final class ViewModel: ObservableObject {
        @Published var frameSize: CGSize = .zero
        @Published private(set) var activeTab: Tabs = .about

        enum Tabs: CaseIterable {
            case about

            var title: String {
                switch self {
                case .about: return "About"
                }
            }
        }

        var tabs: [Tabs] {
            Tabs.allCases
        }

        var profileImageSize: CGFloat {
            if frameSize.width > frameSize.height {
                return frameSize.height / 3
            }
            return frameSize.width / 3
        }

        func selectTab(_ tab: Tabs) async {
            guard !isActiveTab(tab) else { return }
            await setActiveTab(tab)
        }

        func isActiveTab(_ tab: Tabs) -> Bool {
            tab == activeTab
        }

        @MainActor
        private func setActiveTab(_ tab: Tabs) {
            activeTab = tab
        }
    }
}

#if DEBUG
import ShrimpExtensions

struct PokemonDetailsSheet_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailsSheet(
            headerSize: .constant(.squared(300)),
            pokemon: Mocker.pokemons.find(by: \.pokedexNumber, is: 6)!,
            close: { }
        )
    }
}
#endif
