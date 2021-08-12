//
//  TextViews.swift
//  BullEyes
//
//  Created by Khanh Thieu on 28/06/2021.
//

import SwiftUI

struct InstructionText: View {
    var text : String
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .font(.footnote)
            .lineSpacing(4.0)
            .padding(.leading,30.0)
            .padding(.trailing,30.0)
            .foregroundColor(Color("TextColor"))
          }
}
struct BigNumberText: View{
    var text : String
    var body: some View{
        Text(text)
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(Color("TextColor"))

    }
}
struct SliderLableText: View{
    var value : Int
    var body: some View{
        Text(String(value))
            .bold()
            .foregroundColor(Color("TextColor"))
            .frame(width: 35.0)
    }
}
struct HitMeButtonTextView: View{
    var body: some View{
        Text("Hit me".uppercased())
            .bold()
            .font(.title3)
    }
}
struct LableText: View{
    var title: String
    var body: some View{
        Text(title)
            .bold()
            .foregroundColor(Color("TextColor"))
            .font(.caption)
            .kerning(1.5)
    }
}
struct BodyText: View{
    var text: String
    var body: some View{
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(12.0)
            .foregroundColor(Color("TextColor"))
            
            
    }
}
struct ButtonText: View{
    var text: String
    var body: some View{
            Text(text)
                .foregroundColor(.white)
                .font(.headline)
                .bold()
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("AccentColor"))
                .cornerRadius(12.0)
    }
            
}
struct ScoreText: View{
    var text: String
    var body: some View{
        Text(text)
            .foregroundColor(Color("TextColor"))
            .bold()
            .font(.title3)
            .kerning(-0.2)
        
    }
}
struct DateText: View{
    var date: Date
    var body: some View{
        Text(date, style: .time)
            .foregroundColor(Color("TextColor"))
            .bold()
            .font(.title3)
            .kerning(-0.2)
        
    }
}
struct BigBoldText: View {
    let text: String
    var body: some View{
        ZStack {
            Text(text.uppercased())
                .kerning(2.0)
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(Color("TextColor"))
        }
        
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            InstructionText(text: "Instruction")
            BigNumberText(text: "999")
            LableText(title: "99")
            BodyText(text: "You scored 200 Points \n 🎉🎉🎉")
            ButtonText(text: "Start New Round")
            ScoreText(text: "99")
            DateText(date: Date())
            BigBoldText(text: "LeaderBoard")
        }
        .padding()
    }
}
