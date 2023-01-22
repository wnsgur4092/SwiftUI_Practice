//
//  ContentView.swift
//  Week1
//
//  Created by JunHyuk Lim on 22/1/2023.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    @State var nickname : String = ""
    @State var briefProfile : String = ""
    @State var selfDescription : String = ""
    @State var snsURL : String = ""
    
    @State private var textFields: [Text] = []
    private var maxTextFields = 2
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            VStack{
                Circle()
                    .frame(width: 80, height:80)
                    .padding(.top, 16)
                    .padding(.horizontal, 147.5)
                
                VStack(alignment: .leading) {
                    Text("닉네임")
                    TextField("쩡대리", text: $nickname)
                        .frame(width: .infinity)
                        .textFieldStyle(.roundedBorder)
                    
                    HStack {
                        Spacer()
                        
                        Text("3/20")
                            .font(.system(size:12))
                        
                        
                        
                    }
                    .frame(width: 340, height: 18)
                    
                }
                
                
                VStack(alignment: .leading) {
                    Text("한 줄 프로필")
                    TextField("자신을 표현할 한 줄 소개입니다.", text: $briefProfile)
                        .frame(width: .infinity)
                        .textFieldStyle(.roundedBorder)
                    
                    HStack {
                        Spacer()
                        
                        Text("3/20")
                            .font(.system(size:12))
                    }
                    .frame(width: 340, height: 18)
                }
                
                VStack(alignment: .leading) {
                    Text("자기소개")
                    TextField("다른 사람에게 나를 소개할 수 있도록 자신의 활동을 자세하게 적어주세요", text: $selfDescription, axis: .vertical)
                        .lineLimit(3)
                        .frame(height: 200, alignment: .top)
                        .padding(16)
                    
                    
                    
                        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 0.5))
                    
                    HStack {
                        Spacer()
                        
                        Text("3/20")
                            .font(.system(size:12))
                    }
                    .frame(width: 340, height: 18)
                }
                
                VStack(alignment: .leading) {
                    Text("웹사이트 연결")
                    Group {
                        HStack {
                            TextField("SNS 또는 홈페이지를 연결해주세요.", text: $snsURL)
                                .frame(width: .infinity)
                                .textFieldStyle(.roundedBorder)
                        }
                        
                    }

                    Button {
                        
                    } label: {
                        Text("+웹사이트 추가")
                            .font(.system(size:12))
                    }
                    
                }
            }
            .padding(.horizontal, 17.5)
            
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        
                    } label: {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.black)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Text("저장")
                    }

                }
            }
        }
    }
    
    //MARK: - VIEWBUILDER
    @ViewBuilder
    func webSiteTextField() -> some View {
        HStack {
            TextField("SNS 또는 홈페이지를 연결해주세요.", text: $snsURL)
                .frame(width: .infinity)
                .textFieldStyle(.roundedBorder)
            
            Image(systemName: "trash")
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1).frame(width:40,height:40))
        }
    }
    
    //MARK: - FUNCTION
    
}

struct MyViewBuilder {
    static func buildBlock<Content: View>(@ViewBuilder _ content: () -> Content) -> some View {
        return VStack {
            content()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
