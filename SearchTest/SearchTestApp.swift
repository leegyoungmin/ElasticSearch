//
//  SearchTestApp.swift
//  SearchTest
//
//  Created by 이경민 on 2022/05/12.
//

import SwiftUI
import FirebaseCore

@main
struct SearchTestApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
