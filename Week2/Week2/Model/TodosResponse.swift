//
//  TodosResponse.swift
//  Week2
//
//  Created by JunHyuk Lim on 11/2/2023.
//

import Foundation

//    func fetchTodos() {
//        AF.request(dummyURL, method: .get)
//            .validate(statusCode: 200..<300)
//            .validate(contentType: ["application/json"])
//            .responseDecodable(of: TodosResponse.self) { [weak self] (response) in
//                guard let self = self else { return }
//                switch response.result {
//                case .success(let todoResponse):
//                    self.todos.append(todoResponse)
//                case .failure(let error):
//                    print(error.localizedDescription)
//                }
//            }
//            .store(in: &subscription)
//    }

// MARK: - TodosResponse
struct TodosResponse: Codable {
    let data: [Todo]?
    let meta: Meta?
    let message: String?
}

// MARK: - Datum
struct Todo: Codable {
    let id: Int?
    let title: String?
    let isDone: Bool?
    let createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, title
        case isDone = "is_done"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - Meta
struct Meta: Codable {
    let currentPage, from, lastPage, perPage: Int?
    let to, total: Int?

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case from
        case lastPage = "last_page"
        case perPage = "per_page"
        case to, total
    }
}
