import SwiftUI

struct MyPageView: View {
//    let userSampleData: MyPageMainModel?
    
    @State private var offset: CGFloat = UIScreen.main.bounds.height * 0.5 // 초기 위치는 중간
    
    var body: some View {
        NavigationView {
            
            ZStack {
                VStack(spacing: 0) {
                    // 상단의 프로필 부분
                    ZStack {
                        // 배경 이미지
                        Image("mypage_background")
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
                                MyPageCalendarCardView()
                                    .padding(.horizontal)
                            }
                            .padding(.bottom, 50) // 모달 내용에 여유 공간 추가
                        }
                    }
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .padding(.top, -50) // 상단 프로필과 연결되도록 위쪽 패딩 감소
                    
                    Spacer()
                }
            }
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
                }
            }
            .navigationBarBackButtonHidden()
        }
        .scrollIndicators(.hidden)
    }
}
