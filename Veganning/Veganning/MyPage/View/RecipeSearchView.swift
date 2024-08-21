import SwiftUI

struct RecipeSearchView: View {
    @State private var text: String = ""
    @State private var showingModal = false
    @State private var selectedItem: RecipeSaveModel? = nil
    
    let items: [RecipeSaveModel] = sampleRecipeData
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("‘포케’ 검색하여 포케 식단 찾아보기", text: $text)
                        .padding(5)
                        .background(Color("grey1"))
                        .cornerRadius(8)
                        .foregroundColor(Color("grey5"))
                        .font(.custom("NanumSquareNeoOTF", size: 12))
                    
                    Button(action: {
                        print("'\(text)' 검색 결과")
                    }) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color("grey5"))
                    }
                }
                .padding()
                
                Spacer()
                
                if !text.isEmpty {
                    Text("'\(text)' 검색 결과")
                        .padding()
                        .foregroundColor(Color("textColor"))
                        .font(.custom("NanumSquareNeoOTF", size: 14))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                Spacer()
                
                ForEach(items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            HStack {
                                if item.hot {
                                    Text("HOT")
                                        .font(.custom("NanumSquareNeoOTF", size: 12))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color("sub1"))
                                        .padding(.vertical, 5)
                                        .padding(.horizontal, 20)
                                        .background(
                                            RoundedRectangle(cornerRadius: 50)
                                                .fill(Color("grey4"))
                                        )
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 50)
                                                .stroke(Color("sub1"), lineWidth: 1)
                                        )
                                        .allowsHitTesting(false)
                                }
                                
                                if let ingredient = item.ingredient {
                                    Text(ingredient)
                                        .font(.custom("NanumSquareNeoOTF", size: 12))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color("sub1"))
                                        .padding(.vertical, 5)
                                        .padding(.horizontal, 20)
                                        .background(
                                            RoundedRectangle(cornerRadius: 50)
                                                .fill(Color("grey4"))
                                        )
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 50)
                                                .stroke(Color("sub1"), lineWidth: 1)
                                        )
                                        .allowsHitTesting(false)
                                }
                                
                                Spacer()
                                
                                Button(action: {
                                    print("삭제 버튼 클릭됨")
                                }) {
                                    Text(item.delete ? "삭제됨" : "삭제")
                                        .font(.custom("NanumSquareNeoOTF", size: 12))
                                        .foregroundColor(Color("textColor"))
                                        .padding(.vertical, 5)
                                        .padding(.horizontal, 30)
                                        .background(Color("grey2"))
                                        .cornerRadius(5)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                            
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.title)
                                        .font(.custom("NanumSquareNeoOTF", size: 20))
                                        .padding(.vertical, 1)
                                    Text(item.nickname)
                                        .font(.custom("NanumSquareNeoOTF", size: 12))
                                        .padding(.vertical, 2)
                                        .foregroundColor(Color("textColor"))
                                    Text(item.description1.prefix(30))
                                        .font(.custom("NanumSquareNeoOTF", size: 12))
                                        .foregroundColor(Color("textColor"))
                                        .padding(.vertical, 2)
                                    Text(item.description2.prefix(30))
                                        .font(.custom("NanumSquareNeoOTF", size: 12))
                                        .foregroundColor(Color("textColor"))
                                }
                                
                                Image(item.imageName)
                                    .resizable()
                                    .frame(width: 140, height: 70)
                                    .padding(.trailing, -25)
                                    .padding(.bottom, -100)
                            }
                            Spacer()
                            
                        }
                        Spacer()
                    }
                    .padding()
                    .background(Color("grey1"))

                }
                .padding()
                
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Button(action: {
                            // 뒤로 가기 액션
                        }) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color("black1"))
                        }
                        
                        VStack {
                            Text("식단검색")
                                .font(.headline)
                                .foregroundColor(Color("black1"))
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    RecipeSearchView()
}
