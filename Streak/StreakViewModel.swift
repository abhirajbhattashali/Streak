//
//  StreakViewModel.swift
//  Streak
//
//  Created by Abhiraj on 30/10/23.
//

import Foundation

class StreakViewModel: ObservableObject{
// 1 for January, 12 for December
    
    let years: [Int] = Array((2000...2030))
    let months: [String] = DateFormatter().monthSymbols
}
