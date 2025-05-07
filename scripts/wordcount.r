library(tidyverse)

# GOAL: get wordcount from markdown files

# [[ function: gets rid of multiple whitespace and makes a character vector ]]
# moral bi ločit tudi glede na "|" ampak ne znam
word_count <- \(file) {
  file <- file %>% unlist()                  # unlist just to be sure
  words <- paste(file, collapse = " ") %>%   # split by blankspace
    str_split("\\s+") %>%
    unlist()
  # get all but headers
  words[which(!(words %in% c("#", "##", "###")))] %>% length()
}

# [[ import .md files to be evaluated ]]
# set work directory to kemija
setwd("C:/Users/joene/Documents/obsidian/Kemija/")
getwd()
# names of files
filenames <- c("Hitin.md",
               "Strukturni polisaharidi.md",
               "Glikogen.md",
               "Amilopektin.md",
               "Amiloza.md",
               "Škrob.md",
               "Shranjevalni polisaharidi.md",
               "Biološke funkcije polisaharidov.md",
               "Struktura polisaharidov.md",
               "Delitev polisaharidov glede na vrsto monosaharidnih enot.md",
               "Heteropolisaharidi.md",
               "Homopolisaharidi.md",
               "Vrste glikozidne vezi.md",
               "Nastanek glikozidne vezi.md",
               "Reducirajoči sladkorji.md",
               "Poimenovanje ogljikovih hidratov.md",
               "Struktura ogljikovih hidratov.md",
               "Ketonska skupina.md",
               "Ketoze.md",
               "Aldehidna skupina.md",
               "Aldoze.md",
               "D-glukoza.md",
               "Anomerni ogljik.md",
               "Glikozidne vezi v polisaharidih.md",
               "Glikozidne vezi.md",
               "Ogljikovi hidrati kot informacijske molekule.md",
               "Glikokonjugati.md",
               "Celuloza.md",
               "Polisaharidi.md",
               "Oligosaharidi.md",
               "Monosaharidi.md",
               "Ogljikovi hidrati.md",
               "Biološki voski.md"
)
# files will be read and stored in this list
files <- list()

for (file in 1:length(filenames)) {
  # readlines into list
  files[file] <- read_lines(file = filenames[file]) %>% paste(., collapse = " ")
}
# use map to get wordcount for every element
map(files, word_count) %>%
  unlist() %>%
 
