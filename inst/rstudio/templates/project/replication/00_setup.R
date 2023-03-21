suppressMessages({
    library(here)
    devtools::load_all(here())
    # additional packages here
    # library(tidyverse)
    # library(wacolors)
    # library(scales)
    # library(patchwork)
})

# Color palettes, etc.

theme_paper = function() {
    theme_bw(base_family="Times", base_size=10) +
        theme(plot.background=element_blank())
}

# Helper functions ------
