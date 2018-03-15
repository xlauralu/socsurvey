#require(foreign)
require(haven)
gss <- read_spss(file="GSS2016.sav")


require(tigerstats)
require(plyr)
require(dplyr)

#use dplyr after making gss a tbl
gss <- tbl_df(gss)

#Use select to get the variables of interest

shortDat<- select(gss,XMARSEX,RELATSEX,SEX,POLVIEWS)

#now convert from class "labelled to factor"
shortDat$XMARSEX <- as_factor(shortDat$XMARSEX)
shortDat$RELATSEX <- as_factor(shortDat$RELATSEX)
shortDat$SEX <- as_factor(shortDat$SEX)
shortDat$POLVIEWS <- as_factor(shortDat$POLVIEWS)


#here we use mutate to create 3 education levels



#now we deploy the revalue command from the plyr package to collapse the number of
#levels in these categorical variables

shortDat$XMARSEX <- revalue(shortDat$XMARSEX,c(
  "IAP" = "NA",
  "ALWAYS WRONG" = "wrong",
  "ALMST ALWAYS WRG"="wrong",
  "SOMETIMES WRONG"="Hmmm",
  "NOT WRONG AT ALL"="OK",
  "OTHER"="NA",
   "DK"="NA"
))

shortDat$RELATSEX <- revalue(shortDat$RELATSEX,c(
  "IAP" = "NA",
  "YES, IN RELATIONSHIP" = "Hooked UP",
  "NO, NO RELATIONSHIP" = "Single",
    "DK" = "NA"
))
shortDat$POLVIEWS <- revalue(shortDat$POLVIEWS,c(
  "IAP" = "NA",
  "DK" = "NA",
  "EXTREMELY LIBERAL"="LIBERAL",
  "SLIGHTLY LIBERAL"="LIBERAL",
  "SLGHTLY CONSERVATIVE"="CONSERVATIVE",
  "EXTRMLY CONSERVATIVE"="CONSERVATIVE"
))

