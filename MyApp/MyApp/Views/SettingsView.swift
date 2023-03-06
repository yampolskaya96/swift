//
//  SettingsView.swift
//  MyApp
//
//  Created by Александра Ямпольская on 03.10.2022.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack{
            NavigationStack{
                VStack{
                    List {
                        Section("Категории") {
                            NavigationLink {
                                RevenuesCategoriesView()
                            } label: {
                                Text("Редактировать категории доходов")
                            }
                            NavigationLink {
                                ExpensesCategorieView()
                            } label: {
                                Text("Редактировать категории расходов")
                            }
                        }
                        
                        Section("Персонализация") {
                            NavigationLink {
                                //view
                            } label: {
                                Text("Выбрать тему")
                            }
                            NavigationLink {
                                //view
                            } label: {
                                Text("Валюта")
                            }
                        }
                        
                        Section{
                            NavigationLink {
                                //view
                            } label: {
                                Text("О разработчике")
                            }
                        }
                       
                    }
                }
                .navigationTitle("Settings")
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
