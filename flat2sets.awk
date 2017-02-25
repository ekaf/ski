# https://github.com/ekaf/ski/flat2sets.awk
# (c)2017 Eric Kafe, CC BY 4.0, https://creativecommons.org/licenses/by/4.0/

# Convert sorted (attr, val) pairs to (attr, set (or bag) of ","-separated vals)

$1==i{
    s = s "," $2
    }

$1>i{
# Output bags of values (or sets, when input is unique):
    if(s) print s
    s=$0
    i=$1
    }

$1<i{
    err = FILENAME ":" NR " input is not sorted: " $0
    exit 2
    }

END{
    print s
    if(err) print err | "tee /dev/stderr"
    }
