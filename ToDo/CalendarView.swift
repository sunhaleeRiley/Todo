import SwiftUI

struct CalendarView: View {
    @State private var calendarData = CalendarData(month: 4, year: 2024)

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    calendarData.previousMonth()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.purple)
                }
                
                Spacer()

                Text(calendarData.monthString())
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.purple)
                
                Spacer()
                
                Button(action: {
                    calendarData.nextMonth()
                }) {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.purple)
                }
            }
            .padding()

            let days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 25) {
                ForEach(days, id: \.self) { day in
                    Text(day)
                        .bold()
                      
                }
                
                ForEach(0..<calendarData.dayOffset(), id: \.self) { _ in
                    Text("")
                }
                
                ForEach(calendarData.daysInMonth(), id: \.self) { day in
                    Text(day)
                        .frame(width: 40, height: 40)
                        .background(Color("lightgray"))
                        .foregroundColor(.black)
                        .cornerRadius(35)
                }
            }
            .padding()
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}

