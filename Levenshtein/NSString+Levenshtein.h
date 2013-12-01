//
//  NSString+Levenshtein.h
//
//  Created by Alberto Pasca on 06/03/11.
//  Copyright (c) 2011 albertopasca.it. All rights reserved.
//


#import <Foundation/Foundation.h>


@interface NSString (Levenshtein)

- (float) compareWithString: (NSString *) stringB;
- (float) compareWithWord: (NSString *) stringB;
- (int)   smallestOf: (int) a andOf: (int) b andOf: (int) c;

@end
