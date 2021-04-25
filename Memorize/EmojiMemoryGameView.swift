//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Thiago Lovatine on 24/04/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View{
        HStack(){
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture(perform: {
                    self.viewModel.chooseCard(card: card)
                })
            }
        }
        .foregroundColor(Color.orange)
        .font(Font.largeTitle)
        .padding()
    }
}

struct CardView : View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack() {
                if(self.card.isFaceUp){
                    RoundedRectangle(cornerRadius: self.cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: self.cornerRadius).stroke(lineWidth: edgeLineWith)
                    Text(self.card.content)
                } else {
                    RoundedRectangle(cornerRadius: self.cornerRadius).fill()
                }
            }.font(Font.system(size: self.fontSize(size: geometry.size)))
        })
    }
            
    
    // MARK: Drawing Constants
    
    let cornerRadius : CGFloat = 10.0
    let edgeLineWith: CGFloat = 3
    let fontScaleFactor : CGFloat = 0.75
    
    func fontSize(size: CGSize) -> CGFloat{
        min(size.width, size.height) * self.fontScaleFactor
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
