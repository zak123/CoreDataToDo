//
//  TaskDelegate.h
//  CoreDataToDo
//
//  Created by Zachary Mallicoat on 3/31/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol TaskDelegate <NSObject>

- (void)addNewTask:(NSDictionary *)task;

@end
