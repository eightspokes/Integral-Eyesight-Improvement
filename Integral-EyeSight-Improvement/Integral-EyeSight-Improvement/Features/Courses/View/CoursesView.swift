//
//  HomeView.swift
//  Integral-Eyesight-Improvement
//
//  Created by Roman Kozulia on 12/10/23.
//

import SwiftUI
import CloudKit

struct CoursesView: View {

    @EnvironmentObject var  coursesViewModel: CoursesViewModel
    var body: some View {
        VStack {
            Text(coursesViewModel.lessons.first?.title ?? "")
            Text(coursesViewModel.lessons.first?.description ?? "Value unavailable")
            Text(coursesViewModel.lessons.first?.videoStreamUrl ?? "Value unavailable")
            Text(coursesViewModel.lessons.first?.videoDownloadUrl ?? "Value unavailable")
            Text("\(coursesViewModel.lessons.first?.tags.count ?? 0)")

            Text(coursesViewModel.courses.first?.title ?? "not available")
            if let isPaid =  coursesViewModel.courses.first?.isPaid {
                Text("Is Paid \(isPaid)")
            }


            }
            .task {
                do{
                    try await coursesViewModel.fetchCloudKitRecords()
                }catch{

                }
        }
    }
}

#Preview {
    CoursesView()
        .environmentObject(CoursesViewModel(cloudKitService: CloudKitService(container: CKContainer(identifier: "iCloud.com.integraleyesight.Integral-Eyesight-Improvement"))))
}
