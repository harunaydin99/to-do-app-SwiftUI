//
//  NewItemViewViewModel.swift
//  SwiftUIToDoApp
//
//  Created by Harun AYDIN on 8.07.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel: ObservableObject{
    
    @Published var title = ""
    @Published var duedate = Date()
    @Published var showAlert = false
    
    
    init() {
        
    }
    
    func save() {
        guard canSave else {
            return
        }
        
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let newItemId = UUID().uuidString  // bize bir id verir
        let newItem = ToDoListItem(
            id: newItemId,
            title: title,
            dueDate: duedate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos") // giriş yapmış kullanıcının tod laeı varsa oraya gider. yoksa todo isminde bir collection oluşturur
            .document(newItem.id)
            .setData(newItem.asDictionary())
        
        
        
    }
    
    var canSave: Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard duedate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
    }
    
    
}
