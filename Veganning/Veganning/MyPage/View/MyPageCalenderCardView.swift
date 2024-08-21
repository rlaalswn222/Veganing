import SwiftUI

<<<<<<< Updated upstream
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
=======
struct MyPageCalenderCardView: View {
    @State var month: Date
    @State var offset: CGSize = CGSize()
    @State var clickedDates: Set<Date> = []

    var body: some View {
        VStack {
            headerView
            calendarGridView
        }
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    self.offset = gesture.translation
                }
                .onEnded { gesture in
                    if gesture.translation.width < -100 {
                        changeMonth(by: 1)
                    } else if gesture.translation.width > 100 {
                        changeMonth(by: -1)
                    }
                    self.offset = CGSize()
                }
        )
    }

    // MARK: - 헤더 뷰
    private var headerView: some View {
        VStack {
            Text(month, formatter: Self.dateFormatter)
                .font(.title)
                .padding(.bottom)

            HStack {
                ForEach(Self.weekdaySymbols, id: \.self) { symbol in
                    Text(symbol)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(.bottom, 5)
        }
    }

    // MARK: - 날짜 그리드 뷰
    private var calendarGridView: some View {
        let daysInMonth: Int = numberOfDays(in: month)
        let firstWeekday: Int = firstWeekdayOfMonth(in: month) - 1

        return VStack {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
                ForEach(0 ..< daysInMonth + firstWeekday, id: \.self) { index in
                    if index < firstWeekday {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(Color.clear)
                    } else {
                        let date = getDate(for: index - firstWeekday)
                        let day = index - firstWeekday + 1
                        let clicked = clickedDates.contains(date)

                        CellView(
                            day: day,
                            clicked: clicked,
                            showStamp: day == 22 && isCurrentMonthAugust(),
                            showFullStamp: isFullStampDate(day: day)
                        )
                        .onTapGesture {
                            if clicked {
                                clickedDates.remove(date)
                            } else {
                                clickedDates.insert(date)
                            }
                        }
                    }
                }
            }
        }
    }

    // 8월인지 확인하는 메서드
    private func isCurrentMonthAugust() -> Bool {
        let components = Calendar.current.dateComponents([.month], from: month)
        return components.month == 8
    }

    // 특정 날짜가 full_progress_stamp를 보여줄지 여부 확인
    private func isFullStampDate(day: Int) -> Bool {
        return day == 20 || day == 19 || day == 17 || day == 15
    }
}

// MARK: - 일자 셀 뷰
private struct CellView: View {
    var day: Int
    var clicked: Bool = false
    var showStamp: Bool = false
    var showFullStamp: Bool = false

    init(day: Int, clicked: Bool, showStamp: Bool = false, showFullStamp: Bool = false) {
        self.day = day
        self.clicked = clicked
        self.showStamp = showStamp
        self.showFullStamp = showFullStamp
    }

    var body: some View {
        VStack(spacing: 5) {
            Text(String(day))
                .foregroundColor(Color("textColor"))
            
            if showFullStamp {
                Image("full_progress_stamp")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            } else if showStamp {
                Image("70_progress_stamp")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            } else {
                Spacer().frame(height: 40)
            }
        }
        .padding(.bottom, 10)
    }
}

// MARK: - 내부 메서드
private extension MyPageCalenderCardView {
    /// 특정 해당 날짜
    private func getDate(for day: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: day, to: startOfMonth())!
    }

    /// 해당 월의 시작 날짜
    func startOfMonth() -> Date {
        let components = Calendar.current.dateComponents([.year, .month], from: month)
        return Calendar.current.date(from: components)!
    }

    /// 해당 월에 존재하는 일자 수
    func numberOfDays(in date: Date) -> Int {
        return Calendar.current.range(of: .day, in: .month, for: date)?.count ?? 0
    }

    /// 해당 월의 첫 날짜가 갖는 해당 주의 몇번째 요일
    func firstWeekdayOfMonth(in date: Date) -> Int {
        let components = Calendar.current.dateComponents([.year, .month], from: date)
        let firstDayOfMonth = Calendar.current.date(from: components)!

        return Calendar.current.component(.weekday, from: firstDayOfMonth)
    }

    /// 월 변경
    func changeMonth(by value: Int) {
        let calendar = Calendar.current
        if let newMonth = calendar.date(byAdding: .month, value: value, to: month) {
            self.month = newMonth
        }
    }
}

// MARK: - Static 프로퍼티
extension MyPageCalenderCardView {
    static let dateFormatter: DateFormatter = {
>>>>>>> Stashed changes
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter
    }()
<<<<<<< Updated upstream
}

#Preview {
    MyPageCalendarCardView()
=======

    static let weekdaySymbols = Calendar.current.veryShortWeekdaySymbols
}

#Preview {
    MyPageCalenderCardView(month: Date())
>>>>>>> Stashed changes
}
