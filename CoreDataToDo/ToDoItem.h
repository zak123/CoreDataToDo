//
//  ToDoItem.h
//  CoreDataToDo
//
//  Created by Zachary Mallicoat on 4/1/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class User;

@interface ToDoItem : NSManagedObject

@property (nonatomic, retain) NSNumber * completed;
@property (nonatomic, retain) NSDate * creationDate;
@property (nonatomic, retain) NSString * taskDescription;
@property (nonatomic, retain) NSString * taskName;
@property (nonatomic, retain) User *user;

@end
