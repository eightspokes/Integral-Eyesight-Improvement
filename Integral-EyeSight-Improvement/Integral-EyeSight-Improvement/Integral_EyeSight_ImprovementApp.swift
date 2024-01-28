import SwiftUI
import CloudKit

@main
struct Integral_Eyesight_ImprovementApp: App {

    let cloudKitService: CloudKitService

    var coursesViewModel: CoursesViewModel

    init() {
        cloudKitService = CloudKitService(container: CKContainer(identifier: "iCloud.com.integraleyesight.Integral-Eyesight-Improvement"))
        coursesViewModel = CoursesViewModel(cloudKitService: cloudKitService)
    }

    var body: some Scene {
        WindowGroup {
            BaseTabView()
                .environmentObject(coursesViewModel)
        }
    }
}
