# get n for repeated lines
n_lines <- as.numeric(readline("n of lines: "))

# make string to write into file
support <- "\n\n\n\n---\n"
pat_to_write <- ""
for (i in 1:n_lines) {
    if (i == 1) {
        c(pat_to_write, paste("#odg\n\n", "# ", i, support, sep = "")) -> pat_to_write
    }
    c(pat_to_write, paste("# ", i, support, sep = "")) -> pat_to_write
}

# run line to see what will get written into file
#cat(pat_to_write)

# full path to obsidian directory
directory_path <- "C:/Users/joene/Documents/obsidian/Lotus/Kemija/"

# get name for file
filename <- as.character(readline("filename (no empty spaces): "))

# full filepath
filepath <- paste0(directory_path, filename, ".md")

# write lines to file
write(pat_to_write, file = filepath)