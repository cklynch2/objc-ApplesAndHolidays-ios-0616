//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

// This method filters an array of fruits, so that the return array just has apples.
-(NSArray *)pickApplesFromFruits:(NSArray *)fruits
{
    NSPredicate *applesPredicate = [NSPredicate predicateWithFormat:@"self LIKE 'apple'"];
    NSArray *applesOnly = [fruits filteredArrayUsingPredicate:applesPredicate];
    return applesOnly;
}

// This method returns an array of the holidays listed in a given season.
-(NSArray *)holidaysInSeason:(NSString *)season inDatabase:(NSDictionary *)database
{
// 1. Isolate one season from the database. Each season is a key and its associated holidays a subdictionary in the database. Capture the holiday subdictionary in a new season-specific dictionary, by assigning it to database[key] where key is the season you want.
    NSDictionary *holidaysInSeasonWithSupplies = database[season];
// 2. The holidays for the chosen season are keys in the season-specific dictionary, so use allKeys to capture all the holidays in an array.
    NSArray *holidaysInSeason = [holidaysInSeasonWithSupplies allKeys];
    NSLog(@"These are the holidays in the %@ season: %@", season, holidaysInSeason);
    return holidaysInSeason;
}

-(NSArray *)suppliesInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database
{
    NSArray *suppliesInHolidayInSeason = database[season][holiday];
    return suppliesInHolidayInSeason;
}

-(BOOL)holiday:(NSString *)holiday isInSeason:(NSString *)season inDatabase:(NSDictionary *)database
{
    BOOL isHolidayInSeason = [[self holidaysInSeason:season inDatabase:database] containsObject:holiday];
    return isHolidayInSeason;
}

-(BOOL)supply:(NSString *)supply isInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database
{
    BOOL isSupplyInHoliday = [[self suppliesInHoliday:holiday inSeason:season inDatabase:database] containsObject:supply];
    return isSupplyInHoliday;
}

-(NSDictionary *)addHoliday:(NSString *)holiday toSeason:(NSString *)season inDatabase:(NSDictionary *)database
{
    NSMutableDictionary *databaseWithNewHolidayInSeason = [database mutableCopy];
    databaseWithNewHolidayInSeason[season][holiday] = [[NSMutableArray alloc]init];
    return databaseWithNewHolidayInSeason;
}

 -(NSDictionary *)addSupply:(NSString *)supply toHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database
{
    NSMutableDictionary *databaseWithNewSuppliesForHoliday = [database mutableCopy];
    databaseWithNewSuppliesForHoliday[season][holiday] = [[self suppliesInHoliday:holiday inSeason:season inDatabase:database] arrayByAddingObject:supply];
    return databaseWithNewSuppliesForHoliday;
}

@end