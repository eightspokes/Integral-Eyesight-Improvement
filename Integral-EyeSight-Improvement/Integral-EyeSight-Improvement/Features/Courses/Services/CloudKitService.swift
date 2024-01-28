//
//  CloudKitService.swift
//  Integral-Eyesight-Improvement
//
//  Created by Roman Kozulia on 1/21/24.
//

import Foundation
import CloudKit

struct CloudKitService: CloudKitServiceProtocol {

    
    
    private var database: CKDatabase
    private var container: CKContainer

    init(container: CKContainer){
        self.container = container
        self.database = self.container.publicCloudDatabase
    }



    func fetchAllLessons() async throws -> [Lesson] {
        let query = CKQuery(recordType: CKRecordType.Lessons.rawValue, predicate: NSPredicate(value: true))
        let result = try await database.records(matching: query)
        
        let records = result.matchResults.compactMap{ try? $0.1.get() }
        let lessons = records.compactMap{Lesson(record: $0)}
        return lessons
    }
    
    func fetchAllCourses() async throws -> [Course] {
        let query = CKQuery(recordType: CKRecordType.Courses.rawValue, predicate: NSPredicate(value: true))
        let result = try await database.records(matching: query)

        let records = result.matchResults.compactMap{ try? $0.1.get() }
        let courses = records.compactMap{Course(record: $0)}
        return courses
    }



}
