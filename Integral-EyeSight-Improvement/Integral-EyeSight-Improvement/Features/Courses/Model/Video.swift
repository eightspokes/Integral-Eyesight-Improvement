//
//  Video.swift
//  Integral-Eyesight-Improvement
//
//  Created by Roman Kozulia on 12/10/23.
//

import Foundation
import CloudKit

enum VideoKeys: String {
    case recordType = "Videos"
    case title = "title"
    case description = "description"
    case streamUrl = "streamUrl"
    case downloadUrl = "downloadUrl"
    case thumbnail = "thumbnail"
    case releaseDate = "releaseDate"
}
///To have another initializer other than the default.
///Uses a CKRecord for initialization
extension Video {
    init?(record: CKRecord){
        guard let title = record[VideoKeys.title.rawValue] as? String,
              let description = record[VideoKeys.description.rawValue] as? String,
              let streamUrl = record[VideoKeys.streamUrl.rawValue] as? String,
              let downloadUrl = record[VideoKeys.downloadUrl.rawValue] as? String,
              let releaseDate = record[VideoKeys.releaseDate.rawValue] as? Date,
              let thumbnail = record[VideoKeys.thumbnail.rawValue] as? String else {
            return nil
        }
        self.init(title: title, description: description, thumbnail: thumbnail, streamUrl: streamUrl, downloadUrl: downloadUrl,
        releaseDate: releaseDate)
    }
}
struct Video {
    var videoId: CKRecord.ID?
    var title: String
    var description: String
    var thumbnail: String

    var streamUrl: String

    var downloadUrl: String
    var releaseDate: Date?

    init(title: String, description: String, thumbnail: String, streamUrl: String, downloadUrl: String, releaseDate: Date? = nil) {
        self.title = title
        self.description = description
        self.thumbnail = thumbnail
        self.streamUrl = streamUrl
        self.downloadUrl = downloadUrl
        self.releaseDate = releaseDate
    }
}
