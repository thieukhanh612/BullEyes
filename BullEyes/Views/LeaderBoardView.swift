//
//  LeaderBoardView.swift
//  BullEyes
//
//  Created by Khanh Thieu on 30/06/2021.
//

import SwiftUI

struct LeaderBoardView: View {
    @Binding var leaderboardIsShowing: Bool
    @Binding var game : Game
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
                LableView()
                ScrollView{
                    VStack{
                        ForEach(game.leaderboardEntries.indices){ i in
                            let leaderboardEntry = game.leaderboardEntries[i]
                            RowView(index: i, score: leaderboardEntry.score, date: leaderboardEntry.date)
                        }
                    }
                }
            }
        }
    }
}
struct RowView: View{
    let index : Int
    let score: Int
    let date: Date
    var body: some View{
        HStack{
           RoundedTextView(number: index)
         
            Spacer()
            ScoreText(text: String(score))
                .frame(maxWidth: Constants.LeaderBoard.leaderBoardScoreColWidth)
            Spacer()
            DateText(date: date)
                .frame(maxWidth: Constants.LeaderBoard.leaderBoardDateColWidth)
          
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(Color("LeaderBoardStrokeColor"), lineWidth: Constants.General.strokeWidth)
            
        )
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth:Constants.LeaderBoard.leaderBoardMaxColWidth)
        
    }
}
struct HeaderView: View{
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Binding var leaderboardIsShowing: Bool
    var body: some View{
        ZStack{
            HStack{
                if verticalSizeClass == .regular && horizontalSizeClass == .compact{
                    BigBoldText(text: "LeaderBoard")
                        .padding()
                    Spacer()
                } else{
                    BigBoldText(text: "LeaderBoard")
                }
            }
            HStack{
                Spacer()
                Button(action: {
                    leaderboardIsShowing = false
                }){
                    RoundedImageViewFilled(systemName: "xmark")
                }
               
            }
        }
        
    }
}
struct LableView: View{
    var body: some View{
        HStack{
            Spacer()
                .frame(width: Constants.General.roundedViewLength)
            Spacer()
            LableText(title: "Score")
                .frame(width: Constants.LeaderBoard.leaderBoardScoreColWidth)
            Spacer()
            LableText(title: "Date")
                .frame(width: Constants.LeaderBoard.leaderBoardDateColWidth)
            
        }
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth:Constants.LeaderBoard.leaderBoardMaxColWidth)
    }
}
struct LeaderBoardView_Previews: PreviewProvider {
    static private var leaderboardIsShowing = Binding.constant(false)
    static private var game = Binding.constant(Game(loadTestData: true))
    static var previews: some View {
       
        LeaderBoardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
        LeaderBoardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
        LeaderBoardView(leaderboardIsShowing: leaderboardIsShowing,game: game)
            .preferredColorScheme(.dark)
        LeaderBoardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
