//
//  Test.swift
//  Week1
//
//  Created by JunHyuk Lim on 24/1/2023.
//

import SwiftUI

struct Test: View {
    @State private var textFields = [String]()
    @State private var showText = false
    var body: some View {
        VStack {
            ForEach(0..<textFields.count, id: \.self) { index in
                TextField("Enter text", text: self.$textFields[index])
            }

            Button("텍스트 필드 추가") {
                if self.textFields.count < 2 {
                    self.textFields.append("")
                } else {
                    self.showText = true
                }
            }
            .onTapGesture {
                if self.textFields.count == 2 {
                    self.showText = true
                } else {
                    self.showText = false
                }
            }
            
            if showText {
                Text("더 이상 추가할 수 없습니다")
                
            }
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
