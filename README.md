# SKI: Sense Key Index (c) 2017 Eric Kafe
Sense Key Index for inter-operability between WordNet-related projects

License: CC BY 4.0, https://creativecommons.org/licenses/by/4.0/


1. Introduction

According to WordNet's "senseidx" manual page:

    A sense_key is the best way to represent a sense
    in semantic tagging or other systems that refer to
    WordNet senses. sense_keys are independent of WordNet
    sense numbers and synset_offsets, which vary between
    versions of the database.

As a consequence, sense keys provide a stable basis for the
inter-operation between semantic web applications that rely on
different versions of WordNet.

Princeton WordNet (PWN) includes a sense key index (the
index.sense file) since version 1.4 from 1993, but the sense
keys notation changed in 1995, with WordNet version 1.5,
and has remained stable since then.

Thus, we can define the full PWN sense key index as the unique
concatenation of all the stable index.sense files, with an
extra field indicating the WordNet version mumber (currently
1.5 up to 3.1) from the different versions of the original
Princeton WordNet distribution.


2. The Sense Key Index can be used to

  - Generate database components in various formats (text, tab, csv,
    prolog, rdf), to interface with any WordNet-related project: 
    the GWA grid, OMW, WN-ontology, ILI, MCR, Freeling, etc...
  - Produce mappings between all WordNet versions
  - Map version-limited WordNet resources like the ILI or the MCR
    to other WordNet versions
  - Produce statistics about the permanence of sense keys or ILI
    identifiers across WordNet versions
  - and more forthcoming...


3 Included files:

3.1 SKI databases

- ski-pwn-sets.txt
    sense key index for all the modern Princeton WordNet versions
    (currently 1.5, 1.6, 1.7, 1.7.1, 2.0, 2.1, 3.0 and 3.1),
    derived from the corresponding Princeton WordNet "index.sense" files,
    retrieved from http://wordnetcode.princeton.edu

- ski-mcr30-2016.txt 
    sense key index for MCR30-2016, derived by joining the inverse SKI
    (ski-pwn-si-flat.txt) with the latest MCR "variant" files, retrieved
    from http://adimen.si.ehu.es/web/MCR

- ski-ili30.txt
    sense key index for ILI30, derived by joining the inverse SKI
    (ski-pwn-si-flat.txt) with the GWA-ILI "ili-map-pwn30.tab" file
    retrieved from https://github.com/globalwordnet/ili



3.2 SKI tools

First type "make all" to set executable permissions for these bash scripts:

- pwn2maps
    Generates synset offset mappings between all the WordNet versions
    from ski-pwn-sets.txt

- pwn2flat
    Generates the flat text relation file "ski-pwn-flat.txt",
    between all synsets in all WordNet versions and their sense keys,
    and the inverse relation (ski-pwn-si-flat.txt, and ski-pwn-si-sets.txt).
    Also, outputs this relation as tab-separated 4-tuples (ski-pwn-flat.tab),
    designed for compatibility with the MCR.
    Also, outputs this relation in Prolog format (ski-pwn-flat.pl),
    designed for compatibility with the Prolog version of PWN.
    Additionally, produce a mapping from each sense key
    to its last known WordNet version (ski-pwn-last).

- ili2map
    (runs "pwn2flat" first, to generate the needed ski-pwn-flat.txt
    and ski-pwn-last.txt databases)
    Maps ILI-30 ids to all Princeton WordNet versions
    Maps ILI-30 ids to their last known Princeton WordNet version

- mcr2free
    Generates Freeling sense databases from MCR data


3.3 Output files

For your convenience, this release also includes all the output produced
by running the SKI-tools, compressed with gzip:

- ski-pwn-flat.txt.gz: the flat text version of ski-pwn-sets.txt
- ski-pwn-si-flat.txt.gz: the same, inversed: map from synsets to sense keys
- ski-pwn-si-sets.txt.gz: the previous, as sets: map from synsets to sets of sense keys
- ski-pwn-flat.tab.gz: pwn-flat as tab-separated 4-tuples
- ski-pwn-flat.pl.gz: Prolog version of the ski-flat relation, as triples
- ski-pwn-last.txt.gz: mapping from sense keys to their last known synset offset
- ski-freeling.tar.gz: senses30.src databases for Freeling
- ski-ili.tar.gz: ILI mappings
- ski-mappings.tar.gz: PWN mappings


4 References

Gonzalez-Agirre A., Laparra E. and Rigau G. Multilingual Central
Repository version 3.0: upgrading a very large lexical knowledge
base. In Proceedings of the Sixth International Global WordNet
Conference (GWC=E2=80=9912). Matsue, Japan. January, 2012.
