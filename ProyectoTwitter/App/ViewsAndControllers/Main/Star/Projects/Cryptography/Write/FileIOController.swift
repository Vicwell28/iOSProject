//
//  WriteDocument.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 26/09/22.
//

import Foundation

struct FileIOController {
    func write<T: Encodable>(
        _ value: T,
        toDocumentNamed documentName: String,
        encodedUsing encoder: JSONEncoder = .init()
    ) throws {
        let folderURL = try FileManager.default.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: false
        )

        let fileURL = folderURL.appendingPathComponent(documentName)
        let data = try encoder.encode(value)
        try data.write(to: fileURL)
    }
}
