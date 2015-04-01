    //
//  AddToDoViewController.m
//  CoreDataToDo
//
//  Created by Zachary Mallicoat on 3/31/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import "AddToDoViewController.h"


@interface AddToDoViewController ()
@property (strong, nonatomic) IBOutlet UITextField *addTaskInput;
@property (strong, nonatomic) IBOutlet UITextField *addDescriptionInput;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@end

@implementation AddToDoViewController {
    NSArray *pickerData;
    NSString *pickerSelection;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [super viewDidLoad];
    
    // Initialize Data
    pickerData = @[@"Zach", @"Danny", @"Shahin", @"Samya", @"Brian"];
    
    // Connect data
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    
}

- (long)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (long)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 5;
}
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return pickerData[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    pickerSelection = pickerData[row];
    NSLog(@"%@", pickerSelection);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)didDone:(id)sender {
    [self saveNewTask];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    // Insert new object
    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"Touch: Keyboard should disappear");
    
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}


- (BOOL)hasDuplicates:(ToDoItem *)todoItem ofEntity: (NSEntityDescription*)entity forPredicate:(NSPredicate*)predicate{
    
    if (entity == nil ) YES;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    [fetchRequest setEntity:entity];
    [fetchRequest setPredicate:predicate];
    
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedContext sectionNameKeyPath:nil cacheName:nil];
    
    BOOL hasSimilarObject = NO;
    NSError *error = nil;
    if (![aFetchedResultsController performFetch:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    }
    else
    {
        hasSimilarObject = !(aFetchedResultsController.fetchedObjects.count == 0);
        NSLog(@"similar user");
    }
    
    return hasSimilarObject;
}

- (void)saveNewTask {
    if (self.addTaskInput.text.length > 0 && self.addDescriptionInput.text.length > 0) {
        //task and description not nil and add object
        
        ToDoItem *todoItem = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([ToDoItem class]) inManagedObjectContext:nil];
        // Edit the entity name as appropriate.
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"ToDoItem" inManagedObjectContext:self.managedContext];
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(taskName like %@) AND (taskDescription like %@)", todoItem.taskName, todoItem.taskDescription];
        
        if ([self hasDuplicates:todoItem ofEntity:entity forPredicate:predicate] == NO) {
            [todoItem setTaskName:self.addTaskInput.text];
            [todoItem setTaskDescription:self.addDescriptionInput.text];
            User *user = [User createUserWithName:pickerSelection];
            
            
            [self.managedContext insertObject:user];
            user.todos = [NSSet setWithObject:todoItem];
            NSError *error = nil;
            if (![self.managedContext save:&error]) {
                NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
                abort();
            }
        }
    }
}


- (IBAction)didCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    
    
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
