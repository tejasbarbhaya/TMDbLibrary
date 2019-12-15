//
//  FilterUtility.m
//  TMDb
//
//  Created by Tejas Bharbaya on 14/12/19.
//  Copyright © 2019 Dezire Technology. All rights reserved.
//

#import "FilterUtility.h"

@implementation FilterUtility

// returns static object of this class
+ (id)sharedManager {
    static FilterUtility *sharedFilterUtility = nil;
    @synchronized(self) {
        if (sharedFilterUtility == nil)
            sharedFilterUtility = [[self alloc] init];
    }
    return sharedFilterUtility;
}

//It does filter / sort based on specified set of dictionary

-(void) doFilter:(NSDictionary *) dict complition:(void(^)(RootClass *result)) callback {
    RootClass *result = [[RootClass alloc] initWithDictionary:dict];
    
    //Filter array based on 2017,2018 movie release date
    NSMutableArray *mutableArray = [NSMutableArray array];
    for (Result *obj in result.results) {
        if ([self isObjectFiltered:obj.releaseDate]) {
            [mutableArray addObject:obj];
        }
    }
    
    //Sort Array based on "VoteAverage"
    NSArray *sortedArray = [mutableArray sortedArrayUsingComparator:^NSComparisonResult(Result *p1, Result *p2){
        NSNumber *num1 = [NSNumber numberWithFloat:p1.voteAverage];
        NSNumber *num2 = [NSNumber numberWithFloat:p2.voteAverage];
        return [num1 compare:num2];
    }];
    sortedArray = [[sortedArray reverseObjectEnumerator] allObjects];
    
    
    //Get first 10 objects
    sortedArray = [sortedArray subarrayWithRange:NSMakeRange(0, MIN(10, [sortedArray count]))];
    
    result.results = sortedArray;
    result.totalResults = mutableArray.count;
    
    callback(result);
}

// Filter by Year, 2017-2018
-(BOOL) isObjectFiltered:(NSString *) dateString {
    BOOL isDateFiltered = false;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *dateFromString = [[NSDate alloc] init];
    
    dateFromString = [dateFormatter dateFromString:dateString];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitYear) fromDate:dateFromString];
    
    if (components.year >= 2017) {
        if (components.year <= 2018) {
            isDateFiltered = true;
        }
    }
    return isDateFiltered;
}


@end
