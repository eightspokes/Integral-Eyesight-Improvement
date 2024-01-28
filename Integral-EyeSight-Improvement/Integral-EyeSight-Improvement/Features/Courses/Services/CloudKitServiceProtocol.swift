//
//  CloudKitServiceProtocol.swift
//  Integral-Eyesight-Improvement
//
//  Created by Roman Kozulia on 1/21/24.
//

import Foundation
import CloudKit

protocol CloudKitServiceProtocol {
    func fetchAllLessons() async throws -> [Lesson]
    func fetchAllCourses() async throws -> [Course]
}
