//
//  NavigationContext.swift
//  Rosalie's Store
//
//  Created by Joseph Callao on 7/28/25.
//

import Foundation

@Observable
class NavigationContext {
    var selectedMenu: MainMenu?
    var selectedItem: SelectedItem?
    
    var sidebarTitle: String = "Menu"
    
    var itemListTitle: String { selectedMenu?.title ?? "" }
    
    init(selectedMenu: MainMenu? = nil, selectedItem: SelectedItem? = nil) {
        self.selectedMenu = selectedMenu
        self.selectedItem = selectedItem
    }
}
