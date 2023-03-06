//
//  ExpensesCategorieView.swift
//  MyApp
//
//  Created by Александра Ямпольская on 03.10.2022.
//

import SwiftUI

struct ExpensesCategorieView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.id , order: .reverse)]) var expenseCategorie: FetchedResults<ExpenseCategorie>
    
    @State private var showingAddView = false
    
    var body: some View {
        NavigationStack{
            VStack{
                List {
                    ForEach(expenseCategorie) { expenseCategorie in
                        NavigationLink(destination: EditExpenseCategorieView(expenseCategorie: expenseCategorie) ) {
                            VStack(alignment: .leading, spacing: 6) {
                                Text(expenseCategorie.name!)
                                    .bold()
                            }
                        }
                        
                    }.onDelete(perform: deleteCategorie)
                    
                }.listStyle(.plain)
            }
                .navigationTitle("Мои расходы")
                .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                showingAddView.toggle()
                            } label: {
                                Label("Add ", systemImage: "plus.circle")
                            }
                        }
                        ToolbarItem(placement: .navigationBarLeading) {
                            EditButton()
                        }
                    }
                .sheet(isPresented: $showingAddView) {
                        AddExpenseCategorieView()
                    }
        }
    }
    
    private func deleteCategorie(offsets: IndexSet) {
        withAnimation {
            offsets.map { expenseCategorie[$0]}.forEach(managedObjectContext.delete)
            
            DataController().save(context: managedObjectContext)
        }
    }
    }



struct ExpensesCategorieView_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesCategorieView()
    }
}
