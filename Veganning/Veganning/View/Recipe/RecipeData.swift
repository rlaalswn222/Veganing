import SwiftUI

class RecipeData: ObservableObject {
    @Published var contests: [MyContestCardModel] = []
    @Published var recipes: [RecipeCardModel] = [
        RecipeCardModel(title: "그리너리 포케", likes: 25, comments: 5, recipeImage: UIImage(named: "food_image"), recipedetail: "야채를 손질해준다."),
        RecipeCardModel(title: "원데이식스밀 국수", likes: 25, comments: 5, recipeImage: UIImage(named: "onedaysixmeal_image"), recipedetail: "야채를 손질해준다."),
        RecipeCardModel(title: "그리너리 포케", likes: 25, comments: 5, recipeImage: UIImage(named: "food_image"), recipedetail: "야채를 손질해준다.")
    ]
}

