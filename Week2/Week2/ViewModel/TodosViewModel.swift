//
//  TodosViewModel.swift
//  Week2
//
//  Created by JunHyuk Lim on 11/2/2023.
//

import Foundation
import Alamofire
import Combine

class TodosViewModel: ObservableObject {
    
    @Published var todos: TodosResponse?
    
    private let baseURL = "https://phplaravel-574671-2962113.cloudwaysapps.com/api/v1/todos"
    
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    
    var subscription = Set<AnyCancellable>()
    
    init() {
        self.fetchTodos { (result) in
            switch result {
            case .success(let todosResponse):
                self.todos = todosResponse
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    func fetchTodos(completion: @escaping (Result<TodosResponse, Error>) -> Void) {
        AF.request(baseURL, method: .get)
            .validate(statusCode: 200...200)
            .validate(contentType: ["application/json"])
            .responseData { (response) in
                switch response.result {
                case .success(let data):
                    do {
                        let todosResponse = try JSONDecoder().decode(TodosResponse.self, from: data)
                        completion(.success(todosResponse))
                    } catch {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}





