//
//  EditRevenueCategorieView.swift
//  MyApp
//
//  Created by Александра Ямпольская on 02.10.2022.
//

import SwiftUI

struct EditRevenueCategorieView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.dismiss) var dismiss
    
    var revenueCategorie: FetchedResults<RevenueCategorie>.Element
    
    @State private var name = ""
    
    var body: some View {
        VStack{
            Form{
                TextField("\(revenueCategorie.name!)",  text: $name)
                    .onAppear {
                        name = revenueCategorie.name!
                    }
                Button(action: {
                    DataController().editRevenueCategorie(revenueCategorie: revenueCategorie, name: name, context: managedObjectContext)
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


