# Sense Key Index (SKI) for inter-operability between WordNet-related projects

[CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) 
2017-21 [Eric Kafe](https://github.com/ekaf)

Ongoing work: This is a pre-release version, please see the CHANGES.md file.

## 1. Introduction

According to WordNet's "senseidx" manual page:

>  A sense_key is the best way to represent a sense
>  in semantic tagging or other systems that refer to
>  WordNet senses. sense_keys are independent of WordNet
>  sense numbers and synset_offsets, which vary between
>  versions of the database.

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
1.5 up to 3.1.1) from the different versions of the original
Princeton WordNet distribution.


## 2. The Sense Key Index can be used to

* Generate database components in various formats (text, tab, csv,
  prolog, rdf), to interface with any WordNet-related project: 
  the GWA grid, OMW, WN-ontology, ILI, MCR, Freeling, etc...
* Produce mappings between all WordNet versions
* Map version-limited WordNet resources like the ILI or the MCR to other WordNet versions
* Produce statistics about the permanence of sense keys or ILI identifiers across WordNet versions
* and more forthcoming...


## 3. Included files

### 3.1 SKI databases

* _ski-pwn-sets.txt_
>  sense key index for all the modern Princeton WordNet versions
>  (currently 1.5, 1.6, 1.7, 1.7.1, 2.0, 2.1, 3.0, 3.1 and 3.1.1),
>  derived from the corresponding Princeton WordNet _index.sense_ files,
>  retrieved from [Wordnetcode](http://wordnetcode.princeton.edu)

* _ski-violations.txt_
>  mapping of the sense key violations found in Kafe, E. (2018):
>  [_Persistent semantic identity in WordNet_](https://doi.org/10.11649/cs.1717)
>  This mapping handles a small number of accidental cases, where a sense key
>  changed meaning during a WordNet update.

* _ski-mcr30-2016.txt_
>  sense key index for MCR30-2016, derived by joining the inverse SKI
>  (_ski-pwn-si-flat.txt_) with the latest MCR "_variant_" files, retrieved
>  from the [MCR](http://adimen.si.ehu.es/web/MCR)

* _ski-ili30.txt_
>  sense key index for ILI30, derived by joining the inverse SKI
>  (_ski-pwn-si-flat.txt_) with the GWA-ILI _ili-map-pwn30.tab_ file
>  retrieved from [GWA/ILI](https://github.com/globalwordnet/ili)


### 3.2 SKI tools

* _wn2ski_
>  Builds the Sense Key Index from the original WordNet  files,
>  retrieved from [Wordnetcode](http://wordnetcode.princeton.edu). These files are expected
>  to be found in local subdirectories named _dict-WordnetVersion.Number_,
>  ranging from _dict-1.5/index.sense_ up to _dict-3.1.1/index.sense_.
>  The latest WordNet version (2012) was retrieved from
>  [WordNet 3.1.1 for SQL](http://wordnetcode.princeton.edu/wn_for_sql.tar.gz).

* _pwn2maps_
>  Generates synset offset mappings between all the WordNet versions from ski-pwn-sets.txt

* _pwn2flat_
>  Generates the flat text relation file _ski-pwn-flat.txt_,
>  between all synsets in all WordNet versions and their sense keys,
>  and the inverse relation (_ski-pwn-si-flat.txt_, and _ski-pwn-si-sets.txt_).
>  Also, outputs this relation as tab-separated 4-tuples (_ski-pwn-flat.tab_),
>  designed for compatibility with the MCR.
>  Also, outputs this relation in Prolog format (_ski-pwn-flat.pl_),
>  designed for compatibility with the Prolog version of PWN.
>  Additionally, produce a mapping from each sense key
>  to its last known WordNet version (_ski-pwn-last_).

* _ili2map_
>  (runs _pwn2flat_ first, to generate the needed _ski-pwn-flat.txt_ and _ski-pwn-last.txt_ databases)
>  Maps ILI-30 ids to all Princeton WordNet versions
>  Maps ILI-30 ids to their last known Princeton WordNet version

* _mcr2free_
>  Generates Freeling sense databases from MCR data


### 3.3 Output files

For your convenience, this release also includes all the output produced
by running the SKI-tools, compressed with gzip:

* ski-pwn-flat.txt.gz: the flat text version of ski-pwn-sets.txt
* ski-pwn-si-flat.txt.gz: the same, inversed: map from synsets to sense keys
* ski-pwn-si-sets.txt.gz: the previous, as sets: map from synsets to sets of sense keys
* ski-pwn-flat.tab.gz: pwn-flat as tab-separated 4-tuples
* ski-pwn-flat.pl.gz: Prolog version of the ski-flat relation, as triples
* ski-pwn-last.txt.gz: mapping from sense keys to their last known synset offset
* ski-ili.tar.gz: ILI mappings
* ski-mappings-pwn1.tar.gz: mappings from PWN versions 1.x to all later versions
* ski-mappings-pwn2.tar.gz: mappings from PWN versions 2.x and 3.x to all later versions
* freeling_data-mcr30-2016.tar.gz: senses30.src databases for Freeling


## 4. References

* Fellbaum, C.: _WordNet, An Electronic Lexical Database_. MIT Press, Cambridge, 1998.

* Gonzalez-Agirre, A., Laparra, E., Rigau, G.: _Multilingual central repository version 3.0_: 
upgrading a very large lexical knowledge base. In: Proceedings of the Sixth
International Global WordNet Conference (GWC2012). Matsue, Japan, 2012.

* Kafe, E. (2018): [_Persistent semantic identity in WordNet_](https://doi.org/10.11649/cs.1717).
In: Cognitive Studies | Études cognitives,2018(18).

* WordNet-team: [_Senseidx(5wn)_](http://wordnet.princeton.edu/wordnet/man/senseidx.5WN.html). In: WordNet manual. Princeton University, 2010.
