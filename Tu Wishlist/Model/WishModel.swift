//
//  WishModel.swift
//  Tu Wishlist
//
//  Created by Ahmed El Gndy on 23/12/2024.
//

import Foundation
import SwiftData

@Model
class Wish {
    var title : String
    init(title: String) {
        self.title = title
    }
}
