import SwiftUI

struct RecipeDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    let recipe: RecipeDetailCardModel // 외부에서 전달된 recipe 모델
    
    // 리뷰 데이터
    let reviewModels = [
        RecipeReviewModel(RVreviewerName: "최영우", RVreviewDate: "2024.07.08 (화)", RVrating: 3, RVcomment: "이 식단 맛있네요. 재료도 손쉽게 구할 수 있는 것들뿐이라 입맛 없을 때 해먹기 좋아요."),
        RecipeReviewModel(RVreviewerName: "박지영", RVreviewDate: "2024.07.09 (수)", RVrating: 4, RVcomment: "정말 간편하고 맛있어요! 가족들도 좋아하네요."),
        RecipeReviewModel(RVreviewerName: "김민수", RVreviewDate: "2024.07.10 (목)", RVrating: 5, RVcomment: "재료가 신선하고 레시피가 자세해서 좋았습니다.")
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ZStack(alignment: .top) {
                    Image("food_image") // 배경 이미지 설정
                        .resizable()
                        .scaledToFill()
                        .frame(height: 416)
                        .clipped()
                    
                    VStack {
                        // 검색 바와 뒤로 가기 버튼
                        HStack {
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }) {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.black)
                            }
                            
                            Spacer()
                            
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(height: 45)
                                    .background(Color.white.opacity(0.7))
                                    .cornerRadius(7)
                                
                                HStack {
                                    TextField("검색하여 두부면 식단 찾아보기", text: .constant(""))
                                        .padding(.leading, 10)
                                        .padding(.vertical, 8)
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        // 검색 버튼 클릭 액션
                                    }) {
                                        Image(systemName: "magnifyingglass")
                                            .foregroundColor(.black)
                                            .padding(.trailing, 10)
                                    }
                                }
                                .padding(.horizontal, 10)
                            }
                            .padding(.horizontal)
                        }
                        .padding()
                        
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Text(recipe.type) // Recipe의 타입을 표시
                                    .padding(10)
                                    .background(Color(red: 0.8, green: 1.0, blue: 0))
                                    .cornerRadius(20)
                                    .foregroundColor(.black)
                                Text("HOT")
                                    .padding(10)
                                    .background(Color(red: 0.8, green: 1.0, blue: 0))
                                    .cornerRadius(20)
                                    .foregroundColor(.black)
                                Spacer()
                            }
                            .padding(.horizontal)
                            
                            VStack(alignment: .leading) {
                                Text(recipe.name)
                                    .font(.title)
                                    .bold()
                                HStack {
                                    ForEach(0..<Int(recipe.average_rating)) { _ in
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.yellow)
                                    }
                                    ForEach(0..<(5 - Int(recipe.average_rating))) { _ in
                                        Image(systemName: "star")
                                            .foregroundColor(.yellow)
                                    }
                                }
                            }
                            .padding(.horizontal)
                            .padding(15)
                        }
                    }
                }
                .frame(height: 416)
                Spacer()
                
                // Recipe Tabs
                VStack {
                    HStack(spacing: 40) {
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
                                .font(.subheadline)
                                .foregroundColor(.gray)
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
                                .font(.subheadline)
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
                                .font(.subheadline)
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
                        Text("재료준비")
                            .font(.headline)
                            .padding(.vertical, 5)
                        Spacer()
                        Text("1인분 기준")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    ForEach(recipe.ingredients, id: \.self) { ingredient in
                        HStack {
                            Text(ingredient)
                            Spacer()
                            Text("적당량")  // 이 부분은 적절히 수정 필요
                        }
                        .padding(.vertical, 2)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 1)
                .padding()
                
                // Recipe Instructions
                VStack(alignment: .leading) {
                    ForEach(recipe.cookingStep, id: \.self) { step in
                        Text(step)
                            .padding(.vertical, 2)
                    }
                }
                .padding()
                
                // Reviews Section
                HStack {
                    Text("리뷰")
                        .font(.headline)
                    Text("127") // 리뷰 갯수
                    NavigationLink(destination: RecipeReviewView(reviewModels: reviewModels)) {
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(reviewModels) { model in
                            RecipeReviewCardView(model: model)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical)
                
                // Recommended Dishes
                VStack(alignment: .leading) {
                    HStack {
                        Text(recipe.name).foregroundColor(.main)
                        Text("와 유사한 추천 식단")
                    }
                    .padding(.leading)
                   
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(recommendModels) { model in
                                RecommendRecipeCardView(model: model)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.vertical)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    // RecipeDetailCardModel의 샘플 데이터를 사용하여 미리보기
    let sampleRecipe = RecipeDetailCardModel(
        id: 1,
        name: "Sample Recipe",
        description: "Delicious and easy to make!",
        image: "sample_image",
        type: "Vegetarian",
        carbohydrate: 30,
        calorie: 250,
        protein: 10,
        fat: 5,
        average_rating: 4,
        ingredients: ["Tomatoes", "Cheese", "Basil"],
        cookingStep: ["Slice tomatoes", "Add cheese", "Garnish with basil"]
    )
    return RecipeDetailView(recipe: sampleRecipe)
}

