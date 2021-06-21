Added _ski-violations.txt_: a mapping of sense key violations,
i. e. a small number of accidental cases, where a sense key
changed meaning during a WordNet update.

Corrected the version name of the WordNet 1.5SC release
from October 1995. This was the first fully "coherent"
version, with only unique sense keys.

WordNet 1.5 now refers to the release from March 1995,
instead of the later WN 1.5SC, since it is the version
used by other projects (Sensemap, UPC, ILI). Please note
that a few sense keys from WN 1.5 were not unique,
as almost 40 were in more than one synset.

Added WordNet 3.1.1 for SQL (2012), retrieved from
http://wordnetcode.princeton.edu/wn_for_sql.tar.gz.

Removed adjective markers (a,p,ip), which were
present in WordNet 1.5 and 1.6 sense keys.

Set LC_ALL=C in the subshell for each script,
to ensure consistent sort order across platforms.

Dropped conversion to lowercase for MCR lemmas,
because MCR wordsense numbers depend on the case.
