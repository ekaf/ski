#!/bin/bash
# pwn2maps.awk (c) 2017 Eric Kafe
# license CC BY 4.0, https://creativecommons.org/licenses/by/4.0/
{
# For each synset key, split its set of synset ids:
  z=split($2,a,",")
# Map from each synset id
  for(i=1;i<z;i++){
    v1=a[i]
    sub(":.*","",v1)
# map to each subsequent WordNet version:
    for(j=i+1;j<=z;j++){
      v2=a[j]
      sub(":.*","",v2)
# simple mapping strategy:
      print a[i],a[j] | "sort -u > " db "-map-pwn" v1 "-pwn" v2 ".txt"
# TODO: alternative mapping strategies, f. ex. select most frequent target
    }
  }
}
