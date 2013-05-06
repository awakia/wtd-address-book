//
//  Created by Kenzan Hase
//  Copyright (c) Kenzan Hase. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "OAuthX.h"

#pragma mark - interface
@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    NSString *photosPath_;
}


#pragma mark - property
@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property(nonatomic, retain) OAuthX *oauthx;
@property(nonatomic, retain) NSOperationQueue *operationQueue;

- (NSString *) photosPath;

@end
