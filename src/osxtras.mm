

#include <QtGui>
#include "osxtras.h"

#include <Foundation/NSUserDefaults.h>

// enable lion full screen
void OsxFullScreen(QWidget* mainwin) {
#if __MAC_OS_X_VERSION_MAX_ALLOWED >= 1070
  NSView *nsview = (NSView *) mainwin->winId();
  NSWindow *nswindow = [nsview window];
  [nswindow setCollectionBehavior:NSWindowCollectionBehaviorFullScreenPrimary];
#endif
}


// disable lion extra manu items
void OsxDisableXtraMenu(void) {
#if __MAC_OS_X_VERSION_MAX_ALLOWED >= 1070
  [[NSUserDefaults standardUserDefaults]
    setBool:YES forKey:@"NSDisabledCharacterPaletteMenuItem"];
#endif
}

