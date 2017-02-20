# flat2sets.awk, Convert sorted (attr, val) pairs to (attr, set of ","-separated vals)
# (c)2017 Eric Kafe, CC BY 4.0, https://creativecommons.org/licenses/by/4.0/

{
if($1!=i){
    i=$1
    if(s)print s
    s=$0
    }
else s = s "," $2
}
END{print s}
