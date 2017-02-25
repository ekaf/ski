# https://github.com/ekaf/ski/mcr2free.awk (c) 2017 Eric Kafe
# license CC BY 4.0, https://creativecommons.org/licenses/by/4.0/
{
  split($1,a,"#")
  split(a[2],b,":")
  sub("^.*:","",$2)
  id=b[1]":"$2"-"b[2]
  if(id in dic)dic[id]=dic[id]" "a[1]
  else dic[id]=a[1]
}
END{
  for(k in dic){
    split(k,a,":")
    if(a[1]!="")print a[2], dic[k] | "sort>" a[1] "-senses" v ".src"
  }
}
