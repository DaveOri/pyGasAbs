F2PY := $(shell which f2py2.7 || echo f2py) #on newer Ubuntu systems, only f2py2.7 is available
FC=gfortran
CC=gcc
FCFLAGS=-c -fPIC -Wuninitialized

OBJECTS=kinds.o constants.o gasabs_module.o #report_module.o vars_index.o 

all: rosen98_gasabs.so

kinds.o:
	$(FC) $(FCFLAGS) kinds.f90 -o kinds.o

constants.o:
	$(FC) $(FCFLAGS) constants.f90 -o constants.o

#vars_index.o: kinds.o
#	$(FC) $(FCFLAGS) vars_index.f90 -o vars_index.o

#report_module.o:
#	$(FC) $(FCFLAGS) report_module.f90 -o report_module.o

gasabs_module.o:
	$(FC) $(FCFLAGS) gasabs_module.f90 -o gasabs_module.o

rosen98_gasabs.so: $(OBJECTS)
	#$(F2PY) -c --fcompiler=gfortran -I"./" -lgasabs_module -m rosen98_gasabs rosen98_gasabs.f90
	$(F2PY) -c --fcompiler=gnu95 rosen98_gasabs.pyf rosen98_gasabs.f90 $(OBJECTS)


#install: rosen98_gasabs.so
#	cp *.py ~/lib/python/
#	cp *.so ~/lib/python/

clean:
	-rm *.so *.mod *.o


# f2py -h rosen98_gasabs.pyf -m rosen98_gasabs rosen98_gasabs.f90 # create signature