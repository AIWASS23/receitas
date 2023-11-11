//
//  ContentView.swift
//  Receitas
//
//  Created by Marcelo de Araújo on 06/11/2023..
//

import SwiftUI
import CoreData

struct ContentView: View {
    var fetcher: FetchMealsProtocol
    
    var body: some View {
        NavigationView {
            MealListView(fetcher: fetcher)
        }
    }
}

#Preview {
    ContentView(fetcher: MealCoreDataFetcher())
}

