//
//  HistoryView.swift
//  MyApp
//
//  Created by Александра Ямпольская on 03.10.2022.
//

import SwiftUI

struct HistoryView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var amountItem: FetchedResults<AmountItem>
    
    @State private var showingAddView = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading){
                
                List {
                    ForEach(amountItem) { amountItem in
                        NavigationLink(destination: Text("ye") ) {
                            HStack {
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(amountItem.categorie ?? "no category")
                                        .bold()
                                    
                                    Text("\(Int(amountItem.value))") + Text(" $")
                                }
                                Spacer()
                                Text("\(amountItem.date!, format: Date.FormatStyle().year().month().day())")
                                    .foregroundColor(.gray)
                                    .italic()
                            }
                        }
                        

                    }
                    .onDelete(perform: deleteItem)
                }
                .listStyle(.plain)
                
            }
            //.navigationTitle("History")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 50){
                        Text("History")
                        //кнопка фильтрации
                        Image(systemName: "line.3.horizontal.decrease.circle.fill")
                    }
                }
            }
            //.sheet(isPresented: $showingAddView) {
                //AddView()
            //}
            Divider().padding(.vertical, 15)
            
            HStack( spacing: 50){
                    Button {
                        self.showingAddView  = true
                    } label: {
                        Text("Add revenue")
                    }
                    .sheet(isPresented: $showingAddView , content: {
                        AddAmountItemView()
                    })
                    .padding()
                    .background(Color.yellow)
                    
            }
            Spacer()
            Divider().padding(.vertical, 15)
        }
    }
        private func deleteItem(offsets: IndexSet) {
          withAnimation {
       offsets.map { amountItem[$0]}.forEach(managedObjectContext.delete)
       DataController().save(context: managedObjectContext)
       }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}

