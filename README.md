# SKI: Sense Key Index (c) 2017 Eric Kafe
Sense Key Index for inter-operability betwween WordNet-related projects
License CC-BY-4.0


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

Princeton WordNet (PWN) includes a sense key index (the index.sense
file) since version 1.3, but the implementation of sense keys became
first coherent in WordNet version 1.5.

Thus, we can define the full PWN sense key index as the unique
concatenation of all the coherent index.sense files from the
different versions of the original Princeton WordNet distribution.


2. The Sense Key Index can be used to:

  - Generate database components in various formats (text, prolog, rdf),
    to interface with any WordNet-related project: the GWA grid, OMW, 
    WN-ontology, ILI, MCR, Freeling, etc...
  - Produce mapping between all WordNet versions
  - Map version-bound WordNet resources like the ILI or the MCR
    to other WordNet versions
  - Produce statistics about the permanence of sense keys or ILI
    identifiers across WordNet versions
  - and more forthcoming...


3. Included files

3.1 SKI databases

- ski-pwn-sets.txt
    sense key index for all the coherent Princeton WordNet versions
    (currently 1.5, 1.6, 1.7, 1.7.1, 2.0, 2.1, 3.0 and 3.1)

- ski-mcr30-2016.txt 
    sense key index for MCR30-2016

- ski-ili30.txt
    sense key index for ILI30


3.2 SKI tools

- pwn2maps
    Generates synset offset mappings between all the WordNet versions
    from ski-pwn-sets.txt

- pwn2flat
    Generates the flat text relation between all synsets
    in all WordNet versions and their sense keys. 
    Optionally, output this relation in Prolog format.
    Additionally, produce a mapping from each sense key
    to its last known WordNet version

- ili2map
    (runs "pwn2flat" first, to generate the needed ski-pwn-flat.txt
    and ski-pwn-last.txt databases)
    Maps ILI-30 ids to all Princeton WordNet versions
    Maps ILI-30 ids to their last known Princeton WordNet version

-mcr2free
    Generates Freeling sense databases from MCR data


3.3 Output files

The "output" directory contains compressed output from the SKI-tools:

- ski-flat.tar.gz: the flat text version of ski-pwn-sets.txt
- ski-freeling.tar.gz: senses30.src databases for Freeling
- ski-ili.tar.gz: ILI mappings
- ski-mappings.tar.gz: PWN mappings
