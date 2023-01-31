//
//  ContentView.swift
//  Week1
//
//  Created by JunHyuk Lim on 22/1/2023.
//

import SwiftUI
import PhotosUI
import UIKit
import Combine

struct ContentView: View {
    //MARK: - PROPERTIES
    @StateObject var vm = ViewModel()
    
    //웹사이트 파트
    @State var snsURL : String = ""
    @State var secondSnsURL : String = ""
    @State var thirdSnsURL : String = ""
    @State var textFieldCount = 0
    
    @State var showText = false
    
    @State var text : String = ""
    
    
    
    @State var textFields = [String](repeating: "", count: 2)
    @State var showMaxLimit = false
    
    
    
    //FOCUS
    @State var isNameFoucsed : Bool = false
    @State var isProfileFoucsed : Bool = false
    @State var isDescriptionFocused : Bool = false
    @State var isWebsiteFocused : Bool = false
    
    
    
    @State var focusedTextField = -1
    
    
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                
                //MARK: - 1. PROFILE IMAGE
                //프로필 이미지 선택 시 카메라 & 앨범 ActionSheet 나오기
                //앨범에서 이미지 선택시 프로필 이미지로 변경
                profileImage
                    .onTapGesture(perform: {
                        vm.presentedActionSheet = true
                    })
                    .sheet(isPresented: $vm.presentImagePicker, content: {
                        SUImagePickerView(sourceType: vm.presentCamera ? .camera : .photoLibrary, image: $vm.image, isPresented: $vm.presentImagePicker)
                    })
                    .actionSheet(isPresented: $vm.presentedActionSheet) {
                        ActionSheet(title: Text(""), buttons:[
                            .default(Text("카메라")) {
                                vm.presentImagePicker = true
                                vm.presentCamera = true
                            },
                            .default(Text("앨범")) {
                                vm.presentImagePicker = true
                                vm.presentCamera = false
                            },
                            .cancel()])
                    }
                
                
                
                VStack{
                    //MARK: - 2.NICK NAME
                    VStack(alignment: .center, spacing: 10) {
                        VStack(alignment: .leading){
                            Title(title: "닉네임")
                            
                            CustomTextField(placeholder: "쩡대리", textInTextField: vm.nickName, isFocusing: isNameFoucsed)
                            
                            NumberOfText(textCount: vm.nickNameCounted, totalText: "20")
                        }
                        
                        //MARK: - 3. BREIF PROFILE
                        VStack(alignment: .leading) {
                            Title(title: "한 줄 프로필")
                            
                            CustomTextField(placeholder: "자신을 표현할 한 줄 소개입니다", textInTextField: vm.briefProfile, isFocusing: isProfileFoucsed)
                            
                            NumberOfText(textCount: vm.briefProfileCounted, totalText: "20")
                        }
                        
                        //MARK: - 4. INTRODUCE
                        VStack(alignment: .leading, spacing: 10) {
                            Title(title:"자기소개")
                            
                            CustomTextEditor(textInTextEditor: text, isFocusing: isDescriptionFocused)
                            
                            NumberOfText(textCount: vm.selfDescriptionCounted, totalText: "1000")
                        }
                        
                        //웹사이트
                        VStack(alignment: .leading) {
                            //첫번째 웹사이트
                            Text("웹사이트 연결")
                                .font(.custom("NanumGothicBold", size: 16))
                            ZStack {
                                FirstResponderTextField(text: $snsURL, placeholder: "SNS 또는 홈페이지를 연결해주세요.", font: UIFont(name: "NanumGothicBold", size: 14), isFocused: $isWebsiteFocused)
                                    .foregroundColor(Color("text"))
                                    .padding(16)
                                    .onTapGesture {
                                        
                                    }
                                
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(isWebsiteFocused ? Color.blue : Color("border"), lineWidth: 1)
                                    .frame(width: 340, height: 40)
                                
                            }
                            
                            
                            //두번째 & 세번째 웹사이트
                            
                            VStack(alignment: .leading, spacing: 10) {
                                ForEach(0..<textFieldCount, id: \.self) { i in
                                    HStack(spacing: 10) {
                                        ZStack {
                                            TextField("SNS 또는 홈페이지를 연결해주세요.", text: $textFields[i], onEditingChanged: { isEditing in
                                                if isEditing {
                                                    self.focusedTextField = i
                                                } else {
                                                    self.focusedTextField = -1
                                                }
                                            })
                                            .font(.custom("NanumGothicBold",size: 14))
                                            .padding(.horizontal,24)
                                            
                                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                                .fill(.clear)
                                                .frame(width: 290, height: 40)
                                                .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous)
                                                    .stroke(self.focusedTextField == i ? Color.blue : Color("border"), lineWidth: 1))
                                        }
                                        
                                        Button(action: {
                                            self.textFieldCount -= 1
                                            self.showMaxLimit = false
                                        }) {
                                            Image("trash")
                                                .overlay(RoundedRectangle(cornerRadius: 8).stroke( Color("border"), lineWidth: 1).frame(width:40,height:40))
                                        }
                                    }
                                }
                                
                                Button(action: {
                                    if self.textFieldCount == 2 {
                                        self.showMaxLimit = true
                                    } else {
                                        self.textFieldCount += 1
                                        self.textFields.append("")
                                    }
                                }) {
                                    Text("+웹사이트 추가")
                                        .font(.custom("NanumGothicRegular", size: 12))
                                        .padding(.horizontal,16)
                                }
                                
                                
                                Text("웹사이트는 3개까지 추가 가능합니다")
                                    .font(.custom("NaumGothicRegular", size: 12))
                                    .foregroundColor(.red)
                                    .opacity(self.showMaxLimit ? 1 : 0)
                                    .padding(.horizontal, 16)
                                
                            }
                            .offset(x: -10, y: 0)
                        }
                    }
                    
                    
                    .padding(.top, 24)
                    .padding(.horizontal, 17.5)
                    //네비게이션 바
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar{
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                
                            } label: {
                                Image(systemName: "arrow.left")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 13, height: 11)
                                    .foregroundColor(.black)
                                
                                    .padding(.vertical, 13)
                                    .padding()
                            }
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                
                            } label: {
                                Text("저장")
                                    .font(.custom("NaumGothicRegular ", size: 16))
                                
                            }
                            
                        }
                    }
                }
                
            }
        }
    }
    
    var profileImage : some View {
        ZStack {
            vm.image!
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 0.5))
                .padding(.top, 16)
                .padding(.horizontal, 147.5)
            
            Image(systemName: "camera.fill")
                .renderingMode(.original)
                .resizable()
                .foregroundColor(.white)
                .frame(width:13.33,height:12)
                .background(Circle().fill(Color.blue).frame(width:24,height:24))
                .offset(x: 30, y: 35)
        }
    }

}






















//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
