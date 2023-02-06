//
//  CustomText.swift
//  Week2
//
//  Created by JunHyuk Lim on 5/2/2023.
//

import SwiftUI

struct CustomText: View {
    //MARK: - PROPERTIES
    var placeholder : String

    @State var textInTextField : String
    @State var isFocusing : Bool

    //MARK: - BODY
    var body: some View {
        
        ZStack {
//            FirstResponderTextField(text: $textInTextField, placeholder: placeholder, font: UIFont(name: "NanumGothicBold", size: 14), isFocused: $isFocusing)
//                .foregroundColor(Color("text"))
//                .padding(16)
//                .frame(width: 340, height: 52)
             
            
            
            
            
            
            RoundedRectangle(cornerRadius: 8)
                .stroke(isFocusing ? Color.blue : Color("border"), lineWidth: 1)
//                .frame(width: 340, height: 52)
            
        }

    }
}

//MARK: - FOCUS STATE in iOS 14
struct FirstResponderTextField : UIViewRepresentable {
    @Binding var text : String
    let font: UIFont?
    @Binding var isFocused: Bool
    
    
    class Coordinator : NSObject, UITextViewDelegate {
        @Binding var text : String
        @Binding var isFocused : Bool
        var becameFirstResponder = false
        
        init(text: Binding<String>, isFocused : Binding<Bool>){
            self._text = text
            self._isFocused = isFocused
        }
//        func textFieldDidChangeSelection(_ textField: UITextField) {
////            text = textField.text ?? ""
//        }
//        func textFieldDidBeginEditing(_ textField: UITextField) {
//            isFocused = true
//        }
//        func textFieldDidEndEditing(_ textField: UITextField) {
//            isFocused = false
//        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text, isFocused : $isFocused)
    }
    
    func makeUIView(context: Context) -> UITextField {
        let textView = UITextField()
//        textView.delegate = context.coordinator 
        if let font = font {
            textView.font = font
        }
        return textView
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        if context.coordinator.becameFirstResponder {
            uiView.becomeFirstResponder()
            context.coordinator.becameFirstResponder = false
        }
    }
}


//MARK: - PREVIEW
struct CustomText_Previews: PreviewProvider {
    static var previews: some View {
        CustomText(placeholder: "", textInTextField: "", isFocusing: false)
    }
}

