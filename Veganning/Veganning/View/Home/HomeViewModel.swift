//
//  HomeViewModel.swift
//  Veganning
//
//  Created by 김민솔 on 8/22/24.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @Published var restaurants: [Restaurant] = []
    private var cancellables = Set<AnyCancellable>()

    func fetchRestaurants() {
        HomeService.shared.getWeeklyStore { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                switch result {
                case .success(let weeklyStores):
                    // 로그에 서버 응답 직접 출력
                    print("Weekly Stores Response: \(weeklyStores)")

                    let newCell = weeklyStores.map { store in
                        Restaurant(
                            id: store.id,
                            name: store.name,
                            address: store.address,
                            open: store.open,
                            rating: store.rating,
                            isOpen: store.isOpen,
                            image: store.image ?? ""
                        )
                    }

                    print("Mapped Restaurants: \(newCell)")
                    // restaurants 배열 업데이트
                    self.restaurants = newCell
                case .failure(let error):
                    print("Error loading home: \(error.localizedDescription)")
                }
            }
        }
    }
}

