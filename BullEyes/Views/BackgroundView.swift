//
//  BackgroundView.swift
//  BullEyes
//
//  Created by Khanh Thieu on 28/06/2021.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack{
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(
            RingsView()
        )
        
    }
}
struct TopView: View{
    @Binding var game: Game
    @State private var leaderboardIsShowing: Bool = false
    var body: some View{
        HStack{
            Button(action:{
                game.restart()
            }){
                RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            }
            
            Spacer()
            Button(action:{
                leaderboardIsShowing = true
            }){
                RoundedImageViewFilled(systemName: "list.dash")}.sheet(isPresented: $leaderboardIsShowing, onDismiss: {}, content: {
                    LeaderBoardView(leaderboardIsShowing: $leaderboardIsShowing,game: $game)
                })
        }
    }
}
struct NumberView: View{
    var title: String
    var text: String
    var body: some View{
        VStack{
            LableText(title: title.uppercased())
            RoundRectTextView(number: text)
        }
    }
}
struct BottomView: View{
    @Binding var game: Game
    var body: some View{
        HStack{
            NumberView(title: "Score", text: String(game.score))
            Spacer()
            NumberView(title: "Round", text: String(game.round))
        }
    }
}
struct RingsView: View{
    @Environment(\.colorScheme) var colorScheme
    var body: some View{
        ZStack{
            let opacity = colorScheme == .dark ? 0.1 : 0.3
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            ForEach(1..<6){ring in
                let size = CGFloat(ring*100)
                Circle()
                    .stroke(lineWidth: 20.0)
                    .fill(
                        RadialGradient(gradient: Gradient(colors: [Color("RingColor")
                            .opacity(opacity), Color("RingColor").opacity(0)]), center: .center, startRadius: 100, endRadius: 300))
                    .frame(width: size, height: size)
            }
            

        }
    }
}
struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}
