//
//  ProfileView.swift
//  SwiftUIToDoApp
//
//  Created by Harun AYDIN on 8.07.2024.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    init(){
        
    }
    
    var body: some View {
        NavigationView{
            VStack{
                
                if let user = viewModel.user{
                    profile(user: user)
                    // logout işlemi yapılacak
                    
                }
                else{
                    Text("Profil Yükleniyor...")
                }
                BigButton(title: "Çıkış Yap") {
                    viewModel.logOut()
                }
                
            }
            .navigationTitle("Profil")
        }
        .onAppear{
            viewModel.fetchUser()
        }
        
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundStyle(Color.blue)
            .frame(width: screenWidth * 0.2,height: screenHeight * 0.2)
        
        VStack{
            HStack{
                Text("İsim: ")
                Text(user.name)
            }
            HStack{
                Text("Email: ")
                Text(user.email)
            }
            HStack{
                Text("Kayıt Tarihi: ")
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
        }
    }
    
}

#Preview {
    ProfileView()
}
