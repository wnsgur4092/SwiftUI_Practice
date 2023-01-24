//
//  ProfileImageMod.swift
//  Week1
//
//  Created by JunHyuk Lim on 24/1/2023.
//

import SwiftUI

extension Image {
    
    func profileImageMod() -> some View {
        self
            .resizable()
            .frame(width: 80, height: 80)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
    }
    
}
