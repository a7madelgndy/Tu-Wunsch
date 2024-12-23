//
//  Tu_WishlistApp.swift
//  Tu Wishlist
//
//  Created by Ahmed El Gndy on 23/12/2024.
//

import SwiftUI
import SwiftData
@main
struct Tu_WishlistApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Wish.self)
            //Main app's model Container
             
        }
    }
}
