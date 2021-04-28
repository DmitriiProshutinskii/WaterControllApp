//
//  DailyNorm+CoreDataProperties.swift
//  WaterControllApp
//
//  Created by Физтех.Радио on 31.03.2021.
//
//

import Foundation
import CoreData


extension DailyNorm {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DailyNorm> {
        return NSFetchRequest<DailyNorm>(entityName: "DailyNorm")
    }

    @NSManaged public var day: Date?
    @NSManaged public var wasDrunk: Int16

}

extension DailyNorm : Identifiable {

}
