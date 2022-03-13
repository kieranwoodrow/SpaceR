//
//  User+CoreDataProperties.swift
//  spaceR
//
//  Created by Kieran Woodrow on 2022/03/13.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var email: String?
    @NSManaged public var password: String?

}

extension User : Identifiable {

}
