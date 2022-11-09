#----------------------------------------------------------#
# The difinition of the directories.

## The directory *src*.
SRCDIRPATH=.\src

## The directory you want to create on.
BINDIRPATH=.\bin

#----------------------------------------------------------#
# The difinition of the target you want to create.

## The target project name.
TARGET=$(BINDIRPATH)\Main

## The target projects.
all: $(TARGET)

#----------------------------------------------------------#
# The difintion for the compilers.

## The definiton of the compiler.
CCX=g++

## The difinition of the optimization.
OPTIMIZE=-o2

## The difinition of the version( of C++ ).
CPP_VERSION=-std=c++11

## The difinition of includion-path ( like -I<PATH> )
ICOMMAND=

## The difinition of LINKAGE.
LDFLAG=-O0

## The compiler flags.
CFLAG=$(OPTIMIZE) $(CPP_VERSION) $(ICOMMAND)

## The source codes you want to compile.
LINKAGEFILES=$(SRCDIRPATH)\main.o

## The difinition of MinGW-static-lib.
MINGW_STATIC_LINKAGE=-static-libgcc -static-libstdc++ -static -lpthread

#----------------------------------------------------------#
# Compile

## Compilation for the target.
$(TARGET): $(LINKAGEFILES)
	$(CCX) $(CFLAG) -o $@ $< $(MINGW_STATIC_LINKAGE) -mwindows

## Compilation for sources the compiler wants.
main.o:
	$(CCX) -c $<

#----------------------------------------------------------#
# Cleaning up

## Cleaning up
clean:
	@rm -rf $(LINKAGEFILES) $(TARGET)
