//
//  HorizontalCalendar.swift
//  ToDo
//
//  Created by Sunha on 4/17/24.
//

import SwiftUI

struct HorizontalCalendarView: View {
    @State private var currentDate = Date() // 현재 선택된 날짜
    let today = Date() // 오늘 날짜

    var body: some View {
        let daysInMonth = self.daysInMonth(date: currentDate)
        let daysArray = (1...daysInMonth).map { $0 }
        
        ScrollViewReader { value in
            VStack(alignment: .leading) {
                // 월 이름 표시
                Text("오늘은 \(monthName(date: currentDate)) \(currentDay(date: today))🌸")
                    .font(.subheadline)
                   
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(daysArray, id: \.self) { day in
                            Text("\(day)")
                                .id(day)  // 각 날짜에 고유 ID 할당
                                .frame(width: 40, height: 40)
                                .background(isToday(day: day) ? Color.purple : (currentDay(date: currentDate) == day ? Color.blue : Color.clear))
                                .foregroundColor(isToday(day: day) || currentDay(date: currentDate) == day ? .white : .black)
                                .cornerRadius(25)
                            
                                .onTapGesture {
                                    self.currentDate = self.getDate(day: day, currentDate: currentDate)
                                    value.scrollTo(day, anchor: .center) // 탭할 때 해당 위치로 스크롤
                                
                                }
                        }
                    }
                    .padding()
                }
                .onAppear {
                    value.scrollTo(currentDay(date: today), anchor: .center) // 초기 로딩 시 오늘 날짜로 스크롤
                }
            }
        }
    }
    
    // 월 이름을 반환하는 함수
    func monthName(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM" // 월 이름만 표시
        return formatter.string(from: date)
    }

    // 연도를 반환하는 함수
    func year(date: Date) -> Int {
        let components = Calendar.current.dateComponents([.year], from: date)
        return components.year ?? 0
    }
    
    // 현재 날짜의 일자를 반환
    func currentDay(date: Date) -> Int {
        let components = Calendar.current.dateComponents([.day], from: date)
        return components.day ?? 1
    }
    
    // 특정 일자로 날짜 객체를 생성
    func getDate(day: Int, currentDate: Date) -> Date {
        var components = Calendar.current.dateComponents([.year, .month, .day], from: currentDate)
        components.day = day
        return Calendar.current.date(from: components) ?? currentDate
    }
    
    // 해당 달의 일수를 계산
    func daysInMonth(date: Date) -> Int {
        let range = Calendar.current.range(of: .day, in: .month, for: date)!
        return range.count
    }

    // 오늘 날짜인지 확인
    func isToday(day: Int) -> Bool {
        let componentsToday = Calendar.current.dateComponents([.year, .month, .day], from: today)
        let componentsCurrent = Calendar.current.dateComponents([.year, .month, .day], from: currentDate)
        return componentsToday.year == componentsCurrent.year && componentsToday.month == componentsCurrent.month && componentsToday.day == day
    }
}

struct HorizontalCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalCalendarView()
    }
}

