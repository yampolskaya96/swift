//
//  AddRevenueCategorie.swift
//  MyApp
//
//  Created by Александра Ямпольская on 02.10.2022.
//

import SwiftUI

struct AddRevenueCategorieView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    
    var body: some View {
        VStack{
            Spacer()
            VStack{
                NavigationStack{
                    VStack{
                        Form{
                            TextField("",  text: $name)
                                .navigationTitle("Введите категорию для ваших доходов")
                        }

                        Button(action: {
                            DataController().addRevenueCategorie(name: name, context: managedObjectContext)
                            dismiss()
                            }, label: {
                            Text("Добавить").foregroundColor(.white)
                        
                            }
                        ).frame(width: 100, height: 50)
                            .background(Color.blue) 
                            .padding()
                        
                    }
                }
            }.frame(height: 206)
        }
    }
}

struct AddRevenueCategorie_Previews: PreviewProvider {
    static var previews: some View {
        AddRevenueCategorieView()
    }
}
