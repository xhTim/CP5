# CP5
Steps to generate MC events
1. Install Pythia8310: https://pythia.org/releases/
   Install FastJet: https://fastjet.fr/quickstart.html
   Install FASTJET-contrib : https://fastjet.hepforge.org/contrib/
2. Modify locations of Pythia and FastJet in Makefile: 
	PYTHIAINC=${shell ~/Tools/pythia8310/bin/pythia8-config --includedir}
	PYTHIALIBS=${shell ~/Tools/pythia8310/bin/pythia8-config --libdir}

	FASTJETINC=${shell ~/Tools/fastjet-install/bin/fastjet-config --cxxflags}
	FASTJETLIBS=${shell ~/Tools/fastjet-install/bin/fastjet-config --libs}
3. Change random seeds in pp_highMultGen.cc: (I fixed them to be 12345 + 4001 + jobNumber and 12345 + jobNumber for my two samples, respectively)
	int jobNumber = std::atoi(argv[1]);
	int uniqueSeed = 12345 + 4001 + jobNumber;
	
	pythia.readString("Random:setSeed = on");
	pythia.readString("Random:seed = " + std::to_string(uniqueSeed));
4. Change output locations: 
	TFile * f = TFile::Open(Form("/eos/cms/store/group/phys_heavyions/huangxi/Pythia8310_13TeV/Nch60_0/pp_highMultGen_nChGT%d_%d.root",(int)NchCut,jobNumber),"recreate");
5. edit number of tasks in condor.sub: (I set 4000 tasks, each containing 0.1M events)
	queue 4000
6. type 'make'
7. type 'condor_submit condor.sub'
