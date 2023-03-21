# path = "~/Documents/School/Research/subgeo"
cmc_proj <- function(path, license="mit", ...) {
    # ensure path exists
    unlink(path, recursive=TRUE)
    dir.create(path, recursive=TRUE, showWarnings=FALSE)

    proj_nm <- basename(path)
    tmpl_dir <- system.file("rstudio/templates/project", package="cmcproj", mustWork=TRUE)

    file.copy(file.path(tmpl_dir, "."), path, recursive=TRUE)
    ignore_tmpl = c("*.dcf", "icon.png")
    file.remove(Sys.glob(file.path(path, ignore_tmpl)))

    usethis::create_package(path, check_name=FALSE, open=FALSE)
    usethis::local_project(path)

    licenses = c("mit", "gpl3")
    license = tolower(license)
    if (license %in% licenses) {
        getFunction(paste0("use_", license, "_license"))()
    }

    usethis::use_git_ignore(file.path("paper", paste0(proj_nm, ".tex")))
    usethis::use_readme_rmd(open=FALSE)

    path_paper = file.path(path, "paper")
    zip_path <- file.path(path_paper, "template.zip")
    zip_url <- "https://github.com/CoryMcCartan/cmc-article/archive/refs/heads/main.zip"
    download.file(zip_url, zip_path)
    unzip(zip_path, exdir=path_paper)
    unlink(zip_path)
    file.copy(file.path(path_paper, "cmc-article-main/_extensions"),
              path_paper, recursive = TRUE)
    file.copy(file.path(path_paper, "cmc-article-main/template.qmd"),
              path_paper, recursive = TRUE)
    file.copy(file.path(path_paper, "cmc-article-main/references.bib"),
              path_paper, recursive = TRUE)
    file.copy(file.path(path_paper, "cmc-article-main/header.tex"),
              path_paper, recursive = TRUE)
    unlink(file.path(path_paper, "cmc-article-main/"), recursive=TRUE)

    invisible(TRUE)
}
