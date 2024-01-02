//
//  CoursesViewModel.swift
//  Integral-Eyesight-Improvement
//
//  Created by Roman Kozulia on 12/16/23.
//

import Foundation
import CloudKit

enum CoursesType: String {
    case videos = "Videos"
}

class CoursesViewModel: ObservableObject {
    private var database: CKDatabase
    private var container: CKContainer

    @Published var videos: [Video] = []

    init(container: CKContainer){
        self.container = container
        self.database = self.container.publicCloudDatabase
    }
    @MainActor
    func initializeVideos() async throws {
        let query = CKQuery(recordType: CoursesType.videos.rawValue, predicate: NSPredicate(value: true))
        let result = try await database.records(matching: query)
        let records = result.matchResults.compactMap{ try? $0.1.get() }
        videos = records.compactMap {
            Video(record: $0)
        }
    }
}
