import SwiftUI

class RecipeData: ObservableObject {
    @Published var contests: [MyContestCardModel] = []
    @Published var recipes: [RecipeCardModel] = [] // 새로운 속성 추가
}

