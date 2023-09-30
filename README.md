The Komi-Zyrian morphology and tools
==========================================

[![GitHub issues](https://img.shields.io/github/issues-raw/giellalt/lang-kpv)](https://github.com/giellalt/lang-kpv/issues)
[![Build Status](https://divvun-tc.giellalt.org/api/github/v1/repository/giellalt/lang-kpv/main/badge.svg)](https://github.com/giellalt/lang-kpv/actions)
[![License](https://img.shields.io/github/license/giellalt/lang-kpv)](https://github.com/giellalt/lang-kpv/blob/main/LICENSE)
[![Desktop speller download](https://img.shields.io/badge/download%40latest-desktop--bhfst-brightgreen)](https://pahkat.uit.no/main/download/speller-kpv?platform=desktop&channel=nightly)
[![Mobile speller download](https://img.shields.io/badge/download%40latest-mobile--bhfst-brightgreen)](https://pahkat.uit.no/main/download/speller-kpv?platform=mbile&channel=nightly)

This repository contains finite state source files for the Komi-Zyrian language,
for building morphological analysers, proofing tools
and dictionaries. The data and implementation are licenced under __LICENSE__
licence, also detailed in the
[LICENSE](https://github.com/giellalt/lang-kpv/blob/main/LICENSE). The
authors named in the AUTHORS file are available to grant other licencing
choices.

Install proofing tools and [keyboards](https://github.com/giellalt/keyboard-kpv)
for the Komi-Zyrian language by using the [Divvun Installer](http://divvun.no)
(some languages are only available via the nightly channel).

Download and test speller files
-------------------------------

The speller files downloadable at the top of this page (the `*.bhfst` files) can
be used with [divvunspell](https://github.com/divvun/divvunspell), to test their
performance. These files are the exact same ones as installed on users' computers
and mobile phones. Desktop and mobile speller files differ from each other in the
error model and should be tested separately — thus also two different downloads.

Documentation
-------------

Documentation can be found at:

- [Language specific documentation](https://giellalt.github.io/lang-kpv/)
- [General documentation](https://giellalt.github.io/)

See also:

- [Research Questions](docs/ResearchQuestions.markdown)

Core dependencies
-----------------

In order to compile and use Komi-Zyrian language morphology and
dictionaries, you need:

- an FST compiler: [HFST](https://github.com/hfst/hfst), [Foma](https://github.com/mhulden/foma) or [Xerox Xfst](https://web.stanford.edu/~laurik/fsmbook/home.html)
- [VislCG3](https://visl.sdu.dk/svn/visl/tools/vislcg3/trunk) Constraint Grammar tools

To install VislCG3 and HFST, just copy/paste this into your Terminal on **Mac OS X**:

```
curl https://apertium.projectjj.com/osx/install-nightly.sh | sudo bash
```

or terminal on **Ubuntu, Debian or Windows Subsystem for Linux**:

```
wget https://apertium.projectjj.com/apt/install-nightly.sh -O - | sudo bash
sudo apt-get install cg3 hfst
```

or terminal on **RedHat, Fedora, CentOS or Windows Subsystem for Linux**:

```
wget https://apertium.projectjj.com/rpm/install-nightly.sh -O - | sudo bash
sudo dnf install cg3 hfst
```

Alternatively, the Apertium wiki has good instructions on how to [install the dependencies for Mac
OS X](https://wiki.apertium.org/wiki/Apertium_on_Mac_OS_X) and how to [install
the dependencies on
linux](https://wiki.apertium.org/wiki/Installation_of_grammar_libraries)

Further details and dependencies are described on the GiellaLT [Getting Started](https://giellalt.uit.no/infra/GettingStarted.html) pages.

Downloading
-----------

Using Git:
```
git clone https://github.com/giellalt/lang-kpv
```

Using Subversion:
```
svn checkout https://github.com/giellalt/lang-kpv.git/trunk lang-kpv
```

Building and installation
-------------------------

[INSTALL](https://github.com/giellalt/lang-kpv/blob/main/INSTALL)
describes the GNU build system in detail, but for most users it is the usual:

```sh
./autogen.sh # This will automatically clone or check out other GiellaLT dependencies
./configure
make
(as root) make install
```
w
Citing
------

Jack Rueter, Niko Partanen, Mika Hämäläinen, and Trond Trosterud. 2021. Overview of Open-Source Morphology Development for the Komi-Zyrian Language: Past and future. In Proceedings of the Seventh International Workshop on Computational Linguistics of Uralic Languages, pages 29–39, Syktyvkar, Russia (Online). Association for Computational Linguistics.

```
    @inproceedings{rueter-etal-2021-overview,
        title = "Overview of Open-Source Morphology Development for the {K}omi-{Z}yrian Language: Past and future",
        author = {Rueter, Jack  and
          Partanen, Niko  and
          H{\"a}m{\"a}l{\"a}inen, Mika  and
          Trosterud, Trond},
        booktitle = "Proceedings of the Seventh International Workshop on Computational Linguistics of {U}ralic Languages",
        month = sep,
        year = "2021",
        address = "Syktyvkar, Russia (Online)",
        publisher = "Association for Computational Linguistics",
        url = "https://aclanthology.org/2021.iwclul-1.4",
        pages = "29--39",
    }
```
