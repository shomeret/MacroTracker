//
//  MacroDayView.swift
//  MacroTracker
//
//  Created by Alan Yanovich on 2024-04-27.
//

import SwiftUI

extension Date {
    var monthAndDay: String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "MMM d"
        return formatter.string(from: self)
    }
    
    var time: String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "h:mm a"
        return formatter.string(from: self)
    }
    
    var year: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY"
        return formatter.string(from: self)
    }
}

struct MacroDayView: View {
    @State var macro: DailyMacro
    var body: some View {
            HStack {
                VStack(alignment: .leading) {
                    Text(macro.date.monthAndDay)
                        .font(.title2)
                    
                    Text(macro.date.year)
                        .font(.title2)
                        .foregroundStyle(.secondary)
                }
                .frame(width: 80, alignment: .leading)
                HStack {
                    Spacer()
                    
                    VStack {
                        Image("carbs")
                            .resizable()
                            .scaledToFit()
                        Text("Carbs")
                        Text("\(macro.carbs) g")
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1))
                    )
                    
                    //Spacer()
                    
                    VStack {
                        Image("fats")
                            .resizable()
                            .scaledToFit()
                        Text("Fats")
                        Text("\(macro.fats) g")
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1))
                    )
                    
                    //Spacer()
                    
                    VStack {
                        Image("proteins")
                            .resizable()
                            .scaledToFit()
                        Text("Protein")
                        Text("\(macro.protein) g")
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1))
                    )

                }
            }.padding(.leading)
        }
    }

#Preview {
    MacroDayView(macro: DailyMacro(date: .now, fats: 12, carbs: 11, protein: 13))
}
