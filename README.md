# Muscle-Contractility-ACTC1

## (a) Assignment
- **Assignment number:** 2
- **Gene:** ACTC1 (actin alpha cardiac muscle 1)
- **Transcript:** NM_005159.5 (RefSeq, MANE Select)
- **Variant:** c.301G>A (p.Glu101Lys)
- **ClinVar Variation ID:** 18331
- **NCBI Gene ID:** 70 (chromosome 15)
- **Protein:** NP_005150.1

## (b) Research question
How might the E101K change in cardiac alpha-actin affect thin-filament function and calcium regulation, and what does the evidence say about its link to cardiomyopathy?

## (c) Methods
1. Made the project folder Muscle_Contractility_ACTC1 with data, results and figures subfolders. I used Posit Cloud (RStudio in a browser).
2. Installed the packages with install.packages(c("rentrez", "ggplot2")) and loaded them with `library().
3. Set the assignment values: gene_symbol <- "ACTC1", transcript_accession <- "NM_005159.5", clinvar_id <- "18331"`, variant_protein <- "p.Glu101Lys".
4. Searched NCBI Gene for ACTC1 in humans (txid9606) with entrez_search(), then checked the exact gene symbol with entrez_summary(). Saved results/gene_summary.txt.
5. Downloaded the transcript NM_005159.5 with entrez_fetch(db = "nuccore"), extracted the NP_ accession from the GenBank record, and downloaded the protein FASTA with entrez_fetch(db = "protein"). Saved data/ACTC1_protein.fasta and results/protein_accession.txt.
6. Counted the 20 standard amino acids, saved results/amino_acid_composition.csv, and made a bar chart with ggplot2 and ggsave().
7. Checked that residue 101 of the retrieved protein is Glu (E) with substr(sequence, 101, 101).
8. Opened ClinVar record 18331 and recorded the classification, review status, submissions and citations.
9. Made a variant-position plot in R (Option A) with ggplot2 showing residue 101 along the reference protein.
10. Read published studies on the variant for the mechanism section.

**Errors I corrected:**
- Pasting code from the PDF merged separate commands onto one line and changed straight quotes to curly quotes, which gave "unexpected symbol" and "unexpected '='" errors. I put each command on its own line and retyped the quotes.
- variant_protein still held the example value p.Val165Met. I changed it to p.Glu101Lys.
- The data folder was empty after the first failed run. I reran the fixed Step 3 code and confirmed the FASTA with list.files("data").

## (d) Results and figures


### Gene and Protein Information

- **NCBI Gene ID:** 70
- **Official name:** Actin alpha cardiac muscle 1 (*ACTC1*)
- **Chromosome:** 15
- **Protein accession:** NP_005150.1
- **Protein length:** 377 amino acids
- **Residue 31:** Alanine (A), which matches the reference residue in the variant p.Ala31Ser.
- **Most common amino acids:** Isoleucine (I) – 30, Alanine (A) – 29, Glutamic acid (E) – 28, Glycine (G) – 28, Leucine (L) – 27, and Threonine (T) – 26.

![Amino-acid composition](figures/01_amino_acid_composition.png)

*Figure 1* shows the amino-acid counts of the reference protein.

![Variant position](figures/02_variant_position.png)

*Figure 2* shows the position of residue 101 along the protein. The marker shows a sequence location only. It is not proof of altered molecular interactions.

**\*Note on the number of figures:\*** This repository contains two figures instead of three because I chose Option A (the variant-position plot) for my second figure. My variant, p.Glu101Lys, is a missense variant, so I did not make the splice (exon-intron) diagram, which is for splice-site variants. I also did not make the optional domain/structure figure.

## (e) Variant interpretation (ClinVar record, accessed 27 October 2026)

- **Variant type:** Single nucleotide variant (SNV), missense; glutamic acid (Glu, E) is replaced by lysine (Lys, K) at residue 101.
- **Aggregate classification:** Pathogenic for hypertrophic cardiomyopathy.
- **Review status:** Reviewed by expert panel (ClinGen Cardiomyopathy Variant Curation Expert Panel).
- **Submissions:** The expert-panel classification, last evaluated on 14 November 2025, contributes to the aggregate classification. Other submissions include Pathogenic classifications from PreventionGenetics and Dasa, and a Likely pathogenic classification for dilated cardiomyopathy 1R from another clinical genetics laboratory.
- **Conditions:** Hypertrophic cardiomyopathy is the condition associated with the expert-panel classification. Other ClinVar records also associate this variant with dilated cardiomyopathy and left ventricular noncompaction.
- **Publications cited by ClinVar:** Olson et al. (2000), Arad et al. (2005), Bookwalter and Trybus (2006), Monserrat et al. (2007), Klaassen et al. (2008), and Debold et al. (2010), among other studies.
- **Notation:** The transcript HGVS is NM_005159.5:c.301G>A, and the protein change is p.Glu101Lys. The genomic HGVS is NC_000015.10:g.34793398C>T on GRCh38. The nucleotide letters differ because ACTC1 is located on the opposite DNA strand.
- **Population data:** One cited gnomAD dataset identified the variant in 1 of 113,768 European chromosomes (approximately 0.00088%).
- **Functional evidence:** Experimental studies indicate that the Glu101Lys substitution weakens the interaction between actin and myosin, potentially affecting force generation and movement in cardiac muscle.
- **Interpretation:** The expert panel classifies this variant as pathogenic based on evidence that includes affected individuals and families, genetic segregation, functional studies, and computational predictions. ClinVar classifications can change over time, so I retained my assigned variant and used the record for this interpretation.

## (f) Limitations and validation experiment

- **Limited clinical evidence:** The strength of the clinical evidence depends on the number of reported cases, family segregation data, and available clinical observations. More independent cases and family studies would help strengthen the evidence for the variant.
- **Experimental limitations:** Experiments using purified proteins or skinned muscle fibers do not fully represent the conditions inside living human heart muscle cells.
- **Computational prediction:** PolyPhen-2 and other computational tools predict the possible effects of amino acid substitutions, but their results do not directly prove that a variant causes disease.
- **Validation experiment:** Measure the force generated at different calcium concentrations in skinned cardiac muscle fibers carrying the Glu101Lys variant and compare the results with normal controls. Calcium sensitivity, actin–myosin interaction, and contractile force could be assessed to determine how the substitution affects cardiac muscle function. Additional studies using heart muscle cells could investigate calcium handling and cellular contraction.


## (g) Database links, access dates and references

**Database links (accessed 27 October 2026):**

- **NCBI Gene:** ACTC1, Gene ID 70. [https://www.ncbi.nlm.nih.gov/gene/70](https://www.ncbi.nlm.nih.gov/gene/70)
- **NCBI Protein:** NP_005150.1, actin alpha cardiac muscle 1. [https://www.ncbi.nlm.nih.gov/protein/NP_005150.1](https://www.ncbi.nlm.nih.gov/protein/NP_005150.1)
- **NCBI Nucleotide:** NM_005159.5, ACTC1 mRNA. [https://www.ncbi.nlm.nih.gov/nuccore/NM_005159.5](https://www.ncbi.nlm.nih.gov/nuccore/NM_005159.5)
- **ClinVar:** ACTC1 c.301G>A (p.Glu101Lys), Variation ID 18331. [https://www.ncbi.nlm.nih.gov/clinvar/variation/18331/](https://www.ncbi.nlm.nih.gov/clinvar/variation/18331/)
- **UniProt:** P68032, actin alpha cardiac muscle 1. [https://www.uniprot.org/uniprotkb/P68032/entry](https://www.uniprot.org/uniprotkb/P68032/entry)

**References:**

1. Olson TM, Doan TP, Kishimoto NY, Whitby FG, Ackerman MJ, Fananapazir L. (2000). Inherited and de novo mutations in the cardiac actin gene cause hypertrophic cardiomyopathy. *Journal of Molecular and Cellular Cardiology*, 32(9), 1687–1694. https://doi.org/10.1006/jmcc.2000.1204  

2. Bookwalter CS, Trybus KM. (2006). Functional consequences of a mutation in an expressed human alpha-cardiac actin at a site implicated in familial hypertrophic cardiomyopathy. *Journal of Biological Chemistry*, 281(24), 16777–16784. https://doi.org/10.1074/jbc.M512935200  

3. Song W, Dyer E, Stuckey DJ, et al. (2011). Molecular mechanism of the E99K mutation in cardiac actin (ACTC gene) that causes apical hypertrophy in man and mouse. *Journal of Biological Chemistry*, 286(31), 27582–27593. https://doi.org/10.1074/jbc.M111.252320  

4. ClinGen Cardiomyopathy Variant Curation Expert Panel. (2025). ACTC1 c.301G>A (p.Glu101Lys): expert-panel classification for hypertrophic cardiomyopathy. *NCBI ClinVar*, Variation ID 18331.  
   (https://www.ncbi.nlm.nih.gov/clinvar/variation/18331/)

5. Karp G, Iwasa J, Marshall W. *Cell and Molecular Biology: Concepts and Experiments*. Chapter 9. Course textbook reference for general cell biology concepts, where relevant.


## How to rerun this work

1. Install R and RStudio, or use Posit Cloud in a browser.
2. Install the required R packages by running install.packages(c("rentrez", "ggplot2")) once. This command is included at the top of analysis.R.
3. Open analysis.R in RStudio and run the entire script using **Source**. The script should create the data/, results/, and figures/ folders and save the generated outputs.
4. The script retrieves information from NCBI for **ACTC1 (Gene ID: 70)** and the assigned variant **NM_005159.5:c.301G>A (p.Glu101Lys)**. If an NCBI request fails because of a temporary connection or rate-limit issue, wait briefly and rerun the script without changing the assigned gene or variant.

**Note:** The output folders will be created automatically only if the corresponding folder-creation commands are included in analysis.R. The exact files generated depend on the commands in the script.


## Questions

**1.  What does your assigned gene encode, and how does this protein contribute to muscle function?**

ACTC1 encodes actin alpha cardiac muscle 1, a protein that forms part of the thin filaments in cardiac muscle. Actin interacts with myosin during muscle contraction, allowing the heart to generate force and pump blood. Changes in the actin protein may affect how the heart muscle contracts.

**2.What was the exact protein accession and length retrieved with R?**

The protein accession retrieved was NP_005150.1, which is 377 amino acids long. It corresponds to the ACTC1 protein encoded by the transcript NM_005159.5.

**3.What did the amino-acid composition chart show? What can it NOT tell you?**

The chart showed that isoleucine was the most common amino acid, with 30 residues, followed by alanine with 29. Glutamic acid and glycine had 28 residues each, leucine had 27, and threonine had 26. However, amino-acid composition alone cannot show the protein's three-dimensional structure, the positions of the residues, or the exact effects of a specific mutation.

**4.What is your fixed ClinVar variant, and what is its current classification and evidence strength?**

The assigned variant is NM_005159.5:c.301G>A (p.Glu101Lys), ClinVar Variation ID 18331. It is classified as Pathogenic for hypertrophic cardiomyopathy and has an expert-panel review status. The classification is supported by clinical and functional evidence, although the strength of individual evidence types should be evaluated separately.

**5. What is the scientifically supported mechanism linking this variant to muscle function, and what remains uncertain?**

The Glu101Lys variant replaces glutamic acid, a negatively charged amino acid, with lysine, a positively charged amino acid. Functional studies suggest that this substitution can affect actin–myosin interactions and cardiac muscle force generation. However, the precise molecular changes responsible for the disease and how they contribute to the development of hypertrophic cardiomyopathy are not fully explained by the protein sequence and composition results alone.

**6.  What additional experiment would help test the proposed mechanism?**

Measure force generation at different calcium concentrations in skinned cardiac muscle fibers carrying the Glu101Lys variant and compare the results with normal controls. Additional experiments could examine actin–myosin interactions and contraction in cardiac muscle cells to determine how the mutation affects heart muscle function.


## Discussion: experimental, clinical and predicted evidence

The experimental evidence for the ACTC1 p.Glu101Lys (E101K) variant comes from studies investigating how the mutation affects cardiac actin function. Bookwalter and Trybus (2006) found that the mutation weakened the interaction between actin and myosin and reduced force generation. Debold et al. (2010) also reported changes in the force-generating ability of cardiac myosin interacting with mutant actin. Song et al. (2011) studied a mouse model carrying the E101K variant and found cardiac changes consistent with hypertrophic cardiomyopathy. These studies provide experimental evidence that the variant affects cardiac muscle function, although results from purified proteins and animal models do not completely reproduce the conditions in a living human heart.

The clinical evidence comes from multiple individuals and families affected by hypertrophic cardiomyopathy (HCM) and related cardiac conditions. According to the ClinVar expert-panel record, the variant has been reported in several affected families and segregated with disease in multiple affected individuals. It has also been observed at a very low frequency in population databases. ClinVar classifies the variant as Pathogenic for hypertrophic cardiomyopathy, with an expert-panel review dated 14 November 2025. The classification uses several evidence categories, including strong segregation evidence, moderate case-control evidence, and moderate functional evidence. This provides stronger support than a classification based on a single affected individual, although clinical expression can vary among people carrying the variant.

The predicted evidence includes computational analyses and conservation information suggesting that the amino acid substitution may affect ACTC1 function. The expert-panel assessment includes computational evidence under the PP3 criterion. However, computational predictions are not direct measurements of protein function and should be interpreted together with clinical and experimental findings.

Putting the evidence together, ACTC1 encodes alpha cardiac actin, which forms the thin filaments involved in heart muscle contraction. The E101K variant replaces glutamic acid, a negatively charged amino acid, with lysine, a positively charged amino acid, at residue 101. This change alters the local chemical properties of the protein and can affect its interactions with myosin. Experimental studies support impaired actin–myosin interactions and reduced force generation. These functional changes may contribute to abnormal cardiac muscle contraction and the development of hypertrophic cardiomyopathy.

Some uncertainties remain. Experiments using purified proteins and mouse models cannot fully establish how the variant affects contractile function in living human cardiac tissue. Although the evidence supports a pathogenic role, the precise molecular steps connecting the altered actin–myosin interaction to the development and severity of disease are not completely understood. A useful follow-up experiment would measure force generation at different calcium concentrations in cardiac muscle fibers containing the E101K variant and compare the results with normal controls. Additional studies of actin–myosin interaction and contraction in cardiac muscle cells could further clarify the mechanism.


## References

Bookwalter, C. S., & Trybus, K. M. (2006). Functional consequences of a mutation in an expressed human α-cardiac actin at a site implicated in familial hypertrophic cardiomyopathy. *Journal of Biological Chemistry, 281*(24), 16777–16784. https://doi.org/10.1074/jbc.M512935200

Debold, E. P., Saber, W., Cheema, Y., Bookwalter, C. S., Trybus, K. M., Warshaw, D. M., & VanBuren, P. (2010). Human actin mutations associated with hypertrophic and dilated cardiomyopathies demonstrate distinct thin filament regulatory properties in vitro. *Journal of Molecular and Cellular Cardiology, 48*(2), 286–292. https://doi.org/10.1016/j.yjmcc.2009.09.014

Song, W., Dyer, E., Stuckey, D. J., Copeland, O., Leung, M.-C., Bayliss, C., Messer, A., Wilkinson, R., Lopez-Tremoleda, J., Schneider, M. D., Harding, S. E., Redwood, C. S., Clarke, K., Nowak, K., Monserrat, L., Wells, D., & Marston, S. B. (2011). Molecular mechanism of the E99K mutation in cardiac actin (ACTC gene) that causes apical hypertrophy in man and mouse. *Journal of Biological Chemistry, 286*(31), 27582–27593. https://doi.org/10.1074/jbc.M111.252320

