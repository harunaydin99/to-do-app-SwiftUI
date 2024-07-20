//
//  NewItemView.swift
//  SwiftUIToDoApp
//
//  Created by Harun AYDIN on 8.07.2024.
//

import SwiftUI

struct NewItemView: View {
    
    @Binding var newItemPresented: Bool  // neden @binding. çünkü bu değişkeni false yapınca todolistview daki değişken de değişmesi için
    @StateObject var viewModel = NewItemViewViewModel()
    
    var body: some View {
        VStack{
            Text("Yeni Görev")
                .font(.title)
                .bold()
                .padding(.top, 60)
            Form{
                TextField("Başlık", text: $viewModel.title)
                DatePicker("Bitiş Tarihi", selection:$viewModel.duedate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                BigButton(title: "Kaydet") {
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented = false // açılan sheet i kapatmak için
                    }
                    else{
                        viewModel.showAlert = true
                    }
                    
                }
            }
            .alert(isPresented: $viewModel.showAlert, content: {
                Alert(title: Text("Hata"), message: Text("Lütfen verilerin doğruluğunu kontrol edin."))
            })
        }
        
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    },
        set: { _ in
        
    }))
}
