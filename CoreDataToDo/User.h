//
//  User.h
//  CoreDataToDo
//
//  Created by Zachary Mallicoat on 3/31/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ToDoItem;

@interface User : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *todos;
@end

@interface User (CoreDataGeneratedAccessors)

- (void)addTodosObject:(ToDoItem *)value;
- (void)removeTodosObject:(ToDoItem *)value;
- (void)addTodos:(NSSet *)values;
- (void)removeTodos:(NSSet *)values;

@end
