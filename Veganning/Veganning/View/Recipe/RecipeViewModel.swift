
import Foundation
import Combine

class RecipeViewModel: ObservableObject {
    @Published var recipes: [RecipeCardModel] = []  // 이미 정의된 RecipeCardModel 사용
    @Published var errorMessage: String? = nil
    private var cancellables = Set<AnyCancellable>()
    
    func fetchRecipes(type: String, fromrecruit: Bool) {
        RecipeService.shared.recipeList(type: type, fromerecruite: fromrecruit) { [weak self] (result: Result<[RecipeListResponse], RecipeService.NetworkError>) in
            DispatchQueue.main.async {
                guard let self = self else { return }
                switch result {
                case .success(let recipeList):
                    // 응답 데이터를 RecipeCardModel로 매핑
                    let newRecipes = recipeList.map { recipe in
                        RecipeCardModel(id: recipe.id, name: recipe.name, image: recipe.image, step_number_1: recipe.step_number_1, description_1: recipe.description_1, step_number_2: recipe.step_number_2, description_2: recipe.description_2
                        )
                    }
                    
                    self.recipes = newRecipes
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
