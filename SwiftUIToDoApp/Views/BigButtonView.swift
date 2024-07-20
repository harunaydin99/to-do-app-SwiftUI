//
//  BigButtonView.swift
//  SwiftUIToDoApp
//
//  Created by Harun AYDIN on 10.07.2024.
//

import SwiftUI

struct BigButton: View {
    
    let title: String
    let action: () -> Void
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        Button(action: action, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.primary)
                Text(title)
                    .foregroundStyle(.white)
            }
        })
        .frame(height: screenHeight * 0.05)
        .padding(.horizontal)
    }
}

#Preview {
    BigButton(title: "str", action: {})
}
