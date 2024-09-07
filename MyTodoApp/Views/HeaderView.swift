//
//  HeaderView.swift
//  MyTodoApp
//
//  Created by Siddu Mathapati on 03/09/24.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let Background: Color
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Background)
                    .rotationEffect(Angle(degrees: angle))
                VStack {
                    Text(title)
                        .font(.system(size: 50))
                        .foregroundColor(Color.white)
                        .bold()
                    Text(subtitle)
                        .font(.system(size: 30))
                        .foregroundColor(Color.white)
                        .bold()
                }
                .padding(.top, 80)
            }
                        .frame(width: UIScreen.main.bounds.width * 3,
                               height: 350)
                        .offset(y: -150)
                    
        }
    }
}

#Preview {
    HeaderView(  title: "Title",
                 subtitle: "subtitle",
                 angle: 15,
                 Background: .cyan)
}
