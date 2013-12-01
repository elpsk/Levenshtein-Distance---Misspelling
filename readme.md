## Levensthein Distance - objectivec

http://en.wikipedia.org/wiki/Levenshtein_distance


Simple implementation of Levensthein Distance algorithm in ObjectiveC.


```
  Astr = @"Milano";
  Bstr = @"Mialno";
  NSLog(@"%.2f", [Astr compareWithString:Bstr]);


  OUT: 2.00
```


It's an NSString category:

```
@interface NSString (Levenshtein)

- (float) compareWithString: (NSString *) stringB;
- (float) compareWithWord: (NSString *) stringB;
- (int)   smallestOf: (int) a andOf: (int) b andOf: (int) c;

@end
```

More example on www.albertopasca.it/whiletrue/



