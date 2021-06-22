# https://github.com/ekaf/ski/mcr2free.awk (c) 2017-21 Eric Kafe
# license CC BY 4.0, https://creativecommons.org/licenses/by/4.0/
{
  split($1,a,"#")
  split(a[2],b,":")
  lang=b[1]
  sub("po","pt",lang)
  sub("^.*:","",$2)
  key=lang":"$2"-"b[2]
# Freeling converts all words to lower case:
  w=tolower(a[1])
  if(w!~"[^\xC2\xB7\xC2\xB07\xC2\xA1/&![:lower:][:digit:]\\'._\\-]")dic[key"="w]=1
  else {
   if(key in typo)typo[key]=typo[key]" "w
   else typo[key]=w
   }
}
END{
  asorti(dic,dic1)
  delete dic

  for(k in typo){
    split(k,a,":")
    print a[2], typo[k] | "sort>" od "/" a[1] "/mcr-typos" v ".txt"
    }
  for(k in dic1){
      split(dic1[k],a,"=")
      k2=a[1]
      if(k2 in dic2)dic2[k2]=dic2[k2]" "a[2]
      else dic2[k2]=a[2]
      }
  delete dic1
  for(k in dic2){
    split(k,a,":")
    lang=a[1]
    print a[2], dic2[k] | "sort>" od "/" lang "/senses" v ".src"
    }
}
