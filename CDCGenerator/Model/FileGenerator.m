//
//  FileGenerator.m
//  CDCGenerator
//
//  Created by François Juteau on 03/09/2015.
//  Copyright (c) 2015 Thibault Le Cornec. All rights reserved.
//

#import "FileGenerator.h"

@implementation FileGenerator

+(void)generateDataCoordinator:(NSURL *)url
{
    // Création du répertoire
    NSFileManager * fileManager = [NSFileManager defaultManager];
    NSError *error;
    [fileManager createDirectoryAtPath:url.path
           withIntermediateDirectories:YES
                            attributes:nil
                                 error:&error];
    if (error)
    {
        NSLog(@"Failed to create dir : %@", error.localizedDescription);
    }
    
    // Récupération du path du bundle
    NSString *bundlePath = [[NSBundle mainBundle] bundlePath];
    NSString *resourcesPath = [NSString stringWithFormat:@"%@%@", bundlePath, @"/Contents/Resources"];
    
    // LOGS
    NSArray *fileList = [fileManager contentsOfDirectoryAtPath:resourcesPath error:&error];
    for ( NSString *fileName in fileList)
    {
        NSLog(@"%@", fileName);
    }
    
    // Creation du DataCoordinator.h
    NSString *newDCHFileUrl = [NSString stringWithFormat:@"%@%@", url.path, @"/DataCoordinator.h"]; // New file complete path
    NSString *DCHResourcesPath = [NSString stringWithFormat:@"%@%@", resourcesPath, @"/DataCoordinator.h.txt"]; // Resources file complete path
    
    [fileManager createFileAtPath:newDCHFileUrl contents:[NSData dataWithContentsOfFile:DCHResourcesPath] attributes:nil];
    
    // Creation du DataCoordinator.m
    NSString *newDCMFileUrl = [NSString stringWithFormat:@"%@%@", url.path, @"/DataCoordinator.m"]; // New file complete path
    NSString *DCMResourcesPath = [NSString stringWithFormat:@"%@%@", resourcesPath, @"/DataCoordinator.m.txt"]; // Resources file complete path
    
    [fileManager createFileAtPath:newDCMFileUrl contents:[NSData dataWithContentsOfFile:DCMResourcesPath] attributes:nil];
    
    // Creation des DataModel.h
    NSString *newDMHFileUrl = [NSString stringWithFormat:@"%@%@", url.path, @"/DataModel.h"]; // New file complete path
    NSString *DMHResourcesPath = [NSString stringWithFormat:@"%@%@", resourcesPath, @"/DataModel.h.txt"]; // Resources file complete path
    
    [fileManager createFileAtPath:newDMHFileUrl contents:[NSData dataWithContentsOfFile:DMHResourcesPath] attributes:nil];
    
    // Creation des DataModel.m
    NSString *newDMMFileUrl = [NSString stringWithFormat:@"%@%@", url.path, @"/DataModel.m"]; // New file complete path
    NSString *DMMResourcesPath = [NSString stringWithFormat:@"%@%@", resourcesPath, @"/DataModel.m.txt"]; // Resources file complete path
    
    [fileManager createFileAtPath:newDMMFileUrl contents:[NSData dataWithContentsOfFile:DMMResourcesPath] attributes:nil];
}

@end
