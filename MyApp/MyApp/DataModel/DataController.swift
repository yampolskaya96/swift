//
//  DataController.swift
//  MyApp
//
//  Created by Александра Ямпольская on 02.10.2022.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    
    let container = NSPersistentContainer(name: "MyAppModel")
    
    init() {
        container.loadPersistentStores {  desc, error in
            if let error = error {
                print("Failed to load data \(error.localizedDescription)")
            }
            
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved!! WUHU!!")
        } catch {
            print("We could not save the data...")
        }
    }
    
    //доходы
    func addRevenueCategorie(name: String, context: NSManagedObjectContext) {
        let revenueCategorie = RevenueCategorie(context: context)
        revenueCategorie.id = UUID()
        revenueCategorie.name = name
        
        save(context: context)
    }
    
    func editRevenueCategorie(revenueCategorie: RevenueCategorie, name: String, context: NSManagedObjectContext) {
        revenueCategorie.name = name
        save(context: context)
    }
    
    //расходы
    func addExpenseCategorie(name: String, context: NSManagedObjectContext) {
        let expenseCategorie = ExpenseCategorie(context: context)
        expenseCategorie.id = UUID()
        expenseCategorie.name = name
        
        save(context: context)
    }
    
    func editExpenseCategorie(expenseCategorie: ExpenseCategorie, name: String, context: NSManagedObjectContext) {
        expenseCategorie.name = name
        save(context: context)
    }
    
    
    //записи
    func addAmountItem(value: Double, categorie: String? , date: Date,  context: NSManagedObjectContext, id: UUID) {
        let amountItem = AmountItem(context: context)
        amountItem.id = UUID()
        amountItem.categorie = categorie
        amountItem.date = date
        amountItem.value = value
        
        save(context: context)
    }
    
    func editAmountItem(value: Double, categorie: String, date: Date,  context: NSManagedObjectContext, amountItem: AmountItem) {
        
        amountItem.categorie = categorie
        amountItem.date = date
        amountItem.value = value
        
        save(context: context)
    }
    
   
}
