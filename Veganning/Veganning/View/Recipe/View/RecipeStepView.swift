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
                    ZStack(alignment: .topTrailing) {
                        if let image = steps[index].image {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 150)
                                .cornerRadius(10)
                                .clipped()
                        } else {
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(height: 150)
                                .cornerRadius(10)
                        }
                        
                        VStack {
                            Button(action: {
                                steps.remove(at: index)
                            }) {
                                Image(systemName: "minus.circle")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.sub1)
                            }
                            .padding(.top, 8)
                            .padding(.trailing, 8)
                            

                            
                            Button(action: {
                                currentStepIndex = index
                                showImagePicker = true
                            }) {
                                Image(systemName: "camera")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.sub1)
                            }
                            .padding(.bottom, 8)
                            .padding(.trailing, 8)
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
        RecipeStepView(
            steps: .constant([Step(description: "1. 내용을 입력해주세요", detail: "상세 설명 내용을 적어주세요", image: nil)]),
            currentStepIndex: .constant(nil),
            showImagePicker: .constant(false)
        )
    }
}

