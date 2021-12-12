//
//  ContentView.swift
//  Memorize
//
//  Created by Yuyan Li on 1/12/21.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚊", "✈️", "🚗", "🚁", "🚌", "🛴", "🚲", "🚖", "🚂", "🚀" , "🛸", "🛳", "🛶", "🚇", "🚡", "🚔", "🚚", "🚑", "🚒", "🚌", "🏎", "🦽"]
    @State var emojiCount = 4
    var body: some View {
        VStack{
            HStack {
                ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                    CardView(content: emoji)
                }
            }
            HStack {
                remove
                Spacer()
                add
            }
            .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
        }
        .padding(.horizontal)
    }
    
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            VStack{
                Image(systemName: "plus.circle")
            }
        }
    }
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
           VStack{
               Image(systemName: "minus.circle")
           }
        }
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = false
    var content: String
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20.0)
            if isFaceUp {
                shape
                    .stroke(lineWidth: 3)
                shape
                    .fill()
                    .foregroundColor(.white)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape
                    .fill()
            }
        }
        .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
