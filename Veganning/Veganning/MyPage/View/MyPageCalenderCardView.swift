import SwiftUI

struct MyPageCalendarCardView: View {
    @State private var selectedDate = Date()
    
    // 현재 선택된 달의 첫 날을 반환
    private var currentMonth: Date {
        let calendar = Calendar.current
        return calendar.date(from: calendar.dateComponents([.year, .month], from: selectedDate))!
    }
    
    // 현재 월의 모든 날을 CalendarModel로 반환
    private var daysInMonth: [CalendarModel] {
        let calendar = Calendar.current
        let range = calendar.range(of: .day, in: .month, for: currentMonth)!
        let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: currentMonth))!
        
        return range.compactMap { day -> CalendarModel? in
            let date = calendar.date(byAdding: .day, value: day - 1, to: startOfMonth)!
            // 미리 정의된 데이터에서 해당 날짜에 맞는 이미지 이름을 가져옵니다.
            let statusImageName = calendarSampleData.first { Calendar.current.isDate($0.date, inSameDayAs: date) }?.statusImageName
            return CalendarModel(date: date, statusImageName: statusImageName)
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("\(selectedDate, formatter: DateFormatter.monthAndYear)")
                    .font(.custom("NanumSquareNeoOTF", size: 16))
                    .bold()
                
                Spacer()
                
                Button(action: {
                    // 이전 달 이동
                    self.selectedDate = Calendar.current.date(byAdding: .month, value: -1, to: selectedDate)!
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color("main"))
                }
                
                Button(action: {
                    // 다음 달 이동
                    self.selectedDate = Calendar.current.date(byAdding: .month, value: 1, to: selectedDate)!
                }) {
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color("main"))
                }
            }
            .padding()
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7)) {
                ForEach(["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"], id: \.self) { day in
                    Text(day)
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, 10)
                        .font(.custom("NanumSquareNeoOTF", size: 13))
                        .foregroundColor(Color("grey6"))
                }
                
                ForEach(daysInMonth) { day in
                    VStack(spacing: 0) {
                        Text("\(Calendar.current.component(.day, from: day.date))")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Calendar.current.isDateInToday(day.date) ? Color.green.opacity(0.3) : Color.clear)
                            .cornerRadius(10)
                            .font(.custom("NanumSquareNeoOTF", size: 18))
                            .padding(.bottom, 40)
                            
                        if let imageName = day.statusImageName {
                            Image(imageName)
                                .resizable()
                                .frame(width: 40, height: 40)
                        }
                    }
                    .frame(maxWidth: .infinity, minHeight: 70)
                }
            }
        }
        .padding()
    }
}

extension DateFormatter {
    static let monthAndYear: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter
    }()
}

#Preview {
    MyPageCalendarCardView()
}
