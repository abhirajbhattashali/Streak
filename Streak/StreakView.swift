import SwiftUI

enum Month: Int, CaseIterable {
    case january = 1
    case february
    case march
    case april
    case may
    case june
    case july
    case august
    case september
    case october
    case november
    case december
    
    func numberOfDays(in year:Int) -> Int{
        switch self{
        case .february:
            return isLeapYear(year) ? 29:28
        case .april,.june,.september,.november:
            return 30
        default:
            return 31
        
        }
    }
    
    var name: String {
        switch self {
        case .january: return "January"
        case .february: return "February"
        case .march: return "March"
        case .april: return "April"
        case .may: return "May"
        case .june: return "June"
        case .july: return "July"
        case .august: return "August"
        case .september: return "September"
        case .october: return "October"
        case .november: return "November"
        case .december: return "December"
        }
    }
}


func isLeapYear(_ year: Int) -> Bool {
    if year % 4 != 0 {
        return false
    } else if year % 100 != 0 {
        return true
    } else if year % 400 != 0 {
        return false
    } else {
        return true
    }
}
    

struct StreakView: View {
    
    let userStreakDays: Set<Int> = [1, 2, 4, 5, 7, 8, 11, 15, 21, 22, 25, 28, 29]
    
    
    @State var month:Month
    @State var year = 2023
    

    
    var body: some View {
        VStack(spacing: 10) {
            Text("Your \(month.name) Streak")
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(20)
            
            LazyVGrid(columns: Array(repeating: GridItem(.adaptive(minimum: 40)), count: 7), spacing: 4) {
       
                
                // Actual days of the month
                ForEach(1...month.numberOfDays(in: year), id: \.self) { day in
                    if userStreakDays.contains(day) {
                        Text("\(day)")
                            .frame(width: 30, height: 30)
                            .background(.teal)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                    } else {
                        Text("\(day)")
                            .frame(width: 30, height: 30)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(5)
                            .foregroundColor(.gray)
                    }
                }
            }
            
            Text("\(userStreakDays.count) days with a streak")
                .font(.subheadline)
        }
        .padding()
    }
}

#Preview{
    StreakView(month: Month.january, year: 2023)
    }


