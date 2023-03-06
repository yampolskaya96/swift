//
//  AddAmountItemView.swift
//  MyApp
//
//  Created by Александра Ямпольская on 03.10.2022.
//

import SwiftUI
import CoreData
//import Foundation

struct AddAmountItemView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.dismiss) var dismiss
    
    @FetchRequest private var revenueCategorie: FetchedResults<RevenueCategorie>
    
    @State private var selectedCategorie: RevenueCategorie
    
    init() {
           @State var dataController = DataController()
        
           let fetchRequest: NSFetchRequest<RevenueCategorie> = RevenueCategorie.fetchRequest()
           fetchRequest.sortDescriptors = [NSSortDescriptor(keyPath: \RevenueCategorie.name, ascending: false)]
           fetchRequest.predicate = NSPredicate(value: true)
           self._revenueCategorie = FetchRequest(fetchRequest: fetchRequest)
           do {
               let firstRevenueCategorie = try dataController.container.viewContext.fetch(fetchRequest)
               self._selectedCategorie = State(initialValue: firstRevenueCategorie[0])
           } catch {
               fatalError("Uh, fetch problem...")
           }
       }
    
    private func addItem() {
        DataController().addAmountItem( value: Double(Int(Int16(amountValue) ?? 0)) , categorie: selectedCategorie.name ?? "nothing" , date: date, context: managedObjectContext, id: UUID())
        dismiss()
        
    }
 
    
    @State private var amountValue = "0"
    
    @State private var date = Date()
    
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2021, month: 1, day: 1)
        let endComponents = DateComponents(year: 2030, month: 12, day: 31)
        return calendar.date(from:startComponents)!
        ...
        calendar.date(from:endComponents)!
    }()

    var body: some View {
        NavigationStack{
            
            Form{
                
                DatePicker("Date", selection: $date, in: dateRange, displayedComponents: [.date])
            
                Picker(selection: $selectedCategorie ) {
                    ForEach(revenueCategorie, id: \.self) { (revenueCategorie: RevenueCategorie) in
                             VStack(alignment: .leading, spacing: 6) {
                                 Text(revenueCategorie.name!)
                                      .bold()
                               }
                            
                       }
                } label: {
                        Text("pick")
                    }
                
                TextField("Сумма", text: $amountValue )
                    .keyboardType(.numberPad)
                    .padding()
                
                HStack(alignment: .center) {
                    Spacer()
                    Button(action: {
                        addItem()
                    }, label: {
                        Text("Добавить").foregroundColor(.white)
                        
                    }
                    ).frame(width: 100, height: 50)
                        .background(Color.blue)
                        .padding()
                    Spacer()
                }

            }
        }
    }
    
    
    struct AddAmountItemView_Previews: PreviewProvider {
        static var previews: some View {
            AddAmountItemView()
        }
    }
    
    
}

