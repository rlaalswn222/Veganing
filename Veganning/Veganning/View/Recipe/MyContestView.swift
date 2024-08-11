import SwiftUI

struct MyContestView: View {
    @State private var selectedTab: Int = 1
    @State private var selectedFilter: String = ""
    @State private var selectedBottomTab = 1
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) { // VStack에 spacing을 0으로 설정
                           // Search Bar
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
                           
                // Tabs
                HStack {
                    Spacer()
                    NavigationLink(destination: RecipeMainView()) {
                        VStack {
                            Text("레시피")
                                .font(Font.custom("NanumSquare Neo OTF", size: 20).weight(.black))
                                .foregroundColor(selectedTab == 1 ? .white : .main)
                                .padding()
                                .background(selectedTab == 1 ? Color.clear : Color.white)
                                .cornerRadius(10)
                        }
                    }
                    .isDetailLink(false) // 추가: 이 링크가 디테일 뷰가 아님을 지정
                    Spacer()
                    NavigationLink(destination: MyContestView()) {
                        VStack {
                            Text("내 공모")
                                .font(Font.custom("NanumSquare Neo OTF", size: 20).weight(.black))
                                .foregroundColor(selectedTab == 2 ? .white : .main)
                                .padding()
                                .background(selectedTab == 2 ? Color.clear : Color.white)
                                .cornerRadius(10)
                        }
                    }
                    .isDetailLink(false) // 추가: 이 링크가 디테일 뷰가 아님을 지정
                    Spacer()
                }
                .padding()
                .background(Color.main)


                
                // Filter Bar
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .center, spacing: 10) {
                        Button(action: {
                            selectedFilter = "전체"
                        }) {
                            Text("전체")
                                .font(Font.custom("NanumSquare Neo OTF", size: 14).weight(.bold))
                                .foregroundColor(selectedFilter == "전체" ? .black : Color.grey4)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 8)
                                .background(selectedFilter == "전체" ? Color.sub1 : Color.clear)
                                .cornerRadius(50)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 50)
                                        .inset(by: 0.89)
                                        .stroke(selectedFilter == "전체" ? Color.sub1 : Color.grey2, lineWidth: 1.77)
                                )
                        }
                        
                        Button(action: {
                            selectedFilter = "락토"
                        }) {
                            Text("락토")
                                .font(Font.custom("NanumSquare Neo OTF", size: 14).weight(.bold))
                                .foregroundColor(selectedFilter == "락토" ? .black : Color.grey4)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 8)
                                .background(selectedFilter == "락토" ? Color.sub1 : Color.clear)
                                .cornerRadius(50)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 50)
                                        .inset(by: 0.89)
                                        .stroke(selectedFilter == "락토" ? Color.sub1 : Color.grey2, lineWidth: 1.77)
                                )
                        }
                        
                        Button(action: {
                            selectedFilter = "비건"
                        }) {
                            Text("비건")
                                .font(Font.custom("NanumSquare Neo OTF", size: 14).weight(.bold))
                                .foregroundColor(selectedFilter == "비건" ? .black : Color.grey4)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 8)
                                .background(selectedFilter == "비건" ? Color.sub1 : Color.clear)
                                .cornerRadius(50)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 50)
                                        .inset(by: 0.89)
                                        .stroke(selectedFilter == "비건" ? Color.sub1 : Color.grey2, lineWidth: 1.77)
                                )
                        }
                        
                        Button(action: {
                            selectedFilter = "오보"
                        }) {
                            Text("오보")
                                .font(Font.custom("NanumSquare Neo OTF", size: 14).weight(.bold))
                                .foregroundColor(selectedFilter == "오보" ? .black : Color.grey4)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 8)
                                .background(selectedFilter == "오보" ? Color.sub1 : Color.clear)
                                .cornerRadius(50)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 50)
                                        .inset(by: 0.89)
                                        .stroke(selectedFilter == "오보" ? Color.sub1 : Color.grey2, lineWidth: 1.77)
                                )
                        }
                        
                        Button(action: {
                            selectedFilter = "락토오보"
                        }) {
                            Text("락토오보")
                                .font(Font.custom("NanumSquare Neo OTF", size: 14).weight(.bold))
                                .foregroundColor(selectedFilter == "락토오보" ? .black : Color.grey4)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 8)
                                .background(selectedFilter == "락토오보" ? Color.sub1 : Color.clear)
                                .cornerRadius(50)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 50)
                                        .inset(by: 0.89)
                                        .stroke(selectedFilter == "락토오보" ? Color.sub1 : Color.grey2, lineWidth: 1.77)
                                )
                        }
                    }
                    .padding(.horizontal)
                    .padding(10)
                }

                // Recipe List
                ScrollView {
                    VStack {
                        RecipeCard(title: "그리너리 포케", likes: 25, comments: 5)
                        RecipeCard(title: "그리너리 포케", likes: 25, comments: 5)
                        RecipeCard(title: "그리너리 포케", likes: 25, comments: 5)
                    }
                    .padding()
                }
                

            }
           
        }
    }
}





struct MyContest_Previews: PreviewProvider {
    static var previews: some View {
        MyContestView()
    }
}


