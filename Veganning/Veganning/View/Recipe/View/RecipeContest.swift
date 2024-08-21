import SwiftUI
import UIKit

struct RecipeContest: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showSubmitPopup = false
    
    @State private var isEditingTitle = false
    @State private var title = "제목을 입력해주세요"
    
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    
    @State private var ingredients = [
        Ingredient(name: "재료", quantity: "개수 혹은 무게를 입력하세요."),
        Ingredient(name: "재료", quantity: "개수 혹은 무게를 입력하세요.")
    ]
    
    @State private var steps = [
        Step(description: "1. 내용을 입력해주세요", detail: "상세 설명 내용을 적어주세요", image: nil)
    ]
    
    @State private var currentStepIndex: Int?
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 0) {
                    ZStack(alignment: .topLeading) {
                        // selectedImage만 변경되도록 처리하고 aspectRatio 추가
                        Image(uiImage: selectedImage ?? UIImage(named: "food_image")!)
                            .resizable()
                            .aspectRatio(contentMode: .fill) // 이미지 비율 유지
                            .frame(height: 416)
                            .clipped()
                        
                        HStack {
                            // 뒤로 가기 버튼
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }) {
                                Image(systemName: "chevron.left")
                                    .resizable()
                                    .frame(width: 12, height: 20)
                                    .foregroundColor(.grey5)
                                    .padding()
                            }
                            .padding(.top, 50)
                            .padding(.leading, 20)
                            
                            Spacer()
                            
                            // 공모하기 버튼
                            Button(action: {
                                showSubmitPopup = true
                            }) {
                                Text("공모완료")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 8)
                                    .background(Color.main)
                                    .cornerRadius(10)
                            }
                            .padding(.top, 50)
                            .padding(.trailing, 20)
                        }
                        VStack(alignment: .leading) {
                            Spacer()
                            VStack(alignment: .leading) {
                                HStack {
                                    Button(action: {
                                        // 버튼 클릭 액션
                                    }) {
                                        Text("비건 정도를 입력하세요")
                                            .padding(.horizontal, 20)
                                            .padding(.vertical, 6)
                                            .foregroundColor(.sub1)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(Color.sub1, lineWidth: 1)
                                            )
                                    }
                                    Spacer()
                                }
                                .padding(.horizontal, 21)
                                .padding(.top, 91)
                                
                                VStack(alignment: .leading) {
                                    HStack {
                                        if isEditingTitle {
                                            TextField("제목을 입력해주세요", text: $title, onCommit: {
                                                isEditingTitle = false
                                            })
                                            .textFieldStyle(RoundedBorderTextFieldStyle())
                                            .padding(.horizontal, 21)
                                        } else {
                                            Text(title)
                                                .font(.title)
                                                .bold()
                                                .onTapGesture {
                                                    isEditingTitle = true
                                                }
                                                .padding(.horizontal, 21)
                                        }
                                        Spacer()
                                        Button(action: {
                                            // 이미지 선택기를 표시하는 액션
                                            showImagePicker = true
                                        }) {
                                            Image(systemName: "camera")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 20, height: 20)
                                                .foregroundColor(Color(red: 0.8, green: 1.0, blue: 0))
                                                .padding(10)
                                                .background(Color.black)
                                                .clipShape(Circle())
                                                .overlay(
                                                    Circle()
                                                        .stroke(Color(red: 0.8, green: 1.0, blue: 0), lineWidth: 2)
                                                )
                                        }
                                        .padding(.trailing, 21)
                                    }
                                }
                                .padding(.bottom, 30)
                            }
                        }
                    }
                    .frame(height: 416) // 이미지 프레임 고정
                    
                    Spacer()
                    
                    // Recipe Tabs
                    VStack {
                        HStack(spacing: 40) {
                            VStack {
                                ZStack {
                                    Circle()
                                        .fill(Color(red: 0.8, green: 1.0, blue: 0))
                                        .frame(width: 30, height: 30)
                                    Text("1")
                                        .foregroundColor(.black)
                                        .font(.headline)
                                }
                                Text("재료준비")
                                    .font(Font.custom("NanumSquare Neo OTF", size: 12).weight(.bold))
                                    .foregroundColor(.green)
                            }
                            
                            VStack {
                                ZStack {
                                    Circle()
                                        .fill(Color(red: 0.8, green: 1.0, blue: 0))
                                        .frame(width: 30, height: 30)
                                    Text("2")
                                        .foregroundColor(.black)
                                        .font(.headline)
                                }
                                Text("레시피")
                                    .font(Font.custom("NanumSquare Neo OTF", size: 12))
                                    .foregroundColor(.gray)
                            }
                            
                            VStack {
                                ZStack {
                                    Circle()
                                        .fill(Color(red: 0.8, green: 1.0, blue: 0))
                                        .frame(width: 30, height: 30)
                                    Text("3")
                                        .foregroundColor(.black)
                                        .font(.headline)
                                }
                                Text("리뷰")
                                    .font(Font.custom("NanumSquare Neo OTF", size: 12))
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.horizontal)
                        .offset(y: 0)
                    }
                    .padding(.top, -20)
                    
                    // Recipe Ingredients
                    VStack(alignment: .leading) {
                        HStack {
                            Text("재료 준비")
                                .font(Font.custom("NanumSquare Neo OTF", size: 16).weight(.heavy))
                                .padding(.vertical, 5)
                            Text("1인분 기준")
                                .font(Font.custom("NanumSquare Neo OTF", size: 11))
                                .foregroundColor(.gray)
                        }
                        
                        ForEach($ingredients) { $ingredient in
                            HStack {
                                TextField("재료 이름", text: $ingredient.name)
                                    .padding(10)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .frame(width: 52, height: 32)
                                    .shadow(radius: 1)
                                    .font(Font.custom("NanumSquare Neo OTF", size: 12).weight(.bold))
                                
                                TextField("개수 혹은 무게를 입력하세요", text: $ingredient.quantity)
                                    .padding(10)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .frame(width: 298, height: 32)
                                    .shadow(radius: 1)
                                    .foregroundColor(.grey5)
                                    .font(Font.custom("NanumSquare Neo OTF", size: 12))
                            }
                            .padding(.vertical, 2)
                        }
                        
                        Spacer()
                        
                        Text("레시피 영양소")
                            .font(Font.custom("NanumSquare Neo OTF", size: 16).weight(.heavy))
                            .padding(.vertical, 5)
                        
                        HStack {
                            Text("탄수화물")
                                .font(Font.custom("NanumSquare Neo OTF", size: 12).weight(.bold))
                            
                            Spacer()
                            HStack {
                                TextField("", text: .constant(""))
                                    .textFieldStyle(PlainTextFieldStyle())
                                    .font(Font.custom("NanumSquare Neo OTF", size: 14))
                                    .background(Color.white)
                                    .cornerRadius(4)
                                    .frame(width: 248, height: 32)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 4)
                                            .inset(by: 0.5)
                                            .stroke(Color.grey2, lineWidth: 1)
                                    )
                                
                                Text("    g")
                                    .font(Font.custom("NanumSquare Neo OTF", size: 12))
                                    .padding(.trailing, 10)
                                    .foregroundColor(.black)
                            }
                            .frame(width: 298, height: 32)
                        }
                        
                        HStack {
                            Text("단백질")
                                .font(Font.custom("NanumSquare Neo OTF", size: 12).weight(.bold))
                            Spacer()
                            HStack {
                                TextField("", text: .constant(""))
                                    .textFieldStyle(PlainTextFieldStyle())
                                    .font(Font.custom("NanumSquare Neo OTF", size: 14))
                                    .background(Color.white)
                                    .cornerRadius(4)
                                    .frame(width: 248, height: 32)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 4)
                                            .inset(by: 0.5)
                                            .stroke(Color.grey2, lineWidth: 1)
                                    )
                                
                                Text("    g")
                                    .font(Font.custom("NanumSquare Neo OTF", size: 12))
                                    .padding(.trailing, 10)
                            }
                            .frame(width: 298, height: 32)
                        }
                        
                        HStack {
                            Text("지방")
                                .font(Font.custom("NanumSquare Neo OTF", size: 12).weight(.bold))
                            Spacer()
                            HStack {
                                TextField("", text: .constant(""))
                                    .textFieldStyle(PlainTextFieldStyle())
                                    .font(Font.custom("NanumSquare Neo OTF", size: 14))
                                    .background(Color.white)
                                    .cornerRadius(4)
                                    .frame(width: 248, height: 32)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 4)
                                            .inset(by: 0.5)
                                            .stroke(Color.grey2, lineWidth: 1)
                                    )
                                
                                Text("    g")
                                    .font(Font.custom("NanumSquare Neo OTF", size: 12))
                                    .padding(.trailing, 10)
                            }
                            .frame(width: 298, height: 32)
                        }
                        
                        HStack {
                            Text("칼로리")
                                .font(Font.custom("NanumSquare Neo OTF", size: 12).weight(.bold))
                            Spacer()
                            HStack {
                                TextField("", text: .constant(""))
                                    .textFieldStyle(PlainTextFieldStyle())
                                    .font(Font.custom("NanumSquare Neo OTF", size: 10))
                                    .background(Color.white)
                                    .cornerRadius(4)
                                    .frame(width: 248, height: 32)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 4)
                                            .inset(by: 0.5)
                                            .stroke(Color.grey2, lineWidth: 1)
                                    )
                                
                                Text("Kcal")
                                    .font(Font.custom("NanumSquare Neo OTF", size: 12))
                                    .padding(.trailing, 10)
                            }
                            .frame(width: 298, height: 32)
                        }
                    }
                    .padding(.horizontal, 21)
                    .padding(.vertical, 10)
                    
                    // RecipeStepView 호출
                    RecipeStepView(steps: $steps, currentStepIndex: $currentStepIndex, showImagePicker: $showImagePicker)
                }
                .sheet(isPresented: $showImagePicker) {
                    ImagePicker(selectedImage: Binding(
                        get: {
                            if let currentStepIndex = currentStepIndex {
                                return steps[currentStepIndex].image
                            }
                            return selectedImage
                        },
                        set: { newImage in
                            if let currentStepIndex = currentStepIndex {
                                steps[currentStepIndex].image = newImage
                            } else {
                                selectedImage = newImage
                            }
                        }
                    ))
                }
            }
            
            // 팝업창이 표시될 때
            if showSubmitPopup {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all) // 배경 어둡게 처리
                
                ContestFinishPopup(
                    onCancel: {
                        showSubmitPopup = false
                    },
                    onSubmit: {
                        showSubmitPopup = false
                        submitContest()
                    }
                )
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    func submitContest() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct RecipeContest_Previews: PreviewProvider {
    static var previews: some View {
        RecipeContest()
    }
}

