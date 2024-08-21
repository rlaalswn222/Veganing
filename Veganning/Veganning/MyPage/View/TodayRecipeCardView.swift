import SwiftUI

struct TodayRecipeCardView: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            // Card background with shadow and corner radius
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                .frame(height: 122)
            
            VStack(alignment: .leading, spacing: 10) {
                // Date and Day
                Text("2024.08.22 TUE")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding(.top, 15)
                    .padding(.leading, 15)
                
                // Meal title
                Text("식단")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .padding(.leading, 15)
                
                // Meal items
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("그리너리 포케 식단")
                            .font(Font.custom("NanumSquare Neo OTF", size: 10).weight(.black))
                        Text("완두콩 가득 볶음밥")
                            .font(Font.custom("NanumSquare Neo OTF", size: 10).weight(.black))
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        Text("두부링 푸딩")
                            .font(Font.custom("NanumSquare Neo OTF", size: 10).weight(.black))
                        Text("원데이식스밀 국수")
                            .font(Font.custom("NanumSquare Neo OTF", size: 10).weight(.black))
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        Text("비거니즘 아이스크림")
                            .font(Font.custom("NanumSquare Neo OTF", size: 10).weight(.black))
                        Text("두부링 푸딩")
                            .font(Font.custom("NanumSquare Neo OTF", size: 10).weight(.black))
                    }
                }
                .foregroundColor(.black)
                .padding(.leading, 15)
            }
            
            // Stamp overlay in the top-right corner
            Image("mission")  // Replace with the correct asset name
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .rotationEffect(.degrees(-15))
                .position(x: UIScreen.main.bounds.width - 60, y: 20) 
        }
        .padding(.horizontal)
    }
}

#Preview {
    TodayRecipeCardView()
}
