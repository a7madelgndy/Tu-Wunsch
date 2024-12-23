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
    var body: some View {
        NavigationStack {
            List {
                ForEach(wihses) { wish in
                    Text(wish.title)
                }
            }//::List
            .navigationTitle("My wishlist")
            .overlay {
              if  wihses.isEmpty {
                    ContentUnavailableView("My Wishlist", systemImage: "heart", description: Text( "No Wishes yet. Add one To get Started."))
                }
            }
        }//::naviation Stack
     
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Wish.self , inMemory: true)
}
