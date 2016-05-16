//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

-(NSArray *)pickApplesFromFruits:(NSArray *)fruits;

-(NSArray *)holidaysInSeason:(NSString *)season
                  inDatabase:(NSDictionary *)database;

-(NSArray *)suppliesInHoliday:(NSString *)holiday
                     inSeason:(NSString *)season
                   inDatabase:(NSDictionary *)database;

-(BOOL)holiday:(NSString *)holiday
    isInSeason:(NSString *)season
    inDatabase:(NSDictionary *)database;

-(BOOL)supply:(NSString *)supply
  isInHoliday:(NSString *)holiday
     inSeason:(NSString *)season
   inDatabase:(NSDictionary *)database;

-(NSDictionary *)addHoliday:(NSString *)holiday
                   toSeason:(NSString *)season
                 inDatabase:(NSDictionary *)database;

-(NSDictionary *)addSupply:(NSString *)supply
                 toHoliday:(NSString*)holiday
                  inSeason:(NSString *)season
                inDatabase:(NSDictionary *)database;

@end
