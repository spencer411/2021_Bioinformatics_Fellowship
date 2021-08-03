library(reshape)
library(ggplot2)

x <- read.csv("abricate_amr_summary.csv")
dat <- data.frame(x)

melt.data<-melt(dat, id.vars="Genome", variable_name="AMR_genes")

qplot(data=melt.data,
      x=AMR_genes,
      y=Genome,
      fill=factor(value),
      geom="tile")+scale_fill_manual(values=c("0"="white", "1"="red")) +
      theme(text = element_text(size=10),
      axis.text.y = element_text(size=4),
      axis.text.x = element_text(size=10, angle=45, hjust=1))
