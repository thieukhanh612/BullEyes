//
//  RoundViews.swift
//  BullEyes
//
//  Created by Khanh Thieu on 28/06/2021.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
            .overlay(
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
                    
            )
    }
}
struct RoundedImageViewFilled: View {
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
            .background(
                Circle()
                    .fill(Color("ButtonFilledBackgroundColor"))
            )
            

            
            
    }
}
struct RoundRectTextView: View{
    var number: String
    var body: some View{
        Text(number)
            .bold()
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
            .font(.title2)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                    .strokeBorder(Color("ButtonStrokeColor"),lineWidth: Constants.General.strokeWidth)
                    .foregroundColor(Color("TextColor"))
                    .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
            )
    }
}
struct RoundedTextView: View{
    var number : Int
    var body: some View{
        Text(String(number))
            .foregroundColor(Color("TextColor"))
            .bold()
            .font(.title3)
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .overlay(
                Circle()
                    .strokeBorder(Color("LeaderBoardStrokeColor"), lineWidth: Constants.General.strokeWidth)
                )
            
    }
}
struct PreviewView:View {
    var body: some View{
        VStack(spacing: 10){
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            RoundedImageViewFilled(systemName: "list.dash")
            RoundRectTextView(number: "999")
            RoundedTextView(number: 99)
        }
    }
}
struct RoundViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
        PreviewView()
            .preferredColorScheme(.dark)
    }
}
