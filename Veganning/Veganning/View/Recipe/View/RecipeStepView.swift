import SwiftUI

struct RecipeStepView: View {
    @Binding var steps: [Step]
    @Binding var currentStepIndex: Int?
    @Binding var showImagePicker: Bool
    
    var body: some View {
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
                                                    .padding(6)
                                                    .frame(width: 30, height: 30)
                                                    .foregroundColor(.sub1)
                                                    .background(Circle().fill(Color.grey5))
                                                    .overlay(
                                                        Circle()
                                                            .stroke(Color.sub1, lineWidth: 2)
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
                                                    .padding(6)
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
}

struct RecipeStepView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeStepView(steps: .constant([Step(description: "1. 내용을 입력해주세요", detail: "상세 설명 내용을 적어주세요", image: nil)]),
                       currentStepIndex: .constant(nil),
                       showImagePicker: .constant(false))
    }
}

