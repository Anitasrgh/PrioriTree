//
//  ParaChaApp.swift
//  ParaCha
//
//  Created by Anita Saragih on 24/05/23.
//

import SwiftUI

@main
struct PrioriTreeApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                Screen1()
            }
            .environmentObject(listViewModel)
        }
    }
}
