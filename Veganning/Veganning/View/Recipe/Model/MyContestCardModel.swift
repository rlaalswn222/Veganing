import SwiftUI
import UIKit

struct MyContestCardModel: Identifiable {
    let id = UUID()
    var MCtitle: String
    var MClikes: Int
    var MCcomments: Int
    var MCrecipedetail: String
    var MCrecipeImage: UIImage?
}

