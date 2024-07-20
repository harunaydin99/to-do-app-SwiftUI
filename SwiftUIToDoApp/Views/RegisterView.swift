//
//  RegisterView.swift
//  SwiftUIToDoApp
//
//  Created by Harun AYDIN on 8.07.2024.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        NavigationStack{
            VStack{
                // Header
                HeaderView()
            
                // Register form
                Form{
                    Section(header: Text("Kayıt Formu")) {
                        if !viewModel.errorMessage.isEmpty{
                            Text(viewModel.errorMessage)
                                .foregroundStyle(.red)
                        }
                        TextField("Tam adınız", text: $viewModel.name)
                            .autocorrectionDisabled()
                        TextField("Email adresiniz", text: $viewModel.email)
                            .autocorrectionDisabled()
                            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        SecureField("Şifreniz", text: $viewModel.password)
                    }
                }
                .frame(height: screenHeight * 0.27)
                
                BigButton(title: "Kayıt Ol", action: {
                    viewModel.register()
                })
                Spacer()
                
                
                
            }
        }
    }
}

#Preview {
    RegisterView()
}
