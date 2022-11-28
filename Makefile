

write.Rmd: write.R
	@echo "Running R script to render"
	R -e 'knitr::spin("$<", knit = FALSE)'

README.md: write.Rmd
	R -e 'rmarkdown::render("$<", output_file="$@")'

update:
	git add README.md
	git add write.R
	git commit -m "Update README.md"

all: README.md

clean: 
	sh clean.sh
