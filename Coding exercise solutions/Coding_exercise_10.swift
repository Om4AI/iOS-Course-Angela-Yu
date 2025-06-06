func exercise() {

//    Define the User struct here
    struct User{
        let name: String
        var email: String?
        var followers: Int
        var isActive: Bool
        
        init(name: String, email: String? = nil, followers: Int, isActive: Bool) {
            self.name = name
            self.email = email
            self.followers = followers
            self.isActive = isActive
        }
        
        func logStatus(){
            if self.isActive == true{
                print("\(self.name) is working hard")
            }else{
                print("\(self.name) has left earth")
            }
        }
    }


//    Initialise a User struct here
    var Richard = User(name: "Richard", email: nil, followers: 0, isActive: false)
    Richard.logStatus()
    

//    Diagnostic code - do not change this code
    print("\nDiagnostic code (i.e., Challenge Hint):")
    var musk = User(name: "Elon", email: "elon@tesla.com", followers: 2001, isActive: true)
    musk.logStatus()
    
    print("Contacting \(musk.name) on \(musk.email!) ...")
    print("\(musk.name) has \(musk.followers) followers")
    
//    Sometime later
    musk.isActive = false
    musk.logStatus()
    
}


