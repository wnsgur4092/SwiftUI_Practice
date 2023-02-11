//
//  Week2App.swift
//  Week2
//
//  Created by JunHyuk Lim on 4/2/2023.
//

import SwiftUI

@main
struct Week2App: App {
    @StateObject var todosViewModel = TodosViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
