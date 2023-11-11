//
//  ReceitasApp.swift
//  Receitas
//
//  Created by Marcelo de Araújo on 06/11/2023..
//

import SwiftUI

@main
struct ReceitasApp: App {
    let persistenceController = PersistenceController.instance
    let networkMonitor = NetworkMonitor.instance
    
    func fetchData() -> FetchMealsProtocol {
        var fetcher : FetchMealsProtocol = MealCoreDataFetcher()
        if networkMonitor.isConnected {
            fetcher = MealAPIFetcher(urlSession: URLSession.shared)
        }
        return fetcher
    }
    var body: some Scene {
        WindowGroup {
            ContentView(fetcher: fetchData())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
