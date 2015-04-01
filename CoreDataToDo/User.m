//
//  User.m
//  CoreDataToDo
//
//  Created by Zachary Mallicoat on 3/31/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import "User.h"
#import "ToDoItem.h"
#import "AppDelegate.h"

@implementation User

@dynamic name;
@dynamic todos;

-(User *) createUser {
    
    NSManagedObjectModel *managedObjectModel = AppDelegate.managedObjectModel;
    NSEntityDescription *entity =
    [[managedObjectModel entitiesByName]
    NSManagedObject *newObject = [[NSManagedObject alloc]
                                  initWithEntity:entity insertIntoManagedObjectContext:AppDelegate.managedObjectContext];
    return newObject;
    
}

@end
