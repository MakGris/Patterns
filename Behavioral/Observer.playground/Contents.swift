import Foundation

protocol Subject {
    func addObserver(observer: PropertyObserver)
    func removeObserver(observer: PropertyObserver)
    func notify(withString string: String)
}

protocol PropertyObserver {
    func getTask(newTask task: String)
}

class Teacher: Subject {
    
    var observers = NSMutableSet()
    
    var homeTask = "" {
        didSet {
            notify(withString: homeTask)
        }
    }
    func addObserver(observer: PropertyObserver) {
        observers.add(observer)
    }
    
    func removeObserver(observer: PropertyObserver) {
        observers.remove(observer)
    }
    
    func notify(withString string: String) {
        for observer in observers {
            (observer as! PropertyObserver).getTask(newTask: string)
        }
    }
}

class Pupil: NSObject, PropertyObserver {
    
    var homeTask = ""
    func getTask(newTask task: String) {
        homeTask = task
        print("Получено домашнее задание: \(task)")
    }
}
let teacher = Teacher()
let pupil = Pupil()
teacher.addObserver(observer: pupil)
teacher.homeTask = "Прочитать параграф 5"
