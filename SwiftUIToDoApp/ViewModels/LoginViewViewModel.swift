//
//  LoginViewViewModel.swift
//  SwiftUIToDoApp
//
//  Created by Harun AYDIN on 8.07.2024.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    @Published var wrongInfoError = ""
    
    init() {
        
    }
    
    func login() {
        guard validate() else{
            return
        }
        wrongInfoError = ""
        
       /* do{
            try Auth.auth().signIn(withEmail: email, password: password)
        }catch{
            print("deneme")
            print(error)
        }*/
        
       // Auth.auth().signIn(withEmail: email, password: password)
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let error = error  {
                    self.wrongInfoError = "Yanlış kullanıcı adı veya şifre girdiniz"
                    print(error)
                } else {
                    // Başarılı giriş
                    print("Kullanıcı başarıyla giriş yaptı.")
                }
            }
        
        
        
    }
    
    func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
            !password.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            errorMessage = "Lütfen tüm alanları doldurun"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "Lütfen geçerli bir email adresi giriniz"
            return false
        }
        
        return true
        
    }
    
    
    
}
