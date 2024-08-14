import SwiftUI

struct ContestFinishPopup: View {
    var onCancel: () -> Void
    var onSubmit: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            Text("이대로 공모할까요?")
              .font(
                Font.custom("NanumSquare Neo OTF", size: 16)
                  .weight(.bold)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
            
            Text("‘공모 완료’시 공모가 완료됩니다.")
              .font(Font.custom("NanumSquare Neo OTF", size: 12))
              .foregroundColor(Color(red: 0.57, green: 0.57, blue: 0.57))
            
            HStack(spacing: 20) {
                Button(action: onCancel) {
                    Text("취소하기")
                      .font(
                        Font.custom("NanumSquare Neo OTF", size: 12)
                          .weight(.bold)
                      )
                        .foregroundColor(.black)
                        .padding(.horizontal, 26)
                        .padding(.vertical, 10)
                        .frame(width: 100, height: 25, alignment: .center)
                        .padding()
                        .background(Color.grey2)
                        .cornerRadius(8)
                }
                
                Button(action: onSubmit) {
                    Text("공모 완료")
                      .font(
                        Font.custom("NanumSquare Neo OTF", size: 12)
                          .weight(.bold)
                      )
                      .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                      .padding(.horizontal, 16)
                      .padding(.vertical, 50)
                      .frame(width: 100, height: 25, alignment: .center)
                      .padding()
                      .background(Color.sub1) // 버튼 색상
                      .cornerRadius(8)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 20)
        .frame(width: 300)
    }
}

