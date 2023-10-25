# subseq
Pipeline for validating variant calls with support from individual reads 

# Dependencies
- boost >= 1.74.0
- htslib >= 1.9
- gcc >= 8.2.0

# Install
First, the boost and htslib dirs need to be edited in the Makefile. These are passed to the build process and are at the level of include.


```bash
make clean
make bin/subseqfa
```

