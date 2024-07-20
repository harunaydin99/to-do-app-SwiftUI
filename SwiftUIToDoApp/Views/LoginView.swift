//
//  LoginView.swift
//  SwiftUIToDoApp
//
//  Created by Harun AYDIN on 8.07.2024.
//

import SwiftUI

struct LoginView: View {

    @StateObject var viewModel = LoginViewViewModel()
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        NavigationStack{  // sayfalar arası geçiş olacağı içinn
            VStack{
                 
                // Header
                HeaderView()
                // Form- email şifre
                
                Form{
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundStyle(.red)
                    }
                    if !viewModel.wrongInfoError.isEmpty{
                        Text(viewModel.wrongInfoError)
                            .foregroundStyle(.red)
                    }
                    TextField("Email Adresiniz", text: $viewModel.email)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                }
                //.introspectTableView { $0.backgroundColor = .systemBlue }
                .listRowBackground(Color.blue)
                .frame(height: screenHeight * 0.20) // form çok büyük olduğu için butonu aşağı atıyor
                BigButton(title: "Giriş Yap", action: {
                    viewModel.login()
                })
                Spacer()
                
                // Footer (hesabınız yok mu)
                VStack{
                    Text("Üye değil misiniz ?")
                    NavigationLink("Hesap oluştur", destination: RegisterView())
                }
                
                
            }
            
            
            
        }
    }
}

#Preview {
    LoginView()
}
