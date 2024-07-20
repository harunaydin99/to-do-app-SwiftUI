//
//  HeaderView.swift
//  SwiftUIToDoApp
//
//  Created by Harun AYDIN on 10.07.2024.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack{
            Image("rappel")
                .resizable()
                .frame(width: UIScreen.main.bounds.width * 0.32,height: UIScreen.main.bounds.height * 0.15)
                
            Text("IFA")
                .font(.system(size: 40))
                .fontWeight(.bold)
                //.padding(.top, 30)
            
        }.padding(.top, 90)
    }
}

#Preview {
    HeaderView()
}
