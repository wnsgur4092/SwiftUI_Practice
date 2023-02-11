//
//  TodosViewModel.swift
//  Week2
//
//  Created by JunHyuk Lim on 11/2/2023.
//

import Foundation
import Combine

class TodosViewModel : ObservableObject {
    
    init(){
        TodoAPI.fetchTodos()
    }
}
