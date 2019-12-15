//
//  NetworkManager.m
//  TMDbLib
//
//  Created by Tejash on 28/11/19.
//  Copyright © 2019 Dezire Technology. All rights reserved.
//
#import "NetworkManager.h"
#import "FilterUtility.h"
#import "Addition.h"

@implementation NetworkManager

//returns static object of NetworkManager Class
+ (id)sharedManager {
    static NetworkManager *sharedNetworkManager = nil;
    @synchronized(self) {
        if (sharedNetworkManager == nil)
            sharedNetworkManager = [[self alloc] init];
    }
    return sharedNetworkManager;
}

//accept the url and return with filtered / parsed object
-(void) doNetworkCall:(NSString *) url complition:(void(^)(RootClass *dict,NSError *error)) callback {
    NSURL *URL = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error) {
        
                                        //Call C Library to make addition
                                        int total = add(5,6);
                                        NSLog(@"\n Sum from C Library : %d",total);
        
                                      if(error != nil) {
                                          callback(nil,error);
                                      }else {
                                          NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                          if ([dict[@"status_code"] intValue] == 7) {
                                              // API Error :: If we give wrong APIKey
                                              NSLog(@"API Error: %@",dict[@"status_message"]);
                                              callback(nil,error);
                                          }else {
                                              
                                            //Call FilterUtility for parsing / filtering
                                            [FilterUtility.sharedManager doFilter:dict complition:^(RootClass *result) {
                                                callback(result,nil);
                                            }];
                                          }
                                          
                                      }
                                  }];
    
    [task resume];
}

@end


