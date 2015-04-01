//
//  AddToDoViewController.h
//  CoreDataToDo
//
//  Created by Zachary Mallicoat on 3/31/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoItem.h"
#import "TaskDelegate.h"
#import "User.h"
#import "User+UserExtension.h"

@interface AddToDoViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) NSManagedObjectContext *managedContext;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerView;

@end
