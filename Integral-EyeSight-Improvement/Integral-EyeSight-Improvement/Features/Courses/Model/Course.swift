//
//  Course.swift
//  Integral-Eyesight-Improvement
//
//  Created by Roman Kozulia on 12/28/23.
//

import Foundation
struct Course {
    let id: UUID
    let courseName: String
    let courseDescription: String
    let thumbnail: String
    var videoItems: [Video]?

    init(id: UUID, courseName: String, courseDescription: String, thumbnail: String, videoItems: [Video]?) {
        self.id = id
        self.courseName = courseName
        self.courseDescription = courseDescription
        self.thumbnail = thumbnail
        self.videoItems = videoItems
    }
}
