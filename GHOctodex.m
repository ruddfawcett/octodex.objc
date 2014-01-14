/**
 * @author Rex Finn <rexcfinn@gmail.com>
 * @version 1.0
 * @link http://github.com/OctodexAPI/octodex-objc
 * @package octodex-objc
*/

#import "GHOctodex.h"

// the URL to the API - strings will be appended for specification
NSString *const kBaseURL = @"https://octodexapi.herokuapp.com/";

@implementation GHOctodex

/**
 * Creates a new sharedInstance, in order to use our cURL instance method
 */

+ (instancetype)sharedInstance {
    static GHOctodex *sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        sharedInstance = [[GHOctodex alloc] init];
    });
    
    return sharedInstance;
}

/**
 * Fetches the complete octodex
 * @return the complete octodex as an array
 */

+ (NSArray*)completeOctodex {
    // new NSArray for the returned value (we need __block to access it in the block
    __block NSArray *completeOctodex = nil;
    // use our sharedInstance to start a cURL with our base URL, and get the response completion block
    [[self sharedInstance] cURL:kBaseURL completion:^id(id response) {
        // set completeOctodex to the response - in the future we'll double check if it's an array
        completeOctodex = response;
        
        // set a return for the block
        return nil;
    }];
    
    // return our completeOctodex array
    return completeOctodex;
}

/**
 * Fetches a random octocat
 * @return the single octocat as an array
 */

+ (NSDictionary*)randomOctocat {
    // new NSDictionary for the returned value (we need __block to access it in the block
    __block NSDictionary *randomOctocat = nil;
    // use our sharedInstance to start a cURL with our base URL, and get the response completion block
    [[self sharedInstance] cURL:[kBaseURL stringByAppendingString:@"?random"] completion:^id(id response) {
        // set randomOctocat to the response - in the future we'll double check if it's a dictionary
        randomOctocat = response;
        
        // set a return for the block
        return nil;
    }];
    
    // return our randomOctocat dictionary
    return randomOctocat;
}

/**
 * Fetches an octocat by its number
 * @param NSUInteger number the number of the octocat
 * @return the single octocat as an array
 */

+ (NSDictionary*)numberedOctocat:(NSUInteger)number {
    // new NSDictionary for the returned value (we need __block to access it in the block
    __block NSDictionary *numberedOctocat = nil;
    // use our sharedInstance to start a cURL with our base URL, and get the response completion block
    [[self sharedInstance] cURL:[kBaseURL stringByAppendingString:[NSString stringWithFormat:@"?number=%d",number]] completion:^id(id response) {
        // set numberedOctocat to the response - in the future we'll double check if it's a dictionary
        numberedOctocat = response;
        
        // set a return for the block
        return nil;
    }];
    
    // return our numberedOctocat dictionary
    return numberedOctocat;
}

/**
 * Performs all cURLs that are initated in each function, protected function
 * @param NSString *endpoint is the URL of the cURL
 * @return the JSON as a decoded array
 */

- (void)cURL:(NSString*)endpoint completion:(id(^)(id response))result {
    // create a new NSMutableURLRequest
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:endpoint]];
    // set the request type to GET
    request.HTTPMethod = @"GET";
    
    // new error to catch errors
    NSError *error;
    // new url resposne
    NSURLResponse *response = nil;
    
    // the data from our resposne
    NSData *jsonData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    // set result for the block as deserialized JSON
    result([NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error]);
}

@end
