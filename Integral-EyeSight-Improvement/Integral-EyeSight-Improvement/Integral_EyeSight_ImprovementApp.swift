//
//  Integral_Eyesight_ImprovementApp.swift
//  Integral-Eyesight-Improvement
//
//  Created by Roman Kozulia on 12/10/23.
//

import SwiftUI
import CloudKit

@main

struct Integral_Eyesight_ImprovementApp: App {


    var coursesViewModel = CoursesViewModel(container: CKContainer(identifier: "iCloud.com.integraleyesight.Integral-Eyesight-Improvement"))


    var body: some Scene {
        WindowGroup {
            BaseTabView()
                .environmentObject(coursesViewModel)
        }
    }
}
