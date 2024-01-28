import Foundation
import CloudKit

enum LessonKeys: String {
    // Required
    case recordType = "Lessons"
    case title = "title"
    case description = "description"
    case tags = "tags"
    case thumbnail = "thumbnail"

    // Optional
    case supplementalTexts_optional = "supplementalTexts_optional"
    case supplementalPictures_optional = "supplementalPictures_optional"
    case videoStreamUrl_optional = "videoStreamUrl_optional"
    case videoDownloadUrl_optional = "videoDownloadUrl_optional"
    case releaseDate_optional = "releaseDate_optional"
}

struct Lesson {
    var recordID: CKRecord.ID
    var title: String
    var description: String
    var tags: [String]
    var thumbnail: CKAsset?

    var supplementalTexts: [CKAsset]?
    var supplementalPictures: [CKAsset]?
    var videoStreamUrl: String?
    var videoDownloadUrl: String?
    var releaseDate: Date?

    init(record: CKRecord) {
        guard let title = record[LessonKeys.title.rawValue] as? String else {
            fatalError("Title is required and should always be present in the record.")
        }
        guard let description = record[LessonKeys.description.rawValue] as? String else {
            fatalError("Description is required and should always be present in the record.")
        }
        guard let tags = record[LessonKeys.tags.rawValue] as? [String] else {
            fatalError("Tags are required and should always be present in the record.")
        }
        guard let thumbnail = record[LessonKeys.thumbnail.rawValue] as? CKAsset else {
            fatalError("Thumbnail is required and should always be present in the record.")
        }

        self.recordID = record.recordID
        self.title = title
        self.description = description
        self.tags = tags
        self.thumbnail = thumbnail

        self.supplementalTexts = record[LessonKeys.supplementalTexts_optional.rawValue] as? [CKAsset] ?? []
        self.supplementalPictures = record[LessonKeys.supplementalPictures_optional.rawValue] as? [CKAsset] ?? []
        self.videoStreamUrl = record[LessonKeys.videoStreamUrl_optional.rawValue] as? String
        self.videoDownloadUrl = record[LessonKeys.videoDownloadUrl_optional.rawValue] as? String
        self.releaseDate = record[LessonKeys.releaseDate_optional.rawValue] as? Date
    }
}

extension Lesson {
    func toCKRecord() -> CKRecord {
        let record = CKRecord(recordType: CKRecordType.Lessons.rawValue)
        record[LessonKeys.title.rawValue] = title as CKRecordValue
        record[LessonKeys.description.rawValue] = description as CKRecordValue
        record[LessonKeys.tags.rawValue] = tags as CKRecordValue

        if let thumbnail = thumbnail {
            record[LessonKeys.thumbnail.rawValue] = thumbnail as CKRecordValue
        }


        if let supplementalTexts = supplementalTexts {
            record[LessonKeys.supplementalTexts_optional.rawValue] = supplementalTexts as CKRecordValue
        }
        if let supplementalPictures = supplementalPictures {
            record[LessonKeys.supplementalPictures_optional.rawValue] = supplementalPictures as CKRecordValue
        }
        if let videoStreamUrl = videoStreamUrl {
            record[LessonKeys.videoStreamUrl_optional.rawValue] = videoStreamUrl as CKRecordValue
        }

        if let videoDownloadUrl = videoDownloadUrl {
            record[LessonKeys.videoDownloadUrl_optional.rawValue] = videoDownloadUrl as CKRecordValue
        }
        if let releaseDate = releaseDate {
            record[LessonKeys.releaseDate_optional.rawValue] = releaseDate as Date
            record[LessonKeys.releaseDate_optional.rawValue] = releaseDate as Date
        }

        return record
    }
    static func fromCKRecord(_ record: CKRecord) -> Lesson {
        return Lesson(record: record)
    }
}
