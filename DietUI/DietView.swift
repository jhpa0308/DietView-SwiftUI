//
//  DietView.swift
//  DietUI
//
//  Created by Ji Hye PARK on 6/2/24.
//

import SwiftUI

struct DietView: View {
    @State private var recommendedDiet: String = "AI에서 추천받는 응답을 기다리고 있습니다..."
    @State private var selectedDate = Date() // Selected date, initially set to today
    
    @State private var isBreakfastExpanded: Bool = true
    @State private var isLunchExpanded: Bool = true
    @State private var isDinnerExpanded: Bool = true
    @State private var isSnackExpanded: Bool = true

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // Calendar section
                VStack(alignment: .leading, spacing: 8) {
                    Text("일주일치 캘린더")
                        .font(.title)
                        .padding(.bottom, 5)
                    
                    // Generate a week of dates
                    HStack(spacing: 10) {
                        ForEach(0..<7) { index in
                            VStack(alignment: .center) { // Center align each day
                                Text("\(self.dayOfWeek(index))") // Display day of week
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                Text("\(self.date(for: index))") // Display date
                                    .fontWeight(.bold)
                                    .foregroundColor(self.isSelectedDate(index) ? .blue : .primary) // Apply special style for selected date
                            }
                            .frame(maxWidth: .infinity) // Equal width for each VStack
                        }
                    }
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .padding(.bottom, 20)
                    .padding(.top, 20)
                }
                
                Text("오늘의 추천식단")
                    .font(.title)
                    .padding(.bottom, 5)

                Text(recommendedDiet)
                    .font(.body)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.bottom, 30)

                Text("오늘의 식단일지")
                    .font(.title)
                    .padding(.bottom, 5)
                
                DisclosureGroup("아침", isExpanded: $isBreakfastExpanded) {
                    MealView(mealType: "아침")
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .padding()
                }
                .padding(.bottom, 10)

                DisclosureGroup("점심", isExpanded: $isLunchExpanded) {
                    MealView(mealType: "점심")
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .padding()
                }
                .padding(.bottom, 10)

                DisclosureGroup("저녁", isExpanded: $isDinnerExpanded) {
                    MealView(mealType: "저녁")
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .padding()
                }
                .padding(.bottom, 10)

                DisclosureGroup("간식", isExpanded: $isSnackExpanded) {
                    MealView(mealType: "간식")
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .padding()
                }
                .padding(.bottom, 10)
            }
            .padding()
        }
        .onAppear {
            fetchRecommendedDiet()
        }
    }
    
    // Function to get the day of the week
    private func dayOfWeek(_ day: Int) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        let date = Calendar.current.date(byAdding: .day, value: day, to: Date()) ?? Date()
        return dateFormatter.string(from: date)
    }
    
    // Function to get the date
    private func date(for day: Int) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let date = Calendar.current.date(byAdding: .day, value: day, to: Date()) ?? Date()
        return dateFormatter.string(from: date)
    }
    
    // Function to check if the date is selected date
    private func isSelectedDate(_ day: Int) -> Bool {
        let date = Calendar.current.date(byAdding: .day, value: day, to: Date()) ?? Date()
        return Calendar.current.isDate(date, inSameDayAs: selectedDate)
    }

    func fetchRecommendedDiet() {
        // 여기에 AI 추천 식단을 가져오는 네트워크 요청 코드를 추가하세요.
        // 예시로 고정된 텍스트를 사용합니다.
        recommendedDiet = "AI 추천 식단 예시: 닭가슴살 샐러드, 현미밥, 과일, 요거트"
    }
}

struct DietView_Previews: PreviewProvider {
    static var previews: some View {
        DietView()
    }
}







