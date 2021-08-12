//
//  ContentView.swift
//  BullEyes
//
//  Created by Khanh Thieu on 03/06/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var alertIsVisible: Bool = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionViews(game: $game)
                    .padding(.bottom, alertIsVisible ? 0 : 100)
                if alertIsVisible{
                    PointsView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                }
                else {
                    HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                }
              
            }
            if !alertIsVisible{
                SliderView(sliderValue: $sliderValue)
                    .transition(.scale)
            }
        }
        
            
    }
}
struct InstructionViews : View{
    @Binding var game : Game
    var body: some View{
        VStack{
            InstructionText(text:"🐶 \nPUT THE BULLEYES AS CLOSE AS YOU CAN TO ")
                .padding(.leading,30.0)
                .padding(.trailing,30.0)
            BigNumberText(text:String( game.target))
        }
    }
}
struct SliderView: View{
    @Binding var sliderValue: Double
    var body: some View{
        HStack{
            SliderLableText(value: 1)
            Slider(value: $sliderValue, in: 1...100)
            SliderLableText(value: 100)
        }
        .padding()
        
    }
}
struct HitMeButton: View{
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue : Double
    @Binding var game : Game
    var body: some View{
        Button(action: {
            withAnimation{
                alertIsVisible=true
            }
            
        }) {
            
            HitMeButtonTextView()
        }
            .padding(20.0)
            .background(
                ZStack {
                    Color("ButtonColor")
                    LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
                })
            .foregroundColor(Color.white)
        .cornerRadius(Constants.General.roundRectCornerRadius)
            .overlay(
            RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
                
        )
            
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
