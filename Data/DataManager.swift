//
//  DataManager.swift
//  FristMemo
//
//  Created by Ubinyou on 2021/04/01.
//

import Foundation
import CoreData

// MARK: - Core Data stack
class DataManager {
    static let shared = DataManager()
    private init() {
        
    }
    var mainContext : NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    var memoList = [Memo]()
    func fetchMemo() {
        let request : NSFetchRequest<Memo> = Memo.fetchRequest()
        let insertDate = NSSortDescriptor(key: "insertDate", ascending: false)
        request.sortDescriptors = [insertDate]
        
        do {
            memoList = try mainContext.fetch(request)
        }
        catch {
            print("DataManager Class Erro")
        }
    }
    func addNewMemo(_ memo:String?) {
        let newMemo = Memo(context: mainContext)
        newMemo.content = memo
        newMemo.insertDate = Date()
        fetchMemo()
        saveContext()
    }
    // MARK: - Core Data stact
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "FristMemo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {

                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

