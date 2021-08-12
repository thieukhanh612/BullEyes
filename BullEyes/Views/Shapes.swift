//
//  Shapes.swift
//  BullEyes
//
//  Created by Khanh Thieu on 28/06/2021.
//

import SwiftUI

struct Shapes: View {
    var body: some View {
        VStack{
            Circle()
                .fill(Color.blue)
                .frame(width:200, height:100.0)

        }
        .background(Color.green)
        
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
