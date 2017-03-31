# https://github.com/ekaf/ski/wn2ski.awk
# (c)2017 Eric Kafe, CC BY 4.0, https://creativecommons.org/licenses/by/4.0/

BEGIN{
  print "# https://github.com/ekaf/ski/ski-pwn-sets.txt.gz, (c)2017 Eric Kafe, CC BY 4.0"
# Create an array of grammatical categories  
  split("n,v,a,r,s", gc, ",")
}
# For each new index.sense file:
FILENAME!=f{
# Extract the WordNet version from the filename:
  f=FILENAME
  v=f
  sub("^.*dict-","",v)
  sub("/index.sense$","",v)
}
{
# Extract the grammatical category from the sense key:
  c=$1
  sub("^.*%","",c)
  sub(":.*$","",c)
# k = the sense key
  k=$1
# remove adjective markers:
  gsub("\\((a|p|ip)\\)","",k)
# si = the wordnet version, the grammatical category and the synset offset
  si=v":"gc[c]":"$2
# if key already in dictionary, append si to the values
  if (k in sk)sk[k]=sk[k]","si
# 
  else sk[k]=si
}
# Print each sense key, and its list of synset identifiers in different WordNet versions
END{for(k in sk)print k, sk[k]}
