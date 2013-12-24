//
//  Download.h
//  Learn To Paint
//
//  Created by Jack Murdock on 12/20/13.
//  Copyright (c) 2013 Jack Murdock. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DownloadDelegate;
@interface Download : NSObject

@property (nonatomic, assign) id <DownloadDelegate> delegate;
@property (strong, nonatomic) NSMutableData *recievedData;
@property (strong, nonatomic) NSString *pathFile;

-(NSString *)getLocalFileFromURLString:(NSString *)fileURL;

@end

@protocol DownloadDelegate

- (void)fileDidLoad:(NSString *)filePath;
- (void)updateDownload:(int)bytes outOf:(int)totalBytes;

@end