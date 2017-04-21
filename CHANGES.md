Changed WordNet 1.5 to cover the Windows release
from March 1995 (instead of the later Unix release
from October 1995), since it is the version used by 
other projects (Sensemap, UPC, ILI).

Added WordNet 3.1.1 for SQL (2012), retrieved from
http://wordnetcode.princeton.edu/wn_for_sql.tar.gz.

Removed adjective markers (a,p,ip), which were
present in WordNet 1.5 and 1.6 sense keys.

Set LC_ALL=C in the subshell for each script,
to ensure consistent sort order across platforms.

Dropped conversion to lowercase for MCR lemmas,
because MCR wordsense numbers depend on the case.
