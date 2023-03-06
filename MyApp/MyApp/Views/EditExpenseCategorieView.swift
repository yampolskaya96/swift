//
//  EditExpenseCategorieView.swift
//  MyApp
//
//  Created by Александра Ямпольская on 03.10.2022.
//

import SwiftUI

struct EditExpenseCategorieView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.dismiss) var dismiss
    
    var expenseCategorie: FetchedResults<ExpenseCategorie>.Element
    
    @State private var name = ""
    
    var body: some View {
        VStack{
            Form{
                TextField("\(expenseCategorie.name!)",  text: $name)
                    .onAppear {
                        name = expenseCategorie.name!
                    }
                Button(action: {
                    DataController().editExpenseCategorie(expenseCategorie: expenseCategorie, name: name, context: managedObjectContext)
                    dismiss()
                    }, label: {
                    Text("Изменить").foregroundColor(.white)
                
                    }
                ).frame(width: 100, height: 50)
                    .background(Color.blue)
                    .padding()
            }

            
            
        }
    }
}


