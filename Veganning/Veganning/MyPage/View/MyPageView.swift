import SwiftUI

struct MyPageView: View {
<<<<<<< Updated upstream
//    let userSampleData: MyPageMainModel?
    
    @State private var offset: CGFloat = UIScreen.main.bounds.height * 0.5 // 초기 위치는 중간
=======

>>>>>>> Stashed changes
    
    var body: some View {
        NavigationView {
            
            ZStack {
                VStack(spacing: 0) {
                    // 상단의 프로필 부분
                    ZStack {
                        // 배경 이미지
<<<<<<< Updated upstream
                        Image("mypage_background")
=======
                        Image("Mypage_background")
>>>>>>> Stashed changes
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 300)
                            .clipped()
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Have a vaganing day")
                                .font(.custom("NanumSquareNeoOTF", size: 16))
                                .fontWeight(.bold)
                                .foregroundColor(Color("main"))
                                .padding(.top, 50)
                                .padding(.leading, 20)
                            
<<<<<<< Updated upstream
//                            Text("D + \(userSampleData?.date ?? 0)")  // 옵셔널 데이터 사용
//                                .font(.custom("NanumSquareNeoOTF", size: 16))
//                                .fontWeight(.bold)
//                                .foregroundColor(Color("sub2"))
//                                .padding(.leading, 20)
//                            
//                            Text(userSampleData?.nickname ?? "닉네임 없음")  // 옵셔널 데이터 사용
//                                .font(.custom("NanumSquareNeoOTF", size: 32))
//                                .fontWeight(.bold)
//                                .foregroundColor(.white)
//                                .padding(.leading, 20)
//                                .padding(.bottom, 20)
=======
                            Text("D + 225")
                                .font(.custom("NanumSquareNeoOTF", size: 16))
                                .fontWeight(.bold)
                                .foregroundColor(Color("sub2"))
                                .padding(.leading, 20)
                            
                            Text("김초록")
                                .font(.custom("NanumSquareNeoOTF", size: 32))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.leading, 20)
                                .padding(.bottom, 20)
>>>>>>> Stashed changes
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Spacer()
                    }
                    .background(Color.black.opacity(0.3)) // 배경에 반투명 효과 추가
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    .padding(.horizontal)
                    
                    // 하프 모달 부분
                    VStack(spacing: 16) {
                        HStack {
                            Text("CHALLENGE")
                                .font(.custom("NanumSquareNeoOTF", size: 20))
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Button(action: {
                                // 설정 버튼 액션
                            }) {
                                Image(systemName: "gearshape")
                                    .foregroundColor(.black)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 16)
                        
                        Button(action: {
                            // 오늘 식단 추가하기 버튼 액션
                        }) {
                            Text("+ 오늘 식단 추가하기")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color("main"))
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)
                        
                        ScrollView {
                            VStack(spacing: 20) {
                                // 달력과 하단 정보들 추가
<<<<<<< Updated upstream
                                MyPageCalendarCardView()
                                    .padding(.horizontal)
                            }
                            .padding(.bottom, 50) // 모달 내용에 여유 공간 추가
=======
                                MyPageCalenderCardView(month: Date())
                                    .padding(.horizontal)
                            }
                            .padding(.bottom, 50) // 모달 내용에 여유 공간 추가
                            
                            HStack(spacing: 5) {
                                Image("100")
                                    .frame(width: 8, height: 8)
                                Text("100% 완성")
                                    .font(.custom("NanumSquareNeoOTF", size: 12))
                                Image("70")
                                    .frame(width: 8, height: 8)
                                Text("70% 완성")
                                    .font(.custom("NanumSquareNeoOTF", size: 12))
                                Image("50")
                                    .frame(width: 8, height: 8)
                                Text("50% 완성")
                                    .font(.custom("NanumSquareNeoOTF", size: 12))
                                Image("0")
                                    .frame(width: 8, height: 8)
                                Text("실패")
                                    .font(.custom("NanumSquareNeoOTF", size: 12))
                                
                                Spacer()
                            }
                            .padding(.leading, 10) // 왼쪽에 10 포인트의 패딩 추가
                            .padding(.bottom, 20)
                            VStack(spacing: 10){
                                TodayRecipeCardView()
                                    .padding(.bottom,5)
                                TodayKcalCardView()
                            }

>>>>>>> Stashed changes
                        }
                    }
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .padding(.top, -50) // 상단 프로필과 연결되도록 위쪽 패딩 감소
                    
                    Spacer()
                }
            }
<<<<<<< Updated upstream
            .navigationBarTitle("My Page", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // 설정 버튼 액션
                    }) {
                        Image(systemName: "gearshape")
                            .foregroundColor(.black)
                    }
=======
            
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
>>>>>>> Stashed changes
                }
            }
            .navigationBarBackButtonHidden()
        }
        .scrollIndicators(.hidden)
    }
}
<<<<<<< Updated upstream
=======

#Preview {
    MyPageView()
}
>>>>>>> Stashed changes
