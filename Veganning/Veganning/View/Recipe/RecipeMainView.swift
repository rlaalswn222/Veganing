import SwiftUI

struct RecipeMainView: View {
    @State private var selectedTab: Int = 1
    @State private var selectedFilter: String = ""
    @State private var selectedBottomTab = 1

    let recipes = [
        RecipeCardModel(title: "그리너리 포케", likes: 25, comments: 5),
        RecipeCardModel(title: "그리너리 포케", likes: 25, comments: 5),
        RecipeCardModel(title: "그리너리 포케", likes: 25, comments: 5)
    ]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HStack {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(height: 45)
                            .background(Color.white)
                            .cornerRadius(7)
                        
                        HStack {
                            TextField("‘두부면’ 검색하여 두부면 식단 찾아보기", text: .constant(""))
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
                    .padding(.top, 10)
                    .background(Color.main)
                }
                
                HStack(spacing: 14) {
                    Button(action: {
                        selectedTab = 1
                    }) {
                        Text("레시피")
                            .font(Font.custom("NanumSquare Neo OTF", size: 20).weight(.black))
                            .foregroundColor(selectedTab == 1 ? .main : .white)
                            .padding()
                            .background(selectedTab == 1 ? Color.white : Color.clear)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        selectedTab = 2
                    }) {
                        Text("내 공모")
                            .font(Font.custom("NanumSquare Neo OTF", size: 20).weight(.black))
                            .foregroundColor(selectedTab == 2 ? .main : .white)
                            .padding()
                            .background(selectedTab == 2 ? Color.white : Color.clear)
                            .cornerRadius(10)
                    }
                }
                .padding()
                .background(Color.main)
                
                FilterBar(selectedFilter: $selectedFilter)
                
                List(recipes) { recipe in
                    NavigationLink(destination: RecipeDetailView()) {
                        RecipeCardView(recipe: recipe)
                            .padding(.vertical, 15)
                            .background(Color.white)
                            .cornerRadius(10)
                            .contentShape(Rectangle())
                    }
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
                }
                .listStyle(PlainListStyle())
                
                Spacer()
            }
            .navigationBarBackButtonHidden()
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeMainView()
    }
}

