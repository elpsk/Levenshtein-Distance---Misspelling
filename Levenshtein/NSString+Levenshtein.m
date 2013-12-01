//
//  NSString+Levenshtein.m
//
//  Created by Alberto Pasca on 06/03/11.
//  Copyright (c) 2011 albertopasca.it. All rights reserved.
//

#import "NSString+Levenshtein.h"


@implementation NSString (Levenshtein)

- (float) compareWithString: (NSString *) stringB
{
  float averageSmallestDistance = 0.0;
  float smallestDistance;
  float distance;
  
  NSMutableString * mStringA = [[NSMutableString alloc] initWithString: self];
  NSMutableString * mStringB = [[NSMutableString alloc] initWithString: stringB];
  
  [mStringA replaceOccurrencesOfString:@"\n" withString: @" " options: NSLiteralSearch range: NSMakeRange(0, [mStringA length])];
  [mStringB replaceOccurrencesOfString:@"\n" withString: @" " options: NSLiteralSearch range: NSMakeRange(0, [mStringB length])];
  
  NSArray * arrayA = [mStringA componentsSeparatedByString: @" "];
  NSArray * arrayB = [mStringB componentsSeparatedByString: @" "];
  
  NSEnumerator * emuA = [arrayA objectEnumerator];
  NSEnumerator * emuB;
  
  NSString * tokenA = NULL;
  NSString * tokenB = NULL;
  
  while ( tokenA = [emuA nextObject] ) {    
    emuB = [arrayB objectEnumerator];
    smallestDistance = 99999999.0;
    
    while ( tokenB = [emuB nextObject] )
      if ( (distance = [tokenA compareWithWord: tokenB] ) <  smallestDistance )
        smallestDistance = distance;
    
    averageSmallestDistance += smallestDistance;
  }
  
  [mStringA release];
  [mStringB release];
  
  return averageSmallestDistance / [arrayA count];
}


- (float) compareWithWord: (NSString *) stringB
{
  NSString * stringA = [NSString stringWithString: self];
  [stringA stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
  [stringB stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
  stringA = [stringA lowercaseString];
  stringB = [stringB lowercaseString];
  
  int k, i, j, cost, * d, distance;
  int n = [stringA length];
  int m = [stringB length];	
  
  if ( n++ != 0 && m++ != 0 ) {
    d = malloc( sizeof(int) * m * n );
    
    for ( k = 0; k < n; k++ ) d[k] = k;
    for ( k = 0; k < m; k++ ) d[ k * n ] = k;    
    for ( i = 1; i < n; i++ )
      for( j = 1; j < m; j++ ) {        
        if( [stringA characterAtIndex: i-1] == [stringB characterAtIndex: j-1] ) cost = 0;
        else cost = 1;        
        d[ j * n + i ] = [self smallestOf: d [ (j - 1) * n + i ] + 1 andOf: d[ j * n + i - 1 ] +  1 andOf: d[ (j - 1) * n + i -1 ] + cost ];
      }
    
    distance = d[ n * m - 1 ];
    free( d );    
    return distance;
  }
  
  return 0.0;
}


- (int) smallestOf: (int) a andOf: (int) b andOf: (int) c
{
  int min = a;
  if ( b < min ) min = b;
  if ( c < min ) min = c;  
  return min;
}


@end
