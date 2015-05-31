MGFinderView
===============

MGFinderView is an animated finder view useful for instance to focus or to suggest a point of the screen to the user.

<img src="Multimedia/image.png" alt="MGConferenceDatePicker Screenshot" width=400px />

## Info

This code must be used under ARC. 
If your code doesn't use ARC you can [mark this source with the compiler flag](http://www.codeography.com/2011/10/10/making-arc-and-non-arc-play-nice.html) `-fobjc-arc` 

## Example Usage

```objc
MGFinderView *finderView = [[MGFinderView alloc] initWithSquareSide:150 color:[UIColor greenColor]];
[self.view addSubview:finderView];
[finderView startAnimating];
```
