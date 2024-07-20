//
//  ToDoListView.swift
//  SwiftUIToDoApp
//
//  Created by Harun AYDIN on 8.07.2024.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    
    @StateObject var viewModel : ToDoListViewViewModel
    
    @FirestoreQuery var items : [ToDoListItem]
    
    
    
    init(userId:String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos") //******
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId)) //************
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items){ item in
                    
                    ToDoListItemView(item: item)
                        .swipeActions{
                            Button("Sil"){
                                viewModel.delete(id: item.id) 
                            }
                            .background(Color.red)
                        }
                }
                .listStyle(PlainListStyle())
                
            }
            .navigationTitle("Görevler")
            .toolbar{
                Button{
                    // sheet açma kodları
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView, content: {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            })
        }
        
    }
}

#Preview {
    ToDoListView(userId: "kpoCOyLBIzRiJJUbquxOcJMv6qq1")
}
