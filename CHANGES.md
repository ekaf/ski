Added the latest (2012) WordNet version, retrieved from
http://wordnetcode.princeton.edu/wn_for_sql.tar.gz.
It is an unnumbered update of WordNet 3.1, so here
we call it 3.1.1.

Removed adjective markers (a,p,ip), which were
present in WordNet 1.5 and 1.6 sense keys.

Set LC_ALL=C in the subshell for each script,
to ensure consistent sort order across platforms.

Dropped conversion to lowercase for MCR lemmas,
because MCR wordsense numbers depend on the case.
