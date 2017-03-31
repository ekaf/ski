# https://github.com/ekaf/ski/flat2sets.awk
# (c)2017 Eric Kafe, CC BY 4.0, https://creativecommons.org/licenses/by/4.0/

# Convert(attr, val) pairs **sorted** on the first key 
# to (attr, bag of "sep"-separated vals). 
# Use after sort -k1,1|uniq to get sets.

BEGIN {
# Default separator is a comma:
    if(sep=="")sep=","
    }

$1==i{
    s = s sep $2
    next
    }
$1>i{# Output bags of values (or sets, when input is unique):
    if(s) print s
    s=$0
    i=$1
    next
    }
$1<i{
    err = "Fatal error:" FILENAME ":" NR " input is not sorted: " $0
    exit 2
    }

END{
    print s
    if(err) print err | "tee /dev/stderr"
    }
