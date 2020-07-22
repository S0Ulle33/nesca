QT += core gui multimedia widgets

CONFIG += c++11
QMAKE_CFLAGS += -Wno-write-strings 
QMAKE_CXXFLAGS += -Wno-write-strings -Wno-narrowing -fpermissive

TARGET = nesca
RC_ICONS = nesca.ico
TEMPLATE = app
SOURCES +=\
    main.cpp \
    ActivityDrawerTh_HorNet.cpp \
    base64.cpp \
    DrawerTh_GridQoSScanner.cpp \
    DrawerTh_HorNet.cpp \
    DrawerTh_ME2Scanner.cpp \
    DrawerTh_QoSScanner.cpp \
    DrawerTh_VoiceScanner.cpp \
    nesca.cpp \
    piestat.cpp \
    progressbardrawer.cpp \
    STh.cpp \
    finder.cpp \
    WebformWorker.cpp \
    Connector.cpp \
    Utils.cpp \
    BruteUtils.cpp \
    BasicAuth.cpp \
    FTPAuth.cpp \
    Threader.cpp \
    SSHAuth.cpp \
    FileUpdater.cpp \
    FileDownloader.cpp \
    MainStarter.cpp \
    IPRandomizer.cpp \
    HikvisionLogin.cpp \
    RTSP.cpp \
    IPCAuth.cpp


HEADERS  += \
    ActivityDrawerTh_HorNet.h \
    base64.h \
    DrawerTh_GridQoSScanner.h \
    DrawerTh_HorNet.h \
    DrawerTh_ME2Scanner.h \
    DrawerTh_QoSScanner.h \
    DrawerTh_VoiceScanner.h \
    externData.h \
    externFunctions.h \
    mainResources.h \
    nesca.h \
    nesca.rc \
    piestat.h \
    progressbardrawer.h \
    resource.h \
    STh.h \
    Utils.h \
    WebformWorker.h \
    Connector.h \
    BasicAuth.h \
    BruteUtils.h \
    FTPAuth.h \
    Threader.h \
    SSHAuth.h \
    FileUpdater.h \
    FileDownloader.h \
    MainStarter.h \
    IPRandomizer.h \
    HikvisionLogin.h \
    RTSP.h \
    IPCAuth.h

FORMS    += \
    nesca.ui

RESOURCES += \
    nesca.qrc

OTHER_FILES +=

win32: LIBS += -lws2_32


win32: LIBS += -L$$PWD/3rdparty/curl_x86-windows/lib/ -llibcurl_imp

INCLUDEPATH += $$PWD/3rdparty/curl_x86-windows/include
DEPENDPATH += $$PWD/3rdparty/curl_x86-windows/include

win32: LIBS += -L$$PWD/3rdparty/hikvision/lib/ -lHCNetSDK

INCLUDEPATH += $$PWD/3rdparty/hikvision/include
DEPENDPATH += $$PWD/3rdparty/hikvision/include

win32: LIBS += -L$$PWD/3rdparty/libssh_x86-windows/lib/ -lssh

INCLUDEPATH += $$PWD/3rdparty/libssh_x86-windows/include
DEPENDPATH += $$PWD/3rdparty/libssh_x86-windows/include

win32: LIBS += -L$$PWD/3rdparty/openssl-windows_x86-windows/lib/ -llibeay32

INCLUDEPATH += $$PWD/3rdparty/openssl-windows_x86-windows/include
DEPENDPATH += $$PWD/3rdparty/openssl-windows_x86-windows/include

win32: LIBS += -L$$PWD/3rdparty/openssl-windows_x86-windows/lib/ -lssleay32

INCLUDEPATH += $$PWD/3rdparty/openssl-windows_x86-windows/include
DEPENDPATH += $$PWD/3rdparty/openssl-windows_x86-windows/include

win32: LIBS += -L$$PWD/3rdparty/zlib_x86-windows/lib/ -lzlib

INCLUDEPATH += $$PWD/3rdparty/zlib_x86-windows/include
DEPENDPATH += $$PWD/3rdparty/zlib_x86-windows/include

unix: LIBS += -lssh
unix: LIBS += -lcrypto
unix: LIBS += -lcurl
