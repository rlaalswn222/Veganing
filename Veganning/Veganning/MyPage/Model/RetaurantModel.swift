//
//  RetaurantModel.swift
//  Veganning
//
//  Created by 김민주 on 8/21/24.
//


import Foundation

struct RestaurantModel: Identifiable {
    let id = UUID()
    let restaurantImage: String //식당 사진
    var restaurantName: String //식당 이름
    var adress: String //식당 주소
    var openTime: Date // 영업 시작 시간
    var closeTime: Date // 영업 종료 시간
    var link: String? //식당 홈페이지
    var tel: String //식당 전화번호
    var menu1: String? //식당 메뉴
    var menu2: String?
    var menu3: String?
    var menu4: String?
    var filter: String // 비건, 오토, 락토,,,
    var star: Int // 리뷰 평점 (1~5)
}

//오픈시각, 종료시각 string -> date
let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    return formatter
}()

let restaurantData = [
    RestaurantModel(
        restaurantImage: "restaurant1",
        restaurantName: "amin",
        adress: "서울 마포구 동교로52길 10-7",
        openTime: dateFormatter.date(from: "10:00")!, // Date로 변환
        closeTime: dateFormatter.date(from: "21:00")!, // Date로 변환
        link: "https://app.catchtable.co.kr/ct/shop/we.salad.you",
        tel: "0507-1461-2407",
        menu1: "모로코 잘룩 플레이트 25,000",
        menu2: "터키 츨브르 플레이트 23,000",
        menu3: "이스라엘 샥슈카 플레이트 25,500",
        filter: "비건",
        star: 3
    ),
    RestaurantModel(
        restaurantImage: "restaurant2",
        restaurantName: "lazyfarmers",
        adress: "서울 용산구 회나무로35길 5 A동 레이지파머스",
        openTime: dateFormatter.date(from: "10:00")!,
        closeTime: dateFormatter.date(from: "21:00")!,
        link: "https://app.catchtable.co.kr/ct/shop/we.salad.you",
        tel: "0507-1419-6301",
        menu1: "7월 월간채식 : 바질 2인 59,000",
        menu2: "토마토 라구 파스타 25,000",
        menu3:"캐슈넛 크림 미소 파스타 24,000",
        menu4:"브로콜리 크림 수프 8,000",
        filter: "비건",
        star: 4
    ),
    RestaurantModel(
        restaurantImage: "restaurant3",
        restaurantName: "lazyfarmers"
        , adress: "서울 성북구 화랑로5길 4 빌라드코스테스",
        openTime: dateFormatter.date(from: "10:00")!,
        closeTime: dateFormatter.date(from: "22:00")!,
        link: "http://app.catchtable.co.kr/ct/shop/lazyfarmers",
        tel: "0507-1360-5532",
        menu1: "해산물 빠에야 26,000", 
        menu2: "레몬 꿀대구 21,000",
        filter: "오보",
        star: 1)
    
]
