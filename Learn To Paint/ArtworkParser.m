//
//  ArtworkParser.m
//  XMLTesting
//
//  Created by Jack Murdock on 12/18/13.
//  Copyright (c) 2013 Jack Murdock. All rights reserved.
//

#import "ArtworkParser.h"
#import "Oeuvre.h"
#import "Artwork.h"
#import "GDataXMLNode.h"

@implementation ArtworkParser
+(Oeuvre *)loadOeuvre:(NSString *)filePath
{
    //NSURL *fileURL = [NSURL URLWithString:@"http://jackcreeksoftware.com/wp-includes/LearnToPaint/Oeuvre.xml"];
    
    //NSData *xmlData = [[NSMutableData alloc] initWithContentsOfURL:fileURL];
    NSData *xmlData = [[NSMutableData alloc] initWithContentsOfFile:filePath];
    NSError *error;
    
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:xmlData options:0 error:&error];
    if (!doc)
    {
        return nil;
    }
    
    Oeuvre *oeuvre = [[Oeuvre alloc] init];
    NSArray *combinationArtworks = [doc nodesForXPath:@"//Oeuvre/Artwork" error:nil];
    for(GDataXMLElement *combinationArtwork in combinationArtworks)
    {
        // Let's fill these in!
        NSString *title;
        NSString *cost;
        NSString *file;
        NSString *description;
        
        // Title
        NSArray *titles = [combinationArtwork elementsForName:@"Title"];
        if(titles.count > 0)
        {
            GDataXMLElement * firstTitle = (GDataXMLElement *) [titles objectAtIndex:0];
            title = firstTitle.stringValue;
            
        }else continue;
        
        // cost
        NSArray *costs = [combinationArtwork elementsForName:@"Price"];
        if(costs.count > 0)
        {
            GDataXMLElement *firstCost = (GDataXMLElement *) [costs objectAtIndex:0];
            cost = firstCost.stringValue;
        }else continue;
        
        // Detail
        NSArray *details = [combinationArtwork elementsForName:@"Detail"];
        if(details.count > 0)
        {
            GDataXMLElement *firstDetail = (GDataXMLElement *) [details objectAtIndex:0];
            description = firstDetail.stringValue;
        }else continue;
        
        // file
        NSArray *files = [combinationArtwork elementsForName:@"ImageFile"];
        if(files.count > 0)
        {
            GDataXMLElement *firstFile = (GDataXMLElement *) [files objectAtIndex:0];
            file = firstFile.stringValue;
        } else continue;
        
        Artwork *artwork = [[Artwork alloc] initWithTitle:title Cost:cost Detail:description File:file ];
        [oeuvre.artworks addObject:artwork];
        
        
        
        
    }
    return oeuvre;
}

@end
