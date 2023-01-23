import SwiftUI
import Combine


class TextCountMgr: ObservableObject {
    @Published var counted = "0"
    @Published var text = "" {
        didSet {
            counted = String(text.count)
        }
    }
}


struct TextCounterTestView: View {
    @ObservedObject var textCountMgr = TextCountMgr()
    
    var body: some View {
        VStack {
            VStack {
                TextField("Placeholder", text: $textCountMgr.text)
            }
            .padding(.all)
            .background(Color.blue)
            .foregroundColor(.white)
            
            VStack {
                Text("\(textCountMgr.counted) / 20")
            }
        }
    }
}

struct TextCounterTestView_Previews: PreviewProvider {
    static var previews: some View {
        TextCounterTestView()
    }
}
