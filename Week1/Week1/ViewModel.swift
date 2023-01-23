//
//  ViewModel.swift
//  Week1
//
//  Created by JunHyuk Lim on 23/1/2023.
//

import SwiftUI
import Combine

class ViewModel: ObservableObject {
    @Published var nickNameCounted = "0"
    @Published var nickName = "" {
        didSet {
            nickNameCounted = String(nickName.count)
        }
    }
    
    @Published var briefProfileCounted = "0"
    @Published var briefProfile = "" {
        didSet {
            briefProfileCounted = String(briefProfile.count)
        }
    }
    
    @Published var selfDescriptionCounted = "0"
    @Published var selfDescription = "" {
        didSet {
            selfDescriptionCounted = String(selfDescription.count)
        }
    }
    
}

