#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    NSString *result;
       NSString *input= [NSString stringWithFormat:@"%2@-%2@-%4@", day, month, year];
        
        // build NSDate from inputString
        NSDateFormatter *dateFormatter = [NSDateFormatter new];
        dateFormatter.dateFormat = @"dd-MM-yyyy"; //  input format
        NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier: @"ru_Ru"];
        dateFormatter.locale = locale;
        NSDate *date = [dateFormatter dateFromString: input];
        
        if (date == nil) {
            result = @"Такого дня не существует";
        } else {
            dateFormatter.dateFormat = @"dd MMMM, EEEE";
            result = [dateFormatter stringFromDate:date];
        }
        [locale release];
        [dateFormatter release];
        return result;
    }

    @end
