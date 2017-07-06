# Author : Bohdan Monastyrskyy
# Project : Assessment of RR predictions calibration
# Date : 2017-07-06


# load required packages
LIBS <- c("dplyr", "ggplot2", "ggthemes")
tmp <- lapply(LIBS, function(l)
  { if (!require(l, quietly = TRUE, character.only = TRUE)){
      install.packages(l)
      if (!require(l, quietly = TRUE, character.only = TRUE)){
        stop(paste("Required library", l, "couldn't be installed"))
      }
    }
  } );
rm(tmp);


# read data
df <- read.table("./data/TPFPbin.summarytable.txt", stringsAsFactors = FALSE, header = TRUE)

# Example 
# plot violin plot for selected group on FM domains
my.violin <- function(df, gr_='RR109', class_='FM'){
  f.df <- df %>% filter(gr==gr_ & class==class_) %>% select(pr.bin, Tp.perc)
  f.df$pr.bin <-as.factor(f.df$pr.bin)
  p <- ggplot(f.df, aes( x=pr.bin, y=Tp.perc, color = pr.bin)) + geom_violin() + stat_summary(fun.y=mean, geom="point")
  print(p)
}

my.violin(df, 'RR451')
