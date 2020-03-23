#import "TimeConverter.h"

@implementation TimeConverter
// Complete the following function
- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
        int h = [hours intValue];
        int m = [minutes intValue];
        
        if (h < 0 || h > 24 || m < 0 || m > 60) {
            return @"";
        }
        
        NSArray<NSString *> *vremya = @[@"zero", @"one", @"two", @"three",
                                      @"four", @"five", @"six", @"seven",
                                      @"eight", @"nine", @"ten", @"eleven",
                                      @"twelve", @"thirteen", @"fourteen",
                                      @"fifteen", @"sixteen", @"seventeen",
                                      @"eighteen", @"nineteen", @"twenty",
                                      @"twenty one", @"twenty two", @"twenty three",
                                      @"twenty four", @"twenty five", @"twenty six",
                                      @"twenty seven", @"twenty eight", @"twenty nine"];
        
        if (m == 0)
            return [NSString stringWithFormat:@"%@%@", vremya[h], @" o' clock"];
        else if (m == 1)
            return [NSString stringWithFormat:@"%@%@", @"one minute past ", vremya[h]];
        else if (m == 59)
            return [NSString stringWithFormat:@"%@%@", @"one minute to ", vremya[(h % 12) + 1]];
        else if (m == 15)
            return [NSString stringWithFormat:@"%@%@", @"quarter past ", vremya[h]];
        else if (m == 30)
            return [NSString stringWithFormat:@"%@%@", @"half past ", vremya[h]];
        else if (m == 45)
            return [NSString stringWithFormat:@"%@%@", @"quarter to ", vremya[(h % 12) + 1]];
        else if (m <= 30)
            return [NSString stringWithFormat:@"%@%@%@", vremya[m], @" minutes past ",  vremya[h]];
        else if (m > 30)
            return [NSString stringWithFormat:@"%@%@%@", vremya[60 - m],  @" minutes to ", vremya[(h % 12) + 1]];
        return @"";
    }
    @end
