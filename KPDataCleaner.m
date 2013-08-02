
//
//  KPDataCleaner.m
//  KPDataCleanerExample
//
//  Created by Kamil Pyć on 8/3/13.
//  Copyright (c) 2013 Kamil Pyć. All rights reserved.
//

#import "KPDataCleaner.h"

@implementation KPDataCleaner

static UITapGestureRecognizer *doubleTapDoubleTapRecognizer;

+(void)attachToView:(UIView *)view{
    doubleTapDoubleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:[KPDataCleaner class] action:@selector(displaySelectionMenu:)];
    
    doubleTapDoubleTapRecognizer.numberOfTapsRequired = 2;
    doubleTapDoubleTapRecognizer.numberOfTouchesRequired = 2;
    
    [view addGestureRecognizer:doubleTapDoubleTapRecognizer];
}



+(void)displaySelectionMenu:(UITapGestureRecognizer*)recognizer{
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        UIActionSheet *actionSheetMenu = [[UIActionSheet alloc] initWithTitle:@"Data Cleaner" delegate:(id<UIActionSheetDelegate>)[KPDataCleaner class] cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Remove all application data",@"Quit application", nil];
        
        actionSheetMenu.cancelButtonIndex = 2;
        
        [actionSheetMenu showInView:recognizer.view];
    }
}

+ (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            [KPDataCleaner cleanApplicationData];
            break;
        case 1:
            [KPDataCleaner exitApplication];
            break;
        default:
            break;
    }
}


+(void)cleanApplicationData{
    //Clean standard user defaults
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    //Remove all files
    
    // Path to the Documents directory
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    if ([paths count] > 0)
    {
        NSError *error = nil;
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        // Print out the path to verify we are in the right place
        NSString *directory = [paths objectAtIndex:0];
        NSLog(@"Directory: %@", directory);
        
        // For each file in the directory, create full path and delete the file
        for (NSString *file in [fileManager contentsOfDirectoryAtPath:directory error:&error])
        {
            NSString *filePath = [directory stringByAppendingPathComponent:file];
            NSLog(@"File : %@", filePath);
            
            BOOL fileDeleted = [fileManager removeItemAtPath:filePath error:&error];
            
            if (fileDeleted != YES || error != nil)
            {
                // Deal with the error...
            }
        }
        
    }
    
    
}

+(void)exitApplication{
    abort();
}

+(void)removeFromView{
    [doubleTapDoubleTapRecognizer.view removeGestureRecognizer:doubleTapDoubleTapRecognizer];
    doubleTapDoubleTapRecognizer = nil;
}

@end
