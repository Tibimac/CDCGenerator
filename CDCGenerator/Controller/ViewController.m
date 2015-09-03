//
//  ViewController.m
//  CDCGenerator
//
//  Created by Thibault Le Cornec on 25/08/15.
//  Copyright (c) 2015 Thibault Le Cornec. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


- (IBAction)buttonOpenCDModelAction:(NSButton *)sender
{
    [self openDocument];
}


- (void)openDocument
{
    NSOpenPanel* panel = [NSOpenPanel openPanel];
    
    [panel setMessage:@"Select the CoreData Model for which you want to generate classes :"];
    [panel setAllowedFileTypes:@[@"xcdatamodeld"]];
    [panel setAllowsMultipleSelection:NO];
    [panel setCanChooseDirectories:NO];
    
    [panel beginWithCompletionHandler:^(NSInteger result)
    {
        if (result == NSFileHandlingPanelOKButton)
        {
            NSURL*  theDoc = [[panel URLs] objectAtIndex:0];
            
            NSLog(@"You have selected the following doc : %@", [theDoc absoluteURL]);
            // Open  the document.
        }
        
    }];
}

@end
