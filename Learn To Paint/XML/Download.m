//
//  Download.m
//  Learn To Paint
//
//  Created by Jack Murdock on 12/20/13.
//  Copyright (c) 2013 Jack Murdock. All rights reserved.
//

#import "Download.h"

@implementation Download

-(NSString *)getLocalFileFromURLString:(NSString *)fileURL
{
    NSString *stringURL = [NSString stringWithFormat:@"http://jackcreeksoftware.com/wp-includes/LearnToPaint/%@", fileURL];
    _pathFile = fileURL;
    NSURL *URL = [NSURL URLWithString:stringURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if (connection)
    {
        _recievedData = [NSMutableData data];
    }
    
    return _pathFile;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
   // NSLog(@"%@", [response description]);
}

- (void) connection:(NSURLConnection*)connection didFailWithError:(NSError*) error
{
    NSLog(@"Download Fail : %d", [error code]);
    NSLog(@"No internet conectivity or it is very slow.");
    // Delete files download possible corruption
    
    
}

- (void) connectionDidFinishLoading:(NSURLConnection*)connection
{
    // save the file
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath = [documentsPath stringByAppendingPathComponent:_pathFile];
    
    [_recievedData writeToFile:filePath atomically:YES];
    
    [_delegate fileDidLoad:filePath];
    
   }

- (void) connection: (NSURLConnection*) connection didReceiveData: (NSData*) data
{
    
    
    [_recievedData appendData:data];
    
    [_delegate updateDownload:_recievedData.length outOf:_recievedData.length];
    
}
@end
