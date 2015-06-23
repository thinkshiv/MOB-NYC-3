//: Playground - noun: a place where people can play

import Foundation

class User {
    var name: String
    
    var projectsCreated: [Project] = []
    var assignedProjects: [Project] = []
    var taskAssigned: [Task] = []
    
    init(name: String)
    {
        self.name = name
    }
}

class Task {
    var title: String
    var priority: Int?
    
    var assignee: User?
    
    init(title: String){
        self.title = title
    }
    
    func assignUser(user: User){
        //Add this user to the assignee field
        self.assignee = user
        
        //Add this task to the user's assigned tasks
        user.taskAssigned.append(self)
    }
    
}

class Project {
    var title: String
    var description: String?
    var priority: Int?
    
    var assignees: [User] = []
    var creator: User
    var tasks: [Task] = []
    
    
    
    init(title: String, creator: User){
        self.title = title
        self.creator = creator
    }
    
    func assignUser(user: User) {
        // Add the user to the list of assignees in the project
        self.assignees.append(user)
        
        // Add the project to the list of projects for the user
        user.assignedProjects.append(self)
        
    }
    
    func createTask(title: String) -> Task {
        let task = Task(title: title)
        task.project = self
        self.tasks.append(task)
        return task
    }
}

let myself = User(name: "Toshi")
let final = Project(title: "My final", creator: myself)
let firstTask = final.createTask("Wireframe the app")

final.createTask("Write my spec")

final.tasks.count



/*
Projects
    title
    description
    deadline
    priority

    has one User (creator)
    has many USers (assignees)
    has many Tasks

Users
Tasks
    has one User (assignee)

CONCEPTUAL MODEL
Users are "assigned" to Projects
Users are "assigned" to Tasks
Tasks are "created" in Projects
Users can "create" Projects




*/