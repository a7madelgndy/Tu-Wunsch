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
    @Query private var wishes : [Wish]
    
    @State private var isAlertShowing: Bool = false
    @State private var title : String = " "
    
   
    var body: some View {
        NavigationStack {
            List {
                ForEach(wishes) { wish in
                    Text(wish.title)
                        .font(.title2.weight(.light))
                        .padding(.vertical, 2)
                        .swipeActions {
                            Button("Delete" , role: .destructive) {
                                modelContext.delete(wish)
                            }
                        }
        
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
                if wishes.isEmpty != true{
                   ToolbarItem(placement: .bottomBar) {
            Text("\(wishes.count) Wish\(wishes.count > 1 ? "es" : "")")
                        }
                    }
            }
      
            .alert("Create a new Wish" , isPresented: $isAlertShowing){
                TextField("your Whis", text: $title)
                Button {
                    modelContext.insert(Wish(title: title))
                    title = ""
                } label: {
                    Text("Save")
                }
             }
            .overlay {
              if  wishes.isEmpty {
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
