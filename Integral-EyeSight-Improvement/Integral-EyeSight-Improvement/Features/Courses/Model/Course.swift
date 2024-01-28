import Foundation
import CloudKit

struct Course {

    var courseId: CKRecord.ID?
    let title: String
    let description: String
    let thumbnail: CKAsset? // Changed to CKAsset

    let isPaid: Int64?
    let admittedUsers: [String]?
    let lessonTitles: [String]?
    let releaseDate: Date?

    init(record: CKRecord) {
        guard let title = record[CourseKeys.title.rawValue] as? String else {
            fatalError("Title is required and should always be present in the record.")
        }
        guard let description = record[CourseKeys.description.rawValue] as? String else {
            fatalError("Description is required and should always be present in the record.")
        }
        guard let thumbnail = record[CourseKeys.thumbnail.rawValue] as? CKAsset else {
            fatalError("Thumbnail is required and should always be present in the record.")
        }

        self.courseId = record.recordID
        self.title = title
        self.description = description
        self.thumbnail = thumbnail
        self.isPaid = record[CourseKeys.isPaid_optional.rawValue] as? Int64
        self.admittedUsers = record[CourseKeys.admittedUsers_optional.rawValue] as? [String] ?? []
        self.lessonTitles = record[CourseKeys.lessonTitles_optional.rawValue] as? [String] ?? []
        self.releaseDate = record[CourseKeys.releaseDate_optional.rawValue] as? Date
    }
}

enum CourseKeys: String {
    case title = "title"
    case description = "description"
    case thumbnail = "thumbnail"  // Thumbnail as CKAsset

    case isPaid_optional = "isPaid_optional"
    case admittedUsers_optional = "admittedUsers_optional"
    case lessonTitles_optional = "lessonTitles_optional"
    case releaseDate_optional = "releaseDate_optional"

}

extension Course {
    func toCKRecord() -> CKRecord {
        let record = CKRecord(recordType: CKRecordType.Courses.rawValue, recordID: courseId ?? CKRecord.ID())
        record[CourseKeys.title.rawValue] = title as CKRecordValue
        record[CourseKeys.description.rawValue] = description as CKRecordValue

        if let thumbnail = thumbnail {
            record[CourseKeys.thumbnail.rawValue] = thumbnail
        }
        if let isPaid = isPaid {
            record[CourseKeys.isPaid_optional.rawValue] = isPaid as CKRecordValue
        }
        if let admittedUsers = admittedUsers {
            record[CourseKeys.admittedUsers_optional.rawValue] = admittedUsers as CKRecordValue
        }
        if let lessonTitles = lessonTitles {
            record[CourseKeys.lessonTitles_optional.rawValue] = lessonTitles as CKRecordValue
        }
        if let releaseDate = releaseDate {
            record[CourseKeys.releaseDate_optional.rawValue] = releaseDate as CKRecordValue
        }

        return record
    }
}
