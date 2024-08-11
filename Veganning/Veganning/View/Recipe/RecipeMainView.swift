import SwiftUI

struct RecipeMainView: View {
    @State private var selectedTab: Int = 1
    @State private var selectedFilter: String = ""
    @State private var selectedBottomTab = 1
    
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

//레시피카드

struct RecipeCard: View {
    var title: String
    var likes: Int
    var comments: Int
    
    var body: some View {
        NavigationLink(destination: RecipeDetailView()) {
            VStack {
                ZStack(alignment: .topLeading) {
                    Image("food_image")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 120)
                        .clipped()
                    
                    VStack(alignment: .leading) {
                        HStack {
                            HStack(alignment: .center, spacing: 10) {
                                Text("HOT")
                                    .font(
                                        Font.custom("NanumSquare Neo OTF", size: 14)
                                            .weight(.bold)
                                    )
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 6)
                            .background(
                                Image("background_image")
                                    .resizable()
                                    .scaledToFill()
                            )
                            .cornerRadius(51)
                            .overlay(
                                RoundedRectangle(cornerRadius: 51)
                                    .inset(by: 0.51)
                                    .stroke(Color(red: 0.17, green: 0.17, blue: 0.17), lineWidth: 1.03)
                            )
                            
                            HStack(alignment: .center, spacing: 10) {
                                Text("두부")
                                    .font(
                                        Font.custom("NanumSquare Neo OTF", size: 14)
                                            .weight(.bold)
                                    )
                                    .foregroundColor(Color(red: 0.17, green: 0.17, blue: 0.17))
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 6)
                            .background(
                                Image("background_image")
                                    .resizable()
                                    .scaledToFill()
                            )
                            .cornerRadius(51)
                            .overlay(
                                RoundedRectangle(cornerRadius: 51)
                                    .inset(by: 0.51)
                                    .stroke(Color(red: 0.17, green: 0.17, blue: 0.17), lineWidth: 1.03)
                            )
                            
                            Spacer()
                            
                            HStack(spacing: 16) {
                                Image(systemName: "bubble.left")
                            }
                            .padding(.trailing, 7)
                            
                            HStack(spacing: 4) {
                                Image(systemName: "heart")
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 8)
                    }
                }
                .frame(height: 120)
                
                Divider()
                
                VStack(alignment: .leading) {
                    let text = "2. 볶아둔 재료를 부친 두부전에 골고루 넣어준다"
                    let count = text.count
                    
                    Text(title)
                        .font(.headline)
                        .padding(.bottom, 4)
                    Text("1. 야채와 버섯을 채를 썰어둔다")
                        .font(Font.custom("NanumSquare Neo OTF", size: 12))
                        .foregroundColor(Color(red: 0.51, green: 0.51, blue: 0.51))
                    
                    HStack{
                        Text(count > 15 ? "\(text.prefix(15))..." : text)
                            .lineLimit(1)
                            .truncationMode(.tail)
                            .font(Font.custom("NanumSquare Neo OTF", size: 12))
                            .foregroundColor(Color(red: 0.51, green: 0.51, blue: 0.51))
                        
                        Spacer()
                        
                        Button(action: {}) {
                            Text("자세히보기")
                                .font(Font.custom("NanumSquare Neo OTF", size: 10))
                                .underline()
                                .foregroundColor(Color(red: 0.48, green: 0.48, blue: 0.48))
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 10)
            }
            .background(Color(.systemGray6))
            .cornerRadius(8)
            
        }
        .buttonStyle(PlainButtonStyle())
        .navigationBarBackButtonHidden()
    }
}

struct RecipeListView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    RecipeCard(title: "그리너리 포케", likes: 25, comments: 5)
                    RecipeCard(title: "그리너리 포케", likes: 25, comments: 5)
                    RecipeCard(title: "그리너리 포케", likes: 25, comments: 5)
                }
                .padding()
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

