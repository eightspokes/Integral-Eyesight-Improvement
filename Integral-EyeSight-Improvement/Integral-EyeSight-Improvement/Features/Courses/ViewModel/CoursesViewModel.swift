//
//  CoursesViewModel.swift
//  Integral-Eyesight-Improvement
//
//  Created by Roman Kozulia on 12/16/23.
//

import Foundation
import CloudKit


class CoursesViewModel: ObservableObject {


    @Published var courses: [Course] = []
    @Published var lessons: [Lesson] = []

    let cloudKitService: CloudKitServiceProtocol

    init(cloudKitService: CloudKitServiceProtocol){
        self.cloudKitService = cloudKitService
    }

    @MainActor
    func fetchCloudKitRecords() async throws {
        lessons = try await cloudKitService.fetchAllLessons()
        courses = try await cloudKitService.fetchAllCourses()
    }
}
