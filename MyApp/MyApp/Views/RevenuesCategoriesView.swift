//
//  RevenuesCategoriesView.swift
//  MyApp
//
//  Created by Александра Ямпольская on 02.10.2022.
//

import SwiftUI

struct RevenuesCategoriesView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.id , order: .reverse)]) var revenueCategorie: FetchedResults<RevenueCategorie>
    
    @State private var showingAddView = false
    
    var body: some View {
        NavigationStack{
            VStack{
                List {
                    ForEach(revenueCategorie) { revenueCategorie in
                        NavigationLink(destination: EditRevenueCategorieView(revenueCategorie: revenueCategorie) ) {
                            VStack(alignment: .leading, spacing: 6) {
                                Text(revenueCategorie.name!)
                                    .bold()
                            }
                        }
                        
                    }.onDelete(perform: deleteCategorie)
                    
                }.listStyle(.plain)
            }
                .navigationTitle("Мои доходы")
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
                        AddRevenueCategorieView()
                    }
        }
        
        
    }
    
    private func deleteCategorie(offsets: IndexSet) {
        withAnimation {
            offsets.map { revenueCategorie[$0]}.forEach(managedObjectContext.delete)
            
            DataController().save(context: managedObjectContext)
        }
    }
}

struct RevenuesCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        RevenuesCategoriesView()
    }
}
