//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Thiago Lovatine on 24/04/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
