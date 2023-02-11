////
////  TodoAPI.swift
////  Week2
////
////  Created by JunHyuk Lim on 11/2/2023.
////
//
//import Foundation
//
//enum TodoAPI {
//
//    static let baseURL = "https://phplaravel-574671-2962113.cloudwaysapps.com/api/v1"
//    
//    
//    enum ApiError : Error {
//        case parsingError
//        case noContent
//        case decodingError
//        case badStatus(code: Int)
//    }
//    
//    static func fetchTodos(page : Int = 1, completion : @escaping (Result<TodosResponse, ApiError>) -> Void){
//        //1. Create URLRequest
//        let urlString = baseURL + "/todos" + "?pages=\(page)"
//        let url = URL(string: urlString)!
//        
//        var urlRequest = URLRequest(url: url)
//        urlRequest.httpMethod = "GET"
//        urlRequest.addValue("application/json", forHTTPHeaderField: "accept")
//        
//        //2. Use URLSession to fetch API
//        //3. Get API Request
//        URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, err in
//            
//            print("data:\(data)")
//            print("urlResponse: \(urlResponse)")
//            
//            if let jsonData = data {
//                do {
//                    let todosResponse = try JSONDecoder().decode(TodosResponse.self, from : jsonData)
//                    let modelObjects = todosResponse.data
//                    
//                    print("todosResponse : \(todosResponse)")
//                    
//                    completion(.success(todosResponse))
//                } catch {
//                    completion(.failure(ApiError.decodingError))
//                }
//            }
//            
//        }.resume()
//        
//
//    }
//    
//}
