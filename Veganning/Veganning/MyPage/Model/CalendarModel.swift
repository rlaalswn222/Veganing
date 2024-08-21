<<<<<<< Updated upstream
//
//  CalenderModel.swift
//  Veganning
//
//  Created by 김민주 on 8/22/24.
//

import Foundation

struct CalendarModel: Identifiable {
    
    let id = UUID()
    var date: Date
    var statusImageName: String?

}

let calendarSampleData: [CalendarModel] = [
    CalendarModel(date: Calendar.current.date(from: DateComponents(year: 2024, month: 8, day: 2))!, statusImageName: "full_progress_stamp"),
    CalendarModel(date: Calendar.current.date(from: DateComponents(year: 2024, month: 8, day: 3))!, statusImageName: "half_progress_stamp"),
    CalendarModel(date: Calendar.current.date(from: DateComponents(year: 2024, month: 8, day: 5))!, statusImageName: "no_progress_stamp")
]
=======
////
////  CalenderModel.swift
////  Veganning
////
////  Created by 김민주 on 8/22/24.
////
//
//import Foundation
//
//struct CalendarModel: Identifiable {
//    
//    let id = UUID()
//    var date: Date
//    var statusImageName: String?
//
//}
////
////let calendarSampleData: [CalendarModel] = [
////    CalendarModel(date: Calendar.current.date(from: DateComponents(year: 2024, month: 8, day: 2))!, statusImageName: "full_progress_stamp"),
////    CalendarModel(date: Calendar.current.date(from: DateComponents(year: 2024, month: 8, day: 3))!, statusImageName: "half_progress_stamp"),
////    CalendarModel(date: Calendar.current.date(from: DateComponents(year: 2024, month: 8, day: 5))!, statusImageName: "no_progress_stamp")
////]
>>>>>>> Stashed changes
