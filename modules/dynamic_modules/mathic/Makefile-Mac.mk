#Build mathic dynamic module for LINUX
#
#There is no tool or dependency needed on a typical linux
#installation. To build the simple.so and simple change your
#directory to the modules/dynamic_modules/mathic/ folder 
#
#user $ cd modules/dynamic_modules/mathic/
#
#This is to ensure That the output generated are in 
#appropriate `dist` folder in modules folder. 
#Execute the below command in your command prompt of bash
#
#simple/src/makefiles/mathic/ $ make -f Makefile-Linux.mk

# Flags
CFLAGS= -c -fpic -g -w
LFlAGS= -lm -ldl
LDFLAGS= "-Wl,-rpath,./ ../../bin/ $(DESTDIR)$(PREFIX)/lib/ ~/lib/,--no-as-needed"

# Macros
CND_PLATFORM=
CND_DLIB_EXT=dysim
CND_BUILDDIR=build
CND_DISTDIR =../dist

# Object Directory
OBJECTDIR=$(CND_DISTDIR)/$(CND_BUILDDIR)/$(CND_PLATFORM)

# Simple Object Directory
SIMPLE_OBJECTDIR=../../../simple/dist/$(CND_BUILDDIR)/$(CND_PLATFORM)

# Object Files
OBJECTFILES= \
	$(OBJECTDIR)/mathic.o

# Simple Object Files
SIMPLE_OBJECTFILES = \
	$(SIMPLE_OBJECTDIR)/simple_api.o 
	
# Link Libraries and Options
LDLIBSOPTIONS=../../../simple/dist/libsimple.dylib

${CND_DISTDIR}/${CND_PLATFORM}/libmathic.${CND_DLIB_EXT}: $(OBJECTFILES)
	$(CC) -shared $(ARC_FLAG) -o $(CND_DISTDIR)/$(CND_PLATFORM)/libmathic.$(CND_DLIB_EXT) $(OBJECTFILES) $(LDLIBSOPTIONS)

$(OBJECTDIR)/mathic.o: mathic.c
	mkdir -p $(OBJECTDIR)
	$(CC) $(ARC_FLAG) $(CFLAGS) mathic.c
	mv mathic.o $(OBJECTDIR)

clean:
	@- $(RM) $(OBJECTDIR)/*.o
	@- $(RM) $(program_OBJS)

distclean: clean

#This Makefile-Windows.mk was written in adaptation to the standard
#method of writing makefiles
#
#If this make file does not work on your LINUX PC feel free to 
#write your own Makefile and send us a pull request at 
#https://github.com/simple-lang/simple . Your make file must follow 
#the below format for request to be accepted
#
#File-Name : Makefile-Linux-{distro}.mk
#
#e.g Makefile-Linux-mint-cinnamon.mk
#
#looking forward to your contribution
#Thank You
