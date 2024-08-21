import SwiftUI

struct RecipeMainView: View {
    @State private var selectedTab: Int = 1
    @State private var selectedFilter: String = ""
    @State private var isShowingRecipeContest: Bool = false
    @StateObject private var viewModel = RecipeViewModel()
    @EnvironmentObject var recipeData: RecipeData
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    // 검색 바
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
                    
                    // 레시피와 내 공모 탭
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
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
                    .background(Color.main)
                    
                    // 조건부 필터 바 표시
                    if selectedTab == 1 {
                        FilterBar(selectedFilter: $selectedFilter)
                    } else {
                        ContestFilterBar(selectedFilter: $selectedFilter)
                    }
                    
                    // 조건부 뷰 표시
                    if selectedTab == 1 {
                        // 레시피 목록 뷰
                        List(recipeData.recipes) { recipe in // 여기서 recipeData.recipes 사용
                            RecipeCardView(recipe: recipe)
                                .padding(.vertical, 15)
                                .background(Color.white)
                                .cornerRadius(10)
                                .contentShape(Rectangle())
                                .listRowInsets(EdgeInsets())
                                .listRowSeparator(.hidden)
                        }
                        .listStyle(PlainListStyle())
                        .padding()
                    } else {
                        // 내 공모 목록 뷰
                        List(recipeData.contests) { contestItem in
                            MyContestCardView(contest: contestItem)
                                .padding(.vertical, 15)
                                .background(Color.white)
                                .cornerRadius(10)
                                .contentShape(Rectangle())
                                .listRowInsets(EdgeInsets())
                                .listRowSeparator(.hidden)
                        }
                        .listStyle(PlainListStyle())
                        .padding()
                    }
                    
                    Spacer()
                }
                
                // 플로팅 버튼 표시 (내 공모 탭에서만)
                if selectedTab == 2 {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Button(action: {
                                isShowingRecipeContest = true
                            }) {
                                Image("floating_button")
                                    .renderingMode(.original)
                                    .frame(width: 60, height: 60)
                                    .padding()
                                    .clipShape(Circle())
                                    .shadow(radius: 2)
                            }
                            .padding()
                            .background(
                                NavigationLink(
                                    destination: RecipeContest(),
                                    isActive: $isShowingRecipeContest,
                                    label: { EmptyView() }
                                )
                            )
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden()
            .onAppear {
//                viewModel.fetchRestaurants()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeMainView()
            .environmentObject(RecipeData())
    }
}

