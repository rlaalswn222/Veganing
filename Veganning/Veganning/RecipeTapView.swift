import SwiftUI

struct RecipeTapView: View {
    @State private var selectedTab: Int = 1
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                ScrollView {
                    VStack(spacing: 16) {
                        // 상단 이미지 및 검색 바
                        ZStack(alignment: .top) {
                            Image("food_image") // 실제 이미지 이름으로 변경하세요
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                            VStack {
                                HStack {
                                    Button(action: {
                                        // 뒤로가기 액션
                                    }) {
                                        Image(systemName: "chevron.left")
                                            .foregroundColor(.white)
                                            .padding()
                                            .background(Color.black.opacity(0.5))
                                            .clipShape(Circle())
                                    }
                                    Spacer()
                                    
                                    HStack {
                                        TextField("두부면 검색하여 두부면 식단 찾아보기", text: .constant(""))
                                            .padding(8)
                                            .background(Color(.systemGray6))
                                            .cornerRadius(8)
                                        
                                        Button(action: {
                                            // 검색 액션
                                        }) {
                                            Image(systemName: "magnifyingglass")
                                                .foregroundColor(.gray)
                                                .padding(.trailing, 8)
                                        }
                                    }
                                    .padding(8)
                                    .background(Color.white)
                                    .cornerRadius(8)
                                    
                                    Spacer().frame(width: 40)
                                }
                                .padding([.leading, .trailing, .top], 16)
                            }
                        }
                        
                        // 탭
                        HStack {
                            ForEach(1..<5) { index in
                                VStack {
                                    Text(tabTitle(index: index))
                                        .font(.headline)
                                    if index == 1 {
                                        Circle()
                                            .fill(Color.green)
                                            .frame(width: 10, height: 10)
                                            .padding(.top, 4)
                                    }
                                }
                                .padding()
                            }
                        }
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        
                        // 재료 준비
                        VStack(alignment: .leading, spacing: 8) {
                            Text("재료 준비")
                                .font(.title2)
                                .bold()
                            
                            ForEach(0..<5) { _ in
                                HStack {
                                    Text("피망")
                                    Spacer()
                                    Text("2개 (120g)")
                                }
                                .padding(.vertical, 4)
                            }
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        
                        // 레시피 단계
                        VStack(alignment: .leading, spacing: 16) {
                            Text("레시피")
                                .font(.title2)
                                .bold()
                            
                            ForEach(0..<4) { _ in
                                VStack(alignment: .leading) {
                                    Image("recipe") // 실제 이미지 이름으로 변경하세요
                                        .resizable()
                                        .frame(height: 200)
                                        .background(Color(.systemGray5))
                                        .cornerRadius(10)
                                    
                                    Text("1. 피망을 손질해주세요.")
                                        .padding(.top, 8)
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        // 리뷰
                        VStack(alignment: .leading, spacing: 16) {
                            HStack {
                                Text("리뷰 127")
                                    .font(.title2)
                                    .bold()
                                Spacer()
                                NavigationLink(destination: ReviewDetailView()) {
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                        .padding()
                                }
                            }
                            
                            ForEach(0..<2) { _ in
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("최영우")
                                            .bold()
                                        Text("2022.07.08")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                        
                                        HStack(spacing: 2) {
                                            ForEach(0..<5) { _ in
                                                Image(systemName: "star.fill")
                                                    .foregroundColor(.yellow)
                                            }
                                        }
                                        .font(.caption)
                                        
                                        Text("이 식단 덕분에 지쳤던 몸을 회복할 수 있었어요. 감사합니다!")
                                    }
                                    Spacer()
                                }
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(10)
                            }
                        }
                        .padding(.horizontal)
                        
                        // 추천 식단
                        VStack(alignment: .leading, spacing: 16) {
                            HStack {
                                Text("그린너리 포케와 유사한 추천 식단")
                                    .font(.title2)
                                    .bold()
                                Spacer()
                            }
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(0..<3) { _ in
                                        VStack {
                                            Image("recipe") // 실제 이미지 이름으로 변경하세요
                                                .resizable()
                                                .frame(width: 100, height: 100)
                                                .background(Color(.systemGray5))
                                                .cornerRadius(10)
                                            
                                            VStack(alignment: .leading) {
                                                Text("커리 에그 샐러드")
                                                    .bold()
                                                Text("4.0 (145)")
                                                    .font(.subheadline)
                                                    .foregroundColor(.gray)
                                                
                                                Text("한입 베어물면 입안에 퍼지는 고소함")
                                                    .font(.caption)
                                                    .foregroundColor(.gray)
                                                    .padding(.top, 4)
                                            }
                                        }
                                        .padding()
                                        .background(Color(.systemGray6))
                                        .cornerRadius(10)
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.top)
                }
                
                // 하단 네비게이션 바
                HStack {
                    Spacer()
                    NavigationLink(destination: RecipeTapView()) {
                        Text("레시피")
                            .font(
                                Font.custom("Pretendard", size: 14)
                                    .weight(.medium)
                            )
                            .foregroundColor(.black)
                    }
                    Spacer()
                    Button(action: {
                        selectedTab = 1
                    }) {
                        Image("logo")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                    }
                    Spacer()
                    Button(action: {
                        selectedTab = 2
                    }) {
                        Text("MY")
                            .font(
                                Font.custom("Pretendard", size: 14)
                                    .weight(.medium)
                            )
                            .foregroundColor(.black)
                    }
                    Spacer()
                }
                .padding(.vertical, 10)
                .background(Color(.systemGray5))
                .cornerRadius(30)
                .shadow(radius: 10)
            }
            .navigationBarHidden(true)
        }
    }
    
    func tabTitle(index: Int) -> String {
        switch index {
        case 1:
            return "재료준비"
        case 2:
            return "레시피"
        case 3:
            return "리뷰"
        case 4:
            return "추천 식단"
        default:
            return ""
        }
    }
}



struct RecipeTapView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTapView()
    }
}

