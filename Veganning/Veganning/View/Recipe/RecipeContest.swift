import SwiftUI
import UIKit

// UIImagePickerController를 사용하여 이미지를 선택하는 기능을 제공하는 struct
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var presentationMode
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.selectedImage = uiImage
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}

// 재료를 관리하는 구조체
struct Ingredient: Identifiable {
    var id = UUID()
    var name: String
    var quantity: String
}

struct Step: Identifiable {
    var id = UUID()
    var description: String
    var detail: String
    var image: UIImage?
}

struct RecipeContest: View {
    
    // 뒤로 가기 버튼을 구현하려고 추가한 코드
    @Environment(\.presentationMode) var presentationMode
    
    @State private var isEditingTitle = false
    @State private var title = "제목을 입력해주세요"
    
    // 이미지 선택기를 위한 상태 변수
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    
    // 재료 목록을 위한 상태 변수
    @State private var ingredients = [
        Ingredient(name: "재료", quantity: "개수 혹은 무게를 입력하세요."),
        Ingredient(name: "재료", quantity: "개수 혹은 무게를 입력하세요.")
        
    ]
    
    // 레시피 단계 목록을 위한 상태 변수
    @State private var steps = [
        Step(description: "1. 내용을 입력해주세요", detail: "상세 설명 내용을 적어주세요", image: nil)
    ]
    
    @State private var currentStepIndex: Int?
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    ZStack(alignment: .topLeading) {
                        
                        if let selectedImage = selectedImage {
                            Image(uiImage: selectedImage) // 사용자가 선택한 이미지를 표시
                                .resizable()
                                .scaledToFill()
                                .frame(height: 416)
                                .clipped()
                        } else {
                            Image("food_image") // 기본 배경 이미지
                                .resizable()
                                .scaledToFill()
                                .frame(height: 416)
                                .clipped()
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
                                .padding(.top, 91) // 기존 + 70포인트 이동
                                
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
                    .frame(height: 416)
                    
                    Spacer()
                    
                    // Recipe Tabs
                    VStack {
                        HStack(spacing: 40) { // 양옆에 약간만 떨어지게 조정
                            VStack {
                                ZStack {
                                    Circle()
                                        .fill(Color(red: 0.8, green: 1.0, blue: 0)) // 원의 배경색
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
                                        .fill(Color(red: 0.8, green: 1.0, blue: 0)) // 원의 배경색
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
                                        .fill(Color(red: 0.8, green: 1.0, blue: 0)) // 원의 배경색
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
                        .offset(y: 0) // 탭을 조금 더 아래로 조정
                    }
                    .padding(.top, -20) // 이미지를 가리지 않도록 상단 패딩 조정
                    
                    // Recipe Ingredients
                    VStack(alignment: .leading) {
                        HStack {
                            Text("재료 준비")
                                .font(
                                Font.custom("NanumSquare Neo OTF", size: 16)
                                .weight(.heavy)
                                )
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
                        // 레시피 영양소 부분
                        Spacer()
                        
                        Text("레시피 영양소")
                            .font(
                            Font.custom("NanumSquare Neo OTF", size: 16)
                            .weight(.heavy)
                            )
                            .padding(.vertical, 5)
                        HStack {
                            Text("탄수화물")
                                .font(
                                Font.custom("NanumSquare Neo OTF", size: 12)
                                .weight(.bold)
                                )
                                
                            Spacer()
                            HStack {
                                TextField("", text: .constant(""))
                                    .textFieldStyle(PlainTextFieldStyle())
                                    .font(Font.custom("NanumSquare Neo OTF", size: 14))
                                    .background(Color.white)
                                    .cornerRadius(4)
                                    .frame(width: 248, height: 32) // Adjust width to accommodate "g" label
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
                                .font(
                                Font.custom("NanumSquare Neo OTF", size: 12)
                                .weight(.bold)
                                )
                            Spacer()
                            HStack {
                                TextField("", text: .constant(""))
                                    .textFieldStyle(PlainTextFieldStyle())
                                    .font(Font.custom("NanumSquare Neo OTF", size: 14))
                                    .background(Color.white)
                                    .cornerRadius(4)
                                    .frame(width: 248, height: 32) // Adjust width to accommodate "g" label
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
                                .font(
                                Font.custom("NanumSquare Neo OTF", size: 12)
                                .weight(.bold)
                                )
                            Spacer()
                            HStack {
                                TextField("", text: .constant(""))
                                    .textFieldStyle(PlainTextFieldStyle())
                                    .font(Font.custom("NanumSquare Neo OTF", size: 14))
                                    .background(Color.white)
                                    .cornerRadius(4)
                                    .frame(width: 248, height: 32) // Adjust width to accommodate "g" label
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 4)
                                            .inset(by: 0.5)
                                            .stroke(Color.grey2, lineWidth: 1)
                                    )

                                Text("    g")
                                    .font(Font.custom("NanumSquare Neo OTF", size: 12))
                                    .padding(.trailing, 10) // Adjust padding as needed
                            }
                            .frame(width: 298, height: 32)
                        }
                        HStack {
                            Text("칼로리")
                                .font(
                                Font.custom("NanumSquare Neo OTF", size: 12)
                                .weight(.bold)
                                )
                            Spacer()
                            HStack {
                                TextField("", text: .constant(""))
                                    .textFieldStyle(PlainTextFieldStyle())
                                    .font(Font.custom("NanumSquare Neo OTF", size: 10))
                                    .background(Color.white)
                                    .cornerRadius(4)
                                    .frame(width: 248, height: 32) // Adjust width to accommodate "g" label
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 4)
                                            .inset(by: 0.5)
                                            .stroke(Color.grey2, lineWidth: 1)
                                    )

                                Text("Kcal")
                                    .font(Font.custom("NanumSquare Neo OTF", size: 12))
                                    .padding(.trailing, 10) // Adjust padding as needed
                            }
                            .frame(width: 298, height: 32)
                        }
                    }
                    .padding(.horizontal, 21)
                    .padding(.vertical, 10)
                    
                   
                    
                        
                   
                    
                    // 레시피 단계 추가하기 버튼
                    VStack(alignment: .leading) {
                        HStack {
                            Text("레시피")
                                .font(Font.custom("NanumSquare Neo OTF", size: 16).weight(.bold))
                            Spacer()
                            Button(action: {
                                steps.append(Step(description: "새 단계", detail: "상세 설명을 입력하세요", image: nil))
                            }) {
                                Text("추가하기")
                                    .font(Font.custom("NanumSquare Neo OTF", size: 14).weight(.bold))
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 6)
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 10)
                        
                        ForEach(steps.indices, id: \.self) { index in
                            VStack {
                                ZStack {
                                    if let image = steps[index].image {
                                        Image(uiImage: image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 150)
                                            .cornerRadius(10)
                                            .overlay(
                                                HStack {
                                                   
                                                    VStack {
                                                        Button(action: {
                                                            steps.remove(at: index)
                                                        }) {
                                                            Image(systemName: "minus.circle")
                                                                .resizable()
                                                                .frame(width: 20, height: 20)
                                                                .foregroundColor(.sub1)
                                                        }
                                                        .padding()
                                                        Spacer()
                                                        Button(action: {
                                                            currentStepIndex = index
                                                            showImagePicker = true
                                                        }) {
                                                            Image(systemName: "camera")
                                                                .resizable()
                                                                .frame(width: 20, height: 20)
                                                                .foregroundColor(.sub1)
                                                        }
                                                        .padding()
                                                    }
                                                }
                                            )
                                    } else {
                                        Rectangle()
                                            .fill(Color.gray.opacity(0.3))
                                            .frame(height: 150)
                                            .cornerRadius(10)
                                            .overlay(
                                                HStack {
                                                    Spacer()
                                                    VStack {
                                                        Button(action: {
                                                            steps.remove(at: index)
                                                        }) {
                                                            Image(systemName: "minus")
                                                                .resizable()
                                                                .scaledToFit()
                                                                .padding(6) // 아이콘이 원 안에서 잘리지 않도록 여유 공간 추가
                                                                .frame(width: 30, height: 30)
                                                                .foregroundColor(.sub1)
                                                                .background(Circle().fill(Color.grey5)) // 배경을 grey5 색상의 원으로 설정
                                                                .overlay(
                                                                    Circle()
                                                                        .stroke(Color.sub1, lineWidth: 2) // 원의 테두리 설정
                                                                )
                                                        }

                                                       
                                                        Spacer()
                                                        
                                                        Button(action: {
                                                            currentStepIndex = index
                                                            showImagePicker = true
                                                        }) {
                                                            Image(systemName: "camera")
                                                                .resizable()
                                                                .scaledToFit()
                                                                .padding(6) // 원 안에서 이미지가 잘리지 않도록 여유 공간을 추가
                                                                .frame(width: 30, height: 30)
                                                                .foregroundColor(.sub1)
                                                                .background(Circle().fill(Color.grey5))
                                                                .overlay(
                                                                    Circle()
                                                                        .stroke(Color.sub1, lineWidth: 2)
                                                                )
                                                        }



                                                    }
                                                   
                                                }.padding()
                                            )
                                    }
                                }

                                VStack(alignment: .leading) {
                                    TextField("단계 설명을 입력하세요", text: $steps[index].description)
                                        .font(Font.custom("NanumSquare Neo OTF", size: 14).weight(.bold))
                                        .padding(.bottom, 5)
                                    TextField("상세 설명을 입력하세요", text: $steps[index].detail)
                                        .font(Font.custom("NanumSquare Neo OTF", size: 12))
                                        .foregroundColor(.gray)
                                }
                                .padding(.horizontal)
                            }
                            .padding(.bottom, 10)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 1)
                        }
                    }
                    .padding()
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
        }.navigationBarBackButtonHidden()
    }
}

struct RecipeContest_Previews: PreviewProvider {
    static var previews: some View {
        RecipeContest()
    }
}

