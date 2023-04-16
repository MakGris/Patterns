//Виртуальный заместитель

//class User {
//    let id = "123"
//}
//
//
//protocol ServerProtocol {
//    func grantAccess(user: User)
//    func denyAccess(user: User)
//}
//
//class ServerSide: ServerProtocol {
//    func grantAccess(user: User) {
//        print("Access granted to user with id: \(user.id)")
//    }
//
//    func denyAccess(user: User) {
//        print("Access denied to user with id: \(user.id)")
//    }
//}
//
//class ServerProxy: ServerProtocol {
//
//    lazy private var server = ServerSide()
//    func grantAccess(user: User) {
//        server.grantAccess(user: user)
//    }
//
//    func denyAccess(user: User) {
//        server.denyAccess(user: user)
//    }
//}
//
//let user = User()
//let proxy = ServerProxy()
//
//proxy.grantAccess(user: user)
//proxy.denyAccess(user: user)


//Защитный заместитель
class User {
    let name = "Petr"
    let password = "123"
}

protocol ServerProtocol {
    func grantAccess(user: User)
}

class ServerSide: ServerProtocol {
    func grantAccess(user: User) {
        print("Access granted to user with name: \(user.name)")
    }
}

class ServerProxy: ServerProtocol {

    private var server: ServerSide!

    func grantAccess(user: User) {
        guard server != nil else {
            print("Access denied")
            return
        }
        server.grantAccess(user: user)
    }

    func authenicate(user: User) {
        guard user.password == "123" else { return }
        print("user authenticated")
        server = ServerSide()
    }
}

let user = User()

let proxy = ServerProxy()

proxy.grantAccess(user: user)
proxy.authenicate(user: user)
proxy.grantAccess(user: user)
