# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = harbour-ContactInfo

CONFIG += sailfishapp

SOURCES += src/harbour-ContactInfo.cpp \
    src/fileio.cpp

OTHER_FILES += qml/harbour-ContactInfo.qml \
    qml/cover/CoverPage.qml \
    qml/pages/FirstPage.qml \
    qml/pages/SecondPage.qml \
    rpm/harbour-ContactInfo.changes.in \
    rpm/harbour-ContactInfo.spec \
    rpm/harbour-ContactInfo.yaml \
    translations/*.ts \
    harbour-ContactInfo.desktop \
    qml/pages/CallerPy/ResultPage.qml \
    qml/pages/Common/Banner.qml \
    qml/pages/ContactFill/api.qml \
    qml/pages/ContactFill/ContactFill.qml \
    qml/pages/ContactFill/PersonPage.qml \
    qml/pages/MainPage.qml \
    qml/pages/AboutPage.qml \
    qml/pages/CallerPy/CallerPyAbout.qml \
    qml/pages/ContactFill/ContactFillAbout.qml

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/harbour-ContactInfo-de.ts

HEADERS += \
    src/fileio.h

