# Simplest just works build system for Vala library

Once things are understood, complex build systems like autotools will probably do
far better job than this Makefile


** Edit Makefile in src folder **

Edit COMMON_NAME and NAME_SUFFIX to control library name (also, be sure to rename 
main file in src folder as there are otherwise some inconveniences in typedir 
generation)

Version is specified with LIB_MAJOR and LIB_MINOR

For more complex case when more than one library needs to be generated you can look
at https://github.com/therebedragons101/g_data_binding_lib/blob/master/src/Makefile

```bash
cd src
make
./demo
```

Note that demo can be run without installing libraries by 
```bash
export LD_LIBRARY_PATH=/path/to/my/libraries
```


# TODO

- add .pc and .deps generation
- add resource bundling
- add rpm/deb generation
- devassistant support