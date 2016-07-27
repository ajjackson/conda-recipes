# conda-recipes

## Build
```
$ cd framework
$ conda build .
```

## Upload to anaconda
```
$ anaconda login
$ anaconda upload /path/to/conda/conda-bld/linux-64/mantid-framework-nightly-py27_0.tar.bz2
```

## User installation of mantid framework conda package
```
$ conda install -c mantid mantid-framework
```

[Design document](../../../documents/blob/master/Design/Anaconda.md)
