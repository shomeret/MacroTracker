//
//  AddMacroView.swift
//  MacroTracker
//
//  Created by Alan Yanovich on 2024-04-26.
//

import SwiftUI
import SwiftData

struct AddMacroView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    @State private var food = ""
    @State private var date = Date()
    @State private var showAlert = false
    //@Query var macc: [Macro]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Add Macro")
                .font(.largeTitle)
            TextField("What did you eat?", text: $food)
                .padding()
                .background(
                RoundedRectangle(cornerRadius: 15)
                    .stroke()
                )
            DatePicker("Date", selection: $date)
            Button {
                if food.count > 2 {
                    sendItemToGPT()
                    //print("date is \(date)")
                }
            } label: {
                Text("Done")
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(Color(uiColor: .systemBackground))
                    .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color(uiColor: .label))
                    )
                
            }
        }
        .padding(.horizontal)
        .alert("Oops", isPresented: $showAlert) {
            Text("Ok")
        } message: {
            Text("We were unable to verify the food item. Please make sure you enter a valid food item and try again.")
        }
    }
    
    private func sendItemToGPT() {
        Task {
            do {
                let macroResult = try await OpenAIService.shared.sendPromptToChatGPT(message: food)
                    saveMacro(macroResult)
                    dismiss()
                    }
                catch {
                    if let openAIError = error as? OpenAIError {
                        switch openAIError  {
                        case .noFunctionCall:
                            showAlert = true
                        case .unableToConvertStringIntoData:
                            print(error.localizedDescription)
                            }
                        } else {
                            print(error.localizedDescription)
                        }
                    }
                }
    }
    
    private func saveMacro(_ result: MacroResult) {
        let macro = Macro(food: result.food, createdAt: .now, date: date, fats: result.fats, carbs: result.carbs, protein: result.protein)
        modelContext.insert(macro)
    }
}

#Preview {
    AddMacroView()
}
