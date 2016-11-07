library(stringr)

fig_files <- list.files(pattern = "\\.jpg$")
smaller_files <- list.files(pattern = "smaller")
fig_files <- setdiff(fig_files, smaller_files)
fig_files

wave1 <- str_subset(fig_files, "lego-data-structures")
wave2plus <- str_subset(fig_files, "lego-rstats")
wave3 <- str_subset(wave2plus, "\\(")
wave2 <- setdiff(wave2plus, wave3)
wave2_nums <- as.integer(str_extract(wave2, "\\d+"))
wave2 <- wave2[order(wave2_nums)]

before <- c(wave1, wave2, wave3)
n <- length(before)
after <- sprintf("lego-rstats_%02d.jpg", seq_along(before))
file.rename(from = before, to = after)
