import SwiftUI

struct RecipeReviewView: View {
    let reviewModels: [RecipeReviewModel]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 10) {
                // 리뷰 요약 뷰 추가
                ReviewSummaryView()
                
                // 리뷰 카드 뷰 추가
                ForEach(reviewModels) { model in
                    RecipeReviewCardView(model: model)
                }
            }
            .padding(.horizontal)
        }
        .padding(.vertical)
        .navigationBarItems(leading: BackButtonView())
    }
}

// 뒤로가기 버튼 뷰 정의
struct BackButtonView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
                Text("리뷰")
                    .foregroundColor(.black)
            }
        }
    }
}

// 리뷰 요약 뷰 정의
struct ReviewSummaryView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            
            // 평점 요약
            HStack {
                VStack(alignment: .leading) {
                    Text("5.0")
                        .font(.system(size: 48, weight: .bold))
                    HStack(spacing: 4) {
                        ForEach(0..<3) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                        ForEach(0..<2) { _ in
                            Image(systemName: "star")
                                .foregroundColor(.gray)
                        }
                    }
                }
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("매우 만족")
                        Spacer()
                        Text("280")
                    }
                    .padding(.vertical, 2)
                    
                    HStack {
                        Text("만족")
                        Spacer()
                        Text("0")
                    }
                    .padding(.vertical, 2)
                    
                    HStack {
                        Text("보통")
                        Spacer()
                        Text("73")
                    }
                    .padding(.vertical, 2)
                    
                    HStack {
                        Text("별로")
                        Spacer()
                        Text("4")
                    }
                    .padding(.vertical, 2)
                    
                    HStack {
                        Text("매우 별로")
                        Spacer()
                        Text("0")
                    }
                    .padding(.vertical, 2)
                }
                .frame(maxWidth: 150)
            }
            .padding()
            
            Divider()
            
            // 추천순 버튼
            Button(action: {
                // 추천순 버튼에 대한 액션 추가
            }) {
                Text("추천순")
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                    .foregroundColor(.main)
                    .cornerRadius(10)
                    .overlay(
                    RoundedRectangle(cornerRadius: 47.92879)
                    .inset(by: 0.5)
                    .stroke(lineWidth: 1))
                    .foregroundColor(.main)
            }
            .padding(.vertical)
        }
    }
}

#Preview {
    NavigationView {
        RecipeReviewView(reviewModels: [
            RecipeReviewModel(RVreviewerName: "최영우", RVreviewDate: "2024.07.08 (화)", RVrating: 3, RVcomment: "이 식단 맛있네요. 재료도 손쉽게 구할 수 있는 것들뿐이라 입맛 없을 때 해먹기 좋아요."),
            RecipeReviewModel(RVreviewerName: "박지영", RVreviewDate: "2024.07.09 (수)", RVrating: 4, RVcomment: "정말 간편하고 맛있어요! 가족들도 좋아하네요."),
            RecipeReviewModel(RVreviewerName: "김민수", RVreviewDate: "2024.07.10 (목)", RVrating: 5, RVcomment: "재료가 신선하고 레시피가 자세해서 좋았습니다.")
        ])
    }
}

