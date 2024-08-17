import SwiftUI

enum Tab {
    case recipe
    case home
    case myPage
}

struct CustomTabView: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button {
                    selectedTab = .recipe
                } label: {
                    VStack {
                        Image(selectedTab == .recipe ? "fullBook" : "book")
                            .resizable()
                            .frame(width: 24, height: 24)
                        Text("레시피")
                            .font(.system(size: 14))
                            .foregroundColor(selectedTab == .recipe ? .sub2 : .black)
                    }
                }
                Spacer()
                ZStack {
                    Button {
                        selectedTab = .home
                    } label: {
                        VStack(spacing: -12) {
                            Image("tabIcon")
                                .resizable()
                                .frame(width: 110,height: 110)
                            Text("홈")
                                .font(.system(size: 14))
                                .foregroundColor(selectedTab == .home ? .sub2 : .black)
                        }
                    }
                }
                .offset(y: -39)
                Spacer()
                Button {
                    selectedTab = .myPage
                } label: {
                    VStack {
                        Image(selectedTab == .myPage ? "fullUser" : "user")
                            .resizable()
                            .frame(width: 24, height: 24)
                        Text("MY")
                            .font(.system(size: 14))
                            .foregroundColor(selectedTab == .myPage ? .sub2 : .black)
                    }
                }
                Spacer()
            }
            .padding()
            .frame(height: 100)
            .background(
                RoundedCornersShape(radius: 25, corners: [.topLeft, .topRight])
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: -5)
                    .blur(radius: 1)
            )
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        @State var selectedTab: Tab = .home
        
        return CustomTabView(selectedTab: $selectedTab)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
