# rbenv-clean
like `gem-clean` on steriods


## Installation

- `$ git clone https://github.com/bernsie/rbenv-clean ~/.rbenv/plugins/rbenv-clean`

## Usage
`rbenv-clean` is a plugin the cleans all gems installed on your system on all systems

__(truncated for documentations sake)__
```shell
$ rbenv clean

/usr/local/opt/rbenv
---------------------------------------
2.1.5
Successfully uninstalled actionpack-4.2.0.rc3
Successfully uninstalled actionview-4.2.0.rc3
Successfully uninstalled activesupport-4.2.0.rc3
ERROR:  While executing gem ... (Gem::InstallError)
gem "bigdecimal" cannot be uninstalled because it is a default gem
Successfully uninstalled builder-3.2.2
Removing bundle
Removing bundler
Successfully uninstalled bundler-1.7.9
Successfully uninstalled chunky_png-1.3.3
Removing compass
Successfully uninstalled compass-1.0.1
Successfully uninstalled compass-core-1.0.1
Successfully uninstalled compass-import-once-1.0.5

*** LOCAL GEMS ***

bigdecimal (1.2.4)
io-console (0.4.2)
json (1.8.1)
minitest (4.7.5)
psych (2.0.5)
rake (10.1.0)
rdoc (4.1.0)
test-unit (2.1.5.0)
```
