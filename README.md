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
3. Change output locations: 

	TFile * f = TFile::Open(Form("/eos/cms/store/group/phys_heavyions/huangxi/Pythia8310_13TeV/Nch60_0/pp_highMultGen_nChGT%d_%d.root",(int)NchCut,jobNumber),"recreate");
4. edit number of tasks in condor.sub: (I set 4000 tasks, each containing 0.1M events)

	queue 4000
5. type 'make'
6. type 'condor_submit condor.sub'
