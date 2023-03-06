//
//  MyAppApp.swift
//  MyApp
//
//  Created by Александра Ямпольская on 02.10.2022.
//

import SwiftUI

@main

struct MyAppApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext )
        }
    }
}
