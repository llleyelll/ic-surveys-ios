//
//  QuestionSubmission.swift
//  SurveyApp
//
//  Created by Chananchida F. on 7/7/21.
//

import Foundation

struct AnswerSubmission: Codable {
    
    let id: String
    let answers: String?
}

struct QuestionSubmission: Codable {
    
    let id: String
    let answers: [AnswerSubmission]
}

extension QuestionSubmission {
    
    var asParameters: [String: Any] {
        let encoder = JSONEncoder()
        return (try? JSONSerialization.jsonObject(with: encoder.encode(self))) as? [String: Any] ?? [:]
    }
}
