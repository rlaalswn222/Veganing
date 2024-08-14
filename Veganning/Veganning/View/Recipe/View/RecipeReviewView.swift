import SwiftUI

struct RecipeReviewView: View {
    let reviewModels: [RecipeReviewModel]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 10) {
                ForEach(reviewModels) { model in
                    RecipeReviewCardView(model: model)
                }
            }
            .padding(.horizontal)
        }
        .padding(.vertical)
    }
}

#Preview {
    RecipeReviewView(reviewModels: [
        RecipeReviewModel(RVreviewerName: "최영우", RVreviewDate: "2024.07.08 (화)", RVrating: 3, RVcomment: "이 식단 맛있네요. 재료도 손쉽게 구할 수 있는 것들뿐이라 입맛 없을 때 해먹기 좋아요."),
        RecipeReviewModel(RVreviewerName: "박지영", RVreviewDate: "2024.07.09 (수)", RVrating: 4, RVcomment: "정말 간편하고 맛있어요! 가족들도 좋아하네요."),
        RecipeReviewModel(RVreviewerName: "김민수", RVreviewDate: "2024.07.10 (목)", RVrating: 5, RVcomment: "재료가 신선하고 레시피가 자세해서 좋았습니다.")
    ])
}

