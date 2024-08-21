import SwiftUI
import UIKit

struct RecipeContest: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var recipeData: RecipeData
    
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
                        Image(uiImage: selectedImage ?? UIImage(named: "food_image")!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 416)
                            .clipped()
                        
                        HStack {
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
                    .frame(height: 416)
                    
                    Spacer()
                    
                    VStack {
                        // Other content
                    }
                    
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
            
            if showSubmitPopup {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                
                ContestFinishPopup(
                    onCancel: {
                        showSubmitPopup = false
                    },
                    onSubmit: {
                        let newContest = MyContestCardModel(
                            MCtitle: title,
                            MClikes: 0,
                            MCcomments: 0,
                            MCrecipedetail: steps.map { $0.description }.joined(separator: ", "),
                            MCrecipeImage: selectedImage
                        )
                        recipeData.contests.append(newContest)
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
            .environmentObject(RecipeData())
    }
}

