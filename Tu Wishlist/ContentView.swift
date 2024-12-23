//
//  ContentView.swift
//  Tu Wishlist
//
//  Created by Ahmed El Gndy on 23/12/2024.
//

import SwiftUI
import SwiftData
struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var wihses : [Wish]
    
    @State private var isAlertShowing: Bool = false
    @State private var title : String = " "
    
    let container = try! ModelContainer(for: Wish.self, configurations: ModelConfiguration(isStoredInMemoryOnly: false))
    var body: some View {
        NavigationStack {
            List {
                ForEach(wihses) { wish in
                    Text(wish.title)
                        .font(.title2.weight(.light))
                        .padding(.vertical, 2)
                }
            }//::List
            .navigationTitle("My wishlist")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isAlertShowing.toggle()
                    }label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }
                }
            }
            .alert("Create a new Wish" , isPresented: $isAlertShowing){
                TextField("your Whis", text: $title)
                Button {
                    container.mainContext.insert(Wish(title: title))
                } label: {
                    Text("Save")
                }
             }
            .overlay {
              if  wihses.isEmpty {
                    ContentUnavailableView("My Wishlist", systemImage: "heart", description: Text( "No Wishes yet. Add one To get Started."))
                }
            }
        }//::naviation Stack
     
    }
}

#Preview("Empty list") {
    
    let container = try! ModelContainer(for: Wish.self , configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    container.mainContext.insert(Wish(title: "new"))
    
    return ContentView()
        .modelContainer(container)
}

#Preview("list with data") {
    ContentView()
        .modelContainer(for: Wish.self , inMemory: true)
}
