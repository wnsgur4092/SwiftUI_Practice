//
//  ContentView.swift
//  Week2
//
//  Created by JunHyuk Lim on 4/2/2023.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PREVIEW
    @StateObject var viewModel : TodosViewModel
    //MARK: - BODY
    var body: some View {
        ScrollView{
            mainHeader
            
            SearchBar()
            
            todosList
            
        }
        .frame(maxWidth: .infinity)
        .padding(16)
        
    }
    
    //MARK: - COMPONENTS
    fileprivate var mainHeader : some View {
        HStack{
            Text("할일 목록")
            
            Spacer()
            
            Button {
                
            } label: {
                Text("추가")
            }
        }
    }
    
    fileprivate var todosList : some View {
        VStack(spacing: 10){
            ForEach(viewModel.todos?.data ?? [], id :\.id) { todo in
                TodoCell(text: todo.title ?? "")
            }
        }
    }
    
    
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: TodosViewModel())
    }
}
