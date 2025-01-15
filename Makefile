EXE=pp_highMultGen
GCC=g++

PYTHIAINC=${shell ~/Tools/pythia8310/bin/pythia8-config --includedir}
PYTHIALIBS=${shell ~/Tools/pythia8310/bin/pythia8-config --libdir}

FASTJETINC=${shell ~/Tools/fastjet-install/bin/fastjet-config --cxxflags}
FASTJETLIBS=${shell ~/Tools/fastjet-install/bin/fastjet-config --libs}

ROOTCFLAGS   := $(shell root-config --cflags)
ROOTLIBS     := $(shell root-config --libs)

all: $(EXE)

pp_highMultGen.o: pp_highMultGen.cc
	$(GCC) -I$(PYTHIAINC) $(FASTJETINC) $(ROOTCFLAGS) -c pp_highMultGen.cc

$(EXE): pp_highMultGen.o
	$(GCC) -O3 -I$(PYTHIAINC) $(FASTJETINC) $(ROOTCFLAGS) -o $(EXE) pp_highMultGen.o $(PYTHIALIBS)/libpythia8.a $(ROOTLIBS) -ldl $(FASTJETLIBS) 

.PHONY:clean
clean:
	-rm *.o $(EXE)
