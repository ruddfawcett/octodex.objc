/**
 * @author Rudd Fawcett <rexcfinn@gmail.com>
 * @version 1.0
 * @link http://github.com/OctodexAPI/octodex-objc
 * @package octodex-objc
*/

#import <Foundation/Foundation.h>

@interface GHOctodex : NSObject

/**
 * Fetches the complete octodex
 * @return the complete octodex as an array
 */
+ (NSArray*)completeOctodex;

/**
 * Fetches a random octocat
 * @return the single octocat as an array
 */
+ (NSDictionary*)randomOctocat;

/**
 * Fetches an octocat by its number
 * @param NSUInteger number the number of the octocat
 * @return the single octocat as an array
 */
+ (NSDictionary*)numberedOctocat:(NSUInteger)number;

@end
