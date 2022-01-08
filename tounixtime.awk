#!/usr/bin/awk -f

# stdin:  YYYYMMDDhhmmss
# stdout: Unix Time

{
  Y=substr($1,1,4)*1
  M=substr($1,5,2)*1
  D=substr($1,7,2)*1
  h=substr($1,9,2)*1
  m=substr($1,11,2)*1
  s=substr($1,13,2)*1
  
  if(M<3){
  	M+=12
  	Y--
  }
  
  ut=(365*Y+int(Y/4)-int(Y/100)+int(Y/400)+int(306*(M+1)/10)+D-719591)*86400+(h*3600)+(m*60)+s
  
  print ut
}

