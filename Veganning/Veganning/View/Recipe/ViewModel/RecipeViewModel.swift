//
//  RecipeViewModel.swift
//  Veganning
//
//  Created by 김민솔 on 8/22/24.
//

import Foundation
import Combine

class RecipeViewModel: ObservableObject {
    @Published var restaurants: [Restaurant] = []
//    private var cancellables = Set<AnyCancellable>()
//
//    func fetchRestaurants() {
//        
//        RecipeService.shared.recipeList(type: <#T##String#>, fromerecruite: ) { [weak self] result in
//            DispatchQueue.main.async {
//                guard let self = self else { return }
//                switch result {
//                case .success(let recipeList):
//                    // 로그에 서버 응답 직접 출력
//                    print("Weekly Stores Response: \(weeklyStores)")
//
//                    let newCell = recipeList.map { recipeList in
//                        //안에 넣을 데이터
//                        //model 값에다 response 매칭을 시켜야 한다.
//                        RecipeCardModel(title: recipeList.name, likes: recipeList.step_number_1, comments: <#T##Int#>, recipedetail: <#T##String#>)
//                    }
//
//                    print("Mapped Restaurants: \(newCell)")
//                    // restaurants 배열 업데이트
//                    self.restaurants = newCell
//                case .failure(let error):
//                    print("Error loading home: \(error.localizedDescription)")
//                }
//            }
//        }
//    }
    
}
