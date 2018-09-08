#!/usr/bin/env Rscript

# Generate five sets of scores for six movies, which are then inserted into a
# SQL database.

library(reshape2)

reviewees <- c('Alexis', 'Dina', 'Zach', 'Patrick', 'Claire')
movies <- c('Crazy Rich Asians', 'The Nun', 'Mission Impossible',
            'Christopher Robin', 'Slender Man', 'BlacKkKlansman')

set.seed(1804)
scores <- as.data.frame(t(sapply(1:5, sample, 6, replace=TRUE)))
colnames(scores) <- movies
scores$reviewer <- reviewees

# Convert to long format for proper database form
df_long <- melt(scores, measure.vars = 1:6)
colnames(df_long) <- c('reviewer', 'film', 'score')

write.csv(df_long, 'movie_scores.csv', quote=FALSE, row.names=FALSE)