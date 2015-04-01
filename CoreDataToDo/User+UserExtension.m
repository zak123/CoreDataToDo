//
//  User+UserExtension.m
//  CoreDataToDo
//
//  Created by Zachary Mallicoat on 4/1/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import "User+UserExtension.h"


@implementation User (UserExtension)



+(User *) createUserWithName:(NSString*)name {
    AppDelegate *appdelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectModel *managedObjectModel = appdelegate.managedObjectModel;
    NSEntityDescription *entity = [managedObjectModel entitiesByName][@"User"];
    
    
    User *newUser = [[User alloc]
                                initWithEntity:entity insertIntoManagedObjectContext:appdelegate.managedObjectContext];
    newUser.name = name;
    
     return newUser;
}


@end
