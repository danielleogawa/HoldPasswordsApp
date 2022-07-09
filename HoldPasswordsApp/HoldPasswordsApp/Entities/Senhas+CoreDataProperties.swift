//
//  Senhas+CoreDataProperties.swift
//  HoldPasswordsApp
//
//  Created by Danielle Nozaki Ogawa on 2022/07/08.
//
//

import Foundation
import CoreData


extension Senhas {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Senhas> {
        return NSFetchRequest<Senhas>(entityName: "Senhas")
    }

    @NSManaged public var senha: String?
    @NSManaged public var local: String?
    @NSManaged public var parenteUsuario: Usuario?

    public var wrappedSenha: String {
        senha ?? "não há senha"
    }
}

extension Senhas : Identifiable {

}
