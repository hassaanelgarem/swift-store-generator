//
//  ColorsStoreGenerator.swift
//  StoreGeneratorCore
//
//  Created by Hassaan El-Garem on 9/26/21.
//

import Foundation
import Files

class ColorsStoreGenerator: Generator {
    
    static let colorSetSuffix = ".colorset"
    
    func generateStore(sourceFilePath: String, destinationFilePath: String) throws {
        let colorCases = try getColors(sourceFilePath: sourceFilePath).map({ (color) -> String in
            return "case \(color)"
        })
        let string = colorCases.joined(separator: "\n\t")
        
        let storeFile = try File(path: destinationFilePath)
        var storeContent = Resources.colorTemplate
        storeContent = storeContent.replacingOccurrences(of: "{data}", with: string)
        try storeFile.write(storeContent)
    }
    
    private func getColors(sourceFilePath: String) throws -> [String] {
        let assetsFolder = try Folder(path: sourceFilePath)
        let colorFolders = assetsFolder.subfolders.filter { (folder) -> Bool in
            folder.name.hasSuffix(Self.colorSetSuffix)
        }
        let colors = colorFolders.map { (folder) -> String in
            return folder.name.replacingOccurrences(of: Self.colorSetSuffix, with: "")
        }
        return colors
    }
}
