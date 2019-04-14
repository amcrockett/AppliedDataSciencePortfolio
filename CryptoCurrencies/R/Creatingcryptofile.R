library(tidyverse)

bitcoin <- read.csv("bitcoin_price.csv")
ethereum <- read.csv("ethereum_price.csv")
ripple <- read.csv("ripple_price.csv")


bitcoin_short <- bitcoin[1:929,]
ripple_short <- ripple[1:929,]

Cryptodata <- cbind(bitcoin_short, ripple_short, ethereum)

Cryptodata_select <- Cryptodata[, c(1, 5, 12, 19)]

colnames(Cryptodata_select) <- c("date", "bitcoin", "ripple", "ethereum")

write.csv(Cryptodata_select, "cryptodata.csv")