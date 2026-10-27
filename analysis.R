# Step 1:  Set up R project

#install.packages(c("rentrez", "ggplot2"))
library(rentrez)
library(ggplot2)

> gene_symbol <- "ACTC1"
> transcript_accession <- "NM_005159.5"
> clinvar_id <- "18331"
> variant_protein <- "p.Glu101Lys" # Use "" for splice variants
> for (x in c("data", "results", "figures")) {
+     dir.create(x, showWarnings = FALSE)
+ }

# Step 2: NCBI Gene record

hits <- entrez_search(
db = "gene",
term = paste0(gene_symbol, "[Gene Name] AND txid9606[Organism]"),
retmax = 20
)
if (length(hits$ids) == 0) stop("Gene not found")
# Verify the exact gene symbol, not just a similar family member.
gene_id <- NA_character_
for (id in hits$ids) {
rec <- entrez_summary(db = "gene", id = id)
if (toupper(rec$name) == toupper(gene_symbol)) {
gene_id <- id; gene_info <- rec; break
}
}
if (is.na(gene_id)) stop("Exact human gene not found")
print(gene_info)
writeLines(c(
paste("Gene symbol:", gene_info$name),
paste("NCBI Gene ID:", gene_id),
paste("Official name:", gene_info$description),
paste("Chromosome:", gene_info$chromosome)
), "results/gene_summary.txt")

# Step 3: Protein from the assigned transcript

library(rentrez)
gene_symbol <- "ACTC1"
transcript_accession <- "NM_005159.5"
clinvar_id <- "18331"
variant_protein <- "p.Glu101Lys"

gb <- entrez_fetch(db = "nuccore", id = transcript_accession, rettype = "gb", retmode = "text")

pat <- "protein_id=.NP_[0-9]+[.][0-9]+"
fragment <- regmatches(gb, regexpr(pat, gb))
if (length(fragment) == 0) stop("NP protein ID not found")
protein_accession <- sub("protein_id=.", "", fragment)
print(protein_accession)

protein_fasta <- entrez_fetch(db = "protein", id = protein_accession, rettype = "fasta", retmode = "text")
if (!startsWith(protein_fasta, ">")) stop("Invalid FASTA")

fasta_file <- file.path("data", paste0(gene_symbol, "_protein.fasta"))
writeLines(protein_fasta, fasta_file)
writeLines(paste("NP accession:", protein_accession), "results/protein_accession.txt")
list.files("data")

# Step 4: Length and composition

fasta_lines <- readLines(fasta_file)
sequence <- paste(fasta_lines[!grepl("^>", fasta_lines)],
collapse = "")
aa <- strsplit(toupper(sequence), "")[[1]]
protein_length <- length(aa)
standard <- strsplit("ACDEFGHIKLMNPQRSTVWY", "")[[1]]
counts <- table(factor(aa, levels = standard))
results <- data.frame(AminoAcid = standard,
Count = as.integer(counts))
write.csv(results, "results/amino_acid_composition.csv",
row.names = FALSE)
cat("Protein length:", protein_length, "amino acids\n")
print(head(results[order(-results$Count), ], 3))
fig1 <- ggplot(results, aes(AminoAcid, Count)) +
geom_col(fill = "grey45") + theme_bw() +
labs(title = paste(gene_symbol, "amino-acid composition"),
x ="Amino acid", y = "Number of residues")
print(fig1)
ggsave("figures/01_amino_acid_composition.png",
fig1, width = 8, height = 5, dpi = 300)

# Step 6: Variant position plot

library(ggplot2)
gene_symbol <- "ACTC1"
variant_protein <- "p.Glu101Lys"

matched <- regmatches(variant_protein, regexpr("[0-9]+", variant_protein))
position <- as.integer(matched)
print(position)

if (!is.na(position) && position >= 1 && position <= protein_length) {
  fig2 <- ggplot() +
    geom_segment(aes(x = 1, xend = protein_length, y = 0, yend = 0), linewidth = 2) +
    geom_point(aes(x = position, y = 0), size = 4) +
    annotate("text", x = position, y = 0.25, label = variant_protein, size = 4) +
    xlim(0, protein_length) +
    ylim(-0.6, 0.6) +
    theme_void() +
    labs(title = paste(gene_symbol, "reference protein")) +
    theme(axis.title.x = element_text())
  print(fig2)
  ggsave("figures/02_variant_position.png", fig2, width = 8, height = 2.5, dpi = 300)
}
