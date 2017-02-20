# pwn2flat.awk, extract flat indexes from the Sense Key Index sets 
# (c)2017 Eric Kafe, CC BY 4.0, https://creativecommons.org/licenses/by/4.0/

BEGIN{
    split("n v a r s",pos)
# Part of speech to WordNet number conversion:
    for(x in pos)posn[pos[x]]=x
    }
$0!~"^\\#"{
# For each sense key, split its corresponding set of synset identifiers:
    z=split($2,a,",")
# For each synset id:
    for(i=1;i<=z;i++){
# Map this sense key to this synset id:
      print $1,a[i] > db "-flat.txt"
# The same, inversed: map from synset id to sense key, and also regroup the sense keys into sets
      print a[i], $1 |"sort -k1,1|tee " db "-si-flat.txt|awk -f flat2sets.awk >" db "-si-sets.txt"
# Split synset id (wn version, pos, synset offset)
      split(a[i],b,":")
# Output tab-separated 4-tuples:
      printf "%s\t%s\t%s\t%s\n", $1, b[1], b[2], b[3] > db "-flat.tab"
# Output Prolog relation, with synset offsets prefixed by pwn pos number:
      pkey=$1
      gsub("\047","\047\047",pkey)
      printf "%s(\047%s\047,\047%s\047,%s%s).\n", dbp, pkey, b[1], posn[b[2]], b[3] > db "-flat.pl"
      }
# Additionally, produce a mapping to the last known
# WordNet version that included this sense key:
    print $1,a[z] > db "-last.txt"
}
