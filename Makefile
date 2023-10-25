DIR_BOOST=/net/eichler/vol26/7200/software/modules-sw/eee-boost/1.74.0/Linux/CentOS7/x86_64/
DIR_HTSLIB=/net/gs/vol3/software/modules-sw/htslib/1.9-20/Linux/CentOS7/x86_64/

CXXFLAGS += -I$(abspath include) -I${DIR_BOOST}/include -I${DIR_HTSLIB}/include --std=c++11

override LDFLAGS += -L${DIR_BOOST}/lib -L${DIR_HTSLIB}/lib -L/net/gs/vol3/software/modules-sw/gcc/8.2.0/Linux/CentOS7/x86_64/lib64 -Wl,-rpath,${DIR_BOOST}/lib,-rpath,${DIR_HTSLIB}/lib,-rpath,/net/gs/vol3/software/modules-sw/gcc/8.2.0/Linux/CentOS7/x86_64/lib64/ -lboost_program_options -lrt -lpthread -lbz2 -lhts -llzma 

.PHONY: all
all: $(addprefix,bin/,subseqfa)

bin/subseqfa: build/subseqfa.o build/util/err.o
	mkdir -p $(dir $@)
	${CXX} ${CPPFLAGS} ${CXXFLAGS} ${LDFLAGS} -o $@ $^

build/util/%.o: src/util/%.cpp include/seqtools/util/%.h
	mkdir -p $(dir $@)
	$(CXX) -c $(CPPFLAGS) $(CXXFLAGS) -o $@ $<

build/%.o: src/%.cpp
	mkdir -p $(dir $@)
	${CXX} -c ${CPPFLAGS} ${CXXFLAGS} -o $@ $<

clean:
	rm -rf build

