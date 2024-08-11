import SwiftUI

struct RecipeDetailView: View {
    
    //뒤로가기버튼을 구현하려고 추가한 코드
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    ZStack(alignment: .top) {
                        Image("food_image") // 배경 이미지 설정
                            .resizable()
                            .scaledToFill()
                            .frame(height: 416)
                            .clipped()
                        
                        VStack {
                            // 검색 바와 뒤로 가기 버튼
                            HStack {
                                Button(action: {
                                    presentationMode.wrappedValue.dismiss()
                                }) {
                                    Image(systemName: "chevron.left")
                                        .foregroundColor(.black)
                                }
                                
                                Spacer()
                                
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(height: 45)
                                        .background(Color.white.opacity(0.7))
                                        .cornerRadius(7)
                                    
                                    HStack {
                                        TextField("검색하여 두부면 식단 찾아보기", text: .constant(""))
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
                            }
                            .padding()
                            
                            Spacer()
                            
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("락토 오보")
                                        .padding(10)
                                        .background(Color(red: 0.8, green: 1.0, blue: 0))
                                        .cornerRadius(20)
                                        .foregroundColor(.black)
                                    Text("HOT")
                                        .padding(10)
                                        .background(Color(red: 0.8, green: 1.0, blue: 0))
                                        .cornerRadius(20)
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                                .padding(.horizontal)
                                
                                VStack(alignment: .leading) {
                                    Text("그리너리 포케")
                                        .font(.title)
                                        .bold()
                                    HStack {
                                        ForEach(0..<3) { _ in
                                            Image(systemName: "star.fill")
                                                .foregroundColor(.yellow)
                                        }
                                        ForEach(0..<2) { _ in
                                            Image(systemName: "star")
                                                .foregroundColor(.yellow)
                                        }
                                    }
                                }
                                .padding(.horizontal)
                                .padding(15)
                               
                            }
                           
                        }
                        
                    }
                    .frame(height: 416)
                    Spacer()
                    
                    // Recipe Tabs
                    VStack {
                        HStack(spacing: 40) { // 양옆에 약간만 떨어지게 조정
                            VStack {
                                ZStack {
                                    Circle()
                                        .fill(Color(red: 0.8, green: 1.0, blue: 0)) // 원의 배경색
                                        .frame(width: 30, height: 30)
                                    Text("1")
                                        .foregroundColor(.black)
                                        .font(.headline)
                                }
                                Text("재료준비")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            
                            VStack {
                                ZStack {
                                    Circle()
                                        .fill(Color(red: 0.8, green: 1.0, blue: 0)) // 원의 배경색
                                        .frame(width: 30, height: 30)
                                    Text("2")
                                        .foregroundColor(.black)
                                        .font(.headline)
                                }
                                Text("레시피")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            
                            VStack {
                                ZStack {
                                    Circle()
                                        .fill(Color(red: 0.8, green: 1.0, blue: 0)) // 원의 배경색
                                        .frame(width: 30, height: 30)
                                    Text("3")
                                        .foregroundColor(.black)
                                        .font(.headline)
                                }
                                Text("리뷰")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.horizontal)
                        .offset(y: 0) // 탭을 조금 더 아래로 조정
                    }
                    .padding(.top, -20) // 이미지를 가리지 않도록 상단 패딩 조정
                    
                    // Recipe Ingredients
                    VStack(alignment: .leading) {
                        HStack {
                            Text("재료준비")
                                .font(.headline)
                                .padding(.vertical, 5)
                            Spacer()
                            Text("1인분 기준")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        ForEach(0..<6) { _ in
                            HStack {
                                Text("피망")
                                Spacer()
                                Text("2개 (120g)")
                            }
                            .padding(.vertical, 2)
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 1)
                    .padding()
                    
                    // Recipe Instructions
                    VStack(alignment: .leading) {
                        ForEach(0..<3) { _ in
                            VStack(alignment: .leading) {
                                Image("food_image")
                                    .resizable() // 추가: 이미지를 리사이즈 가능하게 설정
                                    .aspectRatio(contentMode: .fill) // 추가: 이미지 비율 유지
                                    .foregroundColor(.gray)
                                    .frame(height: 150)
                                    .cornerRadius(10)
                                    .padding(.horizontal, 10) // 양옆에 10의 패딩 추가
                            
                                Text("1. 피망을 손질해주세요.")
                                    .font(.headline)
                                    .padding(.vertical, 5)
                                Text("레시피 내용을 서술합니다. 레시피 내용을 서술합니다. 레시피 내용을 서술합니다. 레시피 내용을 서술합니다. 레시피 내용을 서술합니다.")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .padding(.bottom, 10)
                        }
                    }
                    .padding()
                    
                    // Reviews
                    HStack {
                        Text("리뷰")
                            .font(.headline)
                        Text("127") //리뷰갯수
                        NavigationLink(destination: RecipeReviewView()) {
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(0..<3) { _ in
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text("최영우")
                                        Spacer()
                                        Text("2024.07.08 (화)")
                                    }
                                    .font(.subheadline)
                                    .padding(.bottom, 2)
                                    
                                    HStack {
                                        ForEach(0..<3) { _ in
                                            Image(systemName: "star.fill")
                                                .foregroundColor(.yellow)
                                        }
                                        ForEach(0..<2) { _ in
                                            Image(systemName: "star")
                                                .foregroundColor(.yellow)
                                        }
                                    }
                                    .padding(.bottom, 2)
                                    
                                    Text("이 식단 맛있네요. 재료도 손쉽게 구할 수 있는 것들뿐이라 입맛 없을 때 해먹기 좋아요.")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(radius: 1)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.vertical)
                    
                    // Recommended Dishes
                    VStack(alignment: .leading) {
                            HStack{
                                Text("그리너리 포케").foregroundColor(.main)
                                Text("와 유사한 추천 식단")
                            }.padding(.leading)

                        

                       
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(0..<3) { _ in
                                    HStack{
                                        Image("food_image")
                                        VStack(alignment: .leading) {
                                            Text("커리 에그 샐러드")
                                                .font(.headline)
                                            HStack {
                                                ForEach(0..<4) { _ in
                                                    Image(systemName: "star.fill")
                                                        .foregroundColor(.yellow)
                                                }
                                                ForEach(0..<1) { _ in
                                                    Image(systemName: "star")
                                                        .foregroundColor(.yellow)
                                                }
                                                Text("(145)")
                                                    .font(.subheadline)
                                                    .foregroundColor(.gray)
                                            }
                                            .padding(.vertical, 2)
                                            Text("1. 계란을 12분간 삶아주세요.")
                                                .font(.subheadline)
                                                .foregroundColor(.gray)
                                            Text("2. 양파를 잘게 다져주세요.")
                                                .font(.subheadline)
                                                .foregroundColor(.gray)
                                        }
                                        
                                    }
                                   
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .shadow(radius: 1)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.vertical)
                }
            }
        
        }.navigationBarBackButtonHidden()
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView()
    }
}

