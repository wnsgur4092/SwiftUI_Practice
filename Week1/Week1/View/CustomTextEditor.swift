//
//  CustomTextEditor.swift
//  Week1
//
//  Created by JunHyuk Lim on 31/1/2023.
//

import SwiftUI

struct CustomTextEditor: View {
    
    @State var textInTextEditor : String 
    @State var isFocusing : Bool 
    
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 8).stroke(isFocusing ? Color.blue : Color("border"), lineWidth: 1)
            if textInTextEditor.isEmpty {
                
                Text("다른 사람에게 나를 소개할 수 있도록\n자신의 활동을 자세하게 적어주세요")
                    .padding(16)
                    .zIndex(2)
                    .frame(width: 340, height: 200, alignment: .topLeading)
                    .background(Color.yellow.opacity(0.2))
                    .disabled(true)
                    .foregroundColor(Color("placeholder"))
                    .font(.custom("NanumGothicBold",size: 14))
                    .lineSpacing(10)
                    .onTapGesture {
                        print("---->Touched")
                    }
                
            }
            
            
            FirstResponderTextEditor(text: $textInTextEditor, font: UIFont(name: "NanumGothicBold", size: 14), isFocused: $isFocusing)
                .zIndex(1)
                .padding(16)
                .frame(width: 340, height: 200, alignment: .topLeading)
            
        }
    }
}


struct FirstResponderTextEditor: UIViewRepresentable {
    @Binding var text: String
    let font: UIFont?
    @Binding var isFocused: Bool
    
    
    class Coordinator: NSObject, UITextViewDelegate {
        @Binding var text: String
        @Binding var isFocused: Bool
        var becameFirstResponder = false
        
        init(text: Binding<String>, isFocused: Binding<Bool>) {
            self._text = text
            self._isFocused = isFocused
        }
        
        func textViewDidChange(_ textView: UITextView) {
            text = textView.text
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            isFocused = true
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            isFocused = false
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text, isFocused: $isFocused)
    }
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.delegate = context.coordinator
        textView.text = text
        textView.textContainer.lineFragmentPadding = 0
        if let font = font {
            textView.font = font
        }
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        if context.coordinator.becameFirstResponder {
            uiView.becomeFirstResponder()
            context.coordinator.becameFirstResponder = false
        }
    }
}

struct CustomTextEditor_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextEditor(textInTextEditor: "", isFocusing: false)
    }
}
