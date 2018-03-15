xmsex_table=xtabs(~XMARSEX + RELATSEX, data=shortDat,exclude = "NA")
xsex_sex=xtabs(~XMARSEX + SEX, data=shortDat,exclude = "NA")
xsex_polv=xtabs(~XMARSEX + POLVIEWS, data=shortDat,exclude = "NA")

barchartGC(xmsex_table,type="percent")
barchartGC(xsex_sex,type="percent")
barchartGC(xsex_polv,type="percent")
