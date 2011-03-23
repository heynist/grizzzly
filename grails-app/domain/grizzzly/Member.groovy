package grizzzly

class Member {
    static belongsTo = [project:Project, user:User]
    static hasMany = [roles:Role]
    
    String toString() {
    	user.login
    }
}
