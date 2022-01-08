#!/usr/bin/awk -f

# stdin:  Unix Time
# stdout: YYYYMMDDhhmmss

function is_leap(y) {
  return y%4==0 && y%100!=0 || y%400==0
}
 
{
  ut=$1*1
  s=ut%60
  t=int(ut/60)
  m=t%60
  t=int(t/60)
  h=t%24
  days_from_epoch=int(t/24)

  i=0
  for(Y=1970;;Y++){
    dy=is_leap(Y)?366:365
    if(i+dy<=days_from_epoch){
      i+=dy
    }else{
      break
    }
  }

  days=days_from_epoch-i

  split("31 0 31 30 31 30 31 31 30 31 30 31",days_of_month)
  days_of_month[2]=is_leap(Y)?29:28
  j=0
  for(M=1;;M++){
    dm=days_of_month[M]
    if(j+dm<=days){
      j+=dm
    }else{
      break
    }
  }
  D=days-j+1

  printf "%04d%02d%02d%02d%02d%02d\n",Y,M,D,h,m,s
}

