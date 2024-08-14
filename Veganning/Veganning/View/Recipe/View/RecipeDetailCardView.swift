import SwiftUI

struct RecipeDetailCardView: View {
    let dtmodel: RecipeDetailCardModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(dtmodel.dtImageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .foregroundColor(.gray)
                .frame(height: 150)
                .cornerRadius(10)
                .padding(.horizontal, 10) // 양옆에 10의 패딩 추가
        
            Text(dtmodel.dttitle)
                .font(.headline)
                .padding(.vertical, 5)
            
            Text(dtmodel.dtrecipedetail)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding(.bottom, 10)
    }
}

