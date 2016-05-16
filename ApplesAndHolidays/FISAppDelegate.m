//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

-(NSArray *)pickApplesFromFruits:(NSArray *)fruits
{
    NSPredicate *applesPredicate = [NSPredicate predicateWithFormat:@"self LIKE 'apple'"];
    NSArray *applesOnly = [fruits filteredArrayUsingPredicate:applesPredicate];
    return applesOnly;
}

-(NSArray *)holidaysInSeason:(NSString *)season inDatabase:(NSDictionary *)database
{
    NSDictionary *holidaysInSeasonWithSupplies = database[season];
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