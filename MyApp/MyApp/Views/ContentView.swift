//
//  ContentView.swift
//  MyApp
//
//  Created by Александра Ямпольская on 02.10.2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View {
        VStack{
            
            //нижнее меню навигации
            TabView{
                
                HistoryView()
                    .tabItem {
                        Image(systemName: "clock.arrow.circlepath")
                    }
                ChartView()
                    .tabItem {
                        Image(systemName: "chart.pie")
                    }
                SettingsView()
                    .tabItem {
                        Image(systemName: "gearshape.fill")
                    }
                
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
    }
}
