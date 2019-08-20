# Page length - Systematic Biology
# Data downloaded from PubMed on 20th August 2019
rm(list=ls())
df <- read.table("pasted.txt", fill=TRUE, stringsAsFactors = FALSE)
names(df) <- c("x", "pmid", "year", "month", "first.page", "last.page")
n <- length(df$year) # 1,495 records

# calculate page lengths:
df$last.page <- as.numeric(df$last.page)
page.length <- df$last.page - df$first.page
# single page papers:
page.length[is.na(page.length)] <- 0
# for some records, last page number my be "abbreviated"
# in such cases last.page - first.page is negative
i0 <- which(page.length < 0)
page.length[i0] <- floor(df$first.page[i0] / 100) * 100 + df$last.page[i0] - df$first.page[i0]
j0 <- which(page.length < 0)
page.length[j0] <- floor(df$first.page[j0] / 10) * 10 + df$last.page[j0] - df$first.page[j0]
# (i don't think the above fixes all abbreviations - fix later)
page.length <- page.length + 1

# mean of page lengths per year:
length.mean <- aggregate(page.length, by=list(df$year), FUN=mean)

plot(df$year + rnorm(n, 0, sd=.05), page.length, pch=19, col=rgb(0,0,1,.1), 
     xlab="Year of Publication", ylab="Page length of Systematic Biology papers", las=1)
lines(length.mean, lwd=2)

# Syst. Biol. longest papers:
df[which(page.length > 40),]
# x     pmid year month first.page last.page
# 1237 PMID- 12118410 2000   Jun        306        62
# 1465 PMID- 11975331 1997   Sep        479       522
# 1494 PMID- 11975347 1997   Mar          1        68
