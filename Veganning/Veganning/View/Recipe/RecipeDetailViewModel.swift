import Foundation
import Combine

class RecipeDetailViewModel: ObservableObject {
    @Published var recipe: RecipeDetailCardModel? = nil  // 단일 객체를 처리하기 위해 옵셔널로 변경
    @Published var errorMessage: String? = nil
    private var cancellables = Set<AnyCancellable>()
    
    func fetchRecipeDetail(status: Int, success: Bool, image: String, name: String, ingredients: [String]) {
        RecipeService.shared.recipeDetail(status: status, success: success, image: image, name: name, ingredients: ingredients) { [weak self] (result: Result<RecipeDetailResponse, RecipeService.NetworkError>) in
            DispatchQueue.main.async {
                guard let self = self else { return }
                switch result {
                case .success(let recipe):
                    // 단일 RecipeDetailResponse를 RecipeDetailCardModel로 매핑
                    let newRecipe = RecipeDetailCardModel(id: recipe.fat, name: recipe.name, description: recipe.description, image: recipe.image, type: recipe.type, carbohydrate: recipe.carbohydrate, calorie: recipe.calorie, protein: recipe.protein, fat: recipe.fat, average_rating: recipe.average_rating
                                                          , ingredients: recipe.ingredients, cookingStep: recipe.cookingStep)
                    
                    self.recipe = newRecipe
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}

