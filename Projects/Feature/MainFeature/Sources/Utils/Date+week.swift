import Foundation

public extension Date {
    // 날짜가 오늘과 같은지 비교하는 함수
    func isSameDay(as date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(self, inSameDayAs: date)
    }
    
    // 요일을 반환하는 함수
    func dayOfWeek() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"  // 요일 형식
        formatter.locale = Locale(identifier: "ko_KR")  // 한국어 요일
        return formatter.string(from: self)  // 요일 반환
    }
}
