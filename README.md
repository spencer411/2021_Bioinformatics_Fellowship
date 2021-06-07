# 2021 UAlbany Bioinformatics Fellowship
<img width="479" alt="Screen Shot 2021-06-01 at 1 24 25 PM" src="https://user-images.githubusercontent.com/43999021/120365648-b5958200-c2dc-11eb-8646-2845387692f8.png">

**PROJECT 2 RESOURCES**

This GitHub page serves as a resource for students during project 2 of the UAlbany Summer Bioinformatis Fellowship. Students can find information on the datasets available to them as well as tools for analysis and visualization here.

Our intention is to make this GitHub site available indefinitely as a resource for ongoing and future projects.

**DATASETS**

There are 8 datasets with pre-downloaded and assembled genomes to choose from. A short description of each dataset and a link to the associated publication can be found below. A folder containing the genomes for each dataset can be accessed on the server at the following location (network/rit/path/to/genome/folders)

1. _Lactobacillales_ isolates from the International Space Station.
This dataset consists of 19 _Lactobacillales_ isolates. Members of this genus (_Enterococcus_) have the potential to be pathogenic and carry antibiotic resistance genes. You can read more about the genomes collected on the space station here: [Bharadwaj_et_al.pdf](https://github.com/spencer411/2021_Bioinformatics_Fellowship/files/6591772/Bharadwaj_et_al.pdf)

2. _Salmonella enterica_ Serovar Enteritidis isolates associated with outbreaks in Brazil.
This dataset consists of 30 _S. Enteritidis_ isolates originating from both patients and food sources during outbreaks that occurred between 1999 and 2006. You can read more about the genomes here: [Cao_et_al.pdf](https://github.com/spencer411/2021_Bioinformatics_Fellowship/files/6592061/Cao_et_al.pdf)

3. Species and subspecies of the genus _Staphylococcus_.
This dataset consists of 64 type strains representing 50 species in the genus _Staphylococcus_ from the National Collection of Type Cultures, United
Kingdom (NCTC), Deutsche Sammlung von Mikroorganismen und Zellkulturen, Germany (DSMZ), and Culture Collection, University of Göteborg, Sweden (CCUG). You can read more about the genomes here: [Cole_et_al.pdf](https://github.com/spencer411/2021_Bioinformatics_Fellowship/files/6592256/Cole_et_al.pdf)

4. _Bacillaceae_ strains isolated from the International Space Station.
This dataset consists of 29 bacterial isolates from the family _Bacillaceae_. Members of this group are common, and can be found in soil, sediments, air, freshwater, marine ecosystems, foods and in extreme environments. You can read more about the genomes collected on the space station here: [Daudu_et_al.pdf](https://github.com/spencer411/2021_Bioinformatics_Fellowship/files/6592307/Daudu_et_al.pdf)

5. Swine-associated Methicillin-Resistant _Staphylococcus aureus_. 
This dataset consists of genome sequences for 63 Livestock-associated MRSA isolates all of Sequence Type (ST) 5, isolated in the United States. ST5 isolates are a public concern due to their pathogenicity and ability to acquire mobile genetic elements. You can read more about the genomes here: [Hau_et_al_1.pdf](https://github.com/spencer411/2021_Bioinformatics_Fellowship/files/6592628/Hau_et_al_1.pdf)

6. Methicillin-resistant _Staphylococcus aureus_ ST5 isolates from a U.S. Hospital.
This dataset consists of 50 clinical MRSA isolates from humans with MRSA-related disease. You can read more about the genomes here: [Hau_et_al_2.pdf](https://github.com/spencer411/2021_Bioinformatics_Fellowship/files/6592663/Hau_et_al_2.pdf)

7. _Streptococcus mitis_ strains isolated from a woman and her male sexual partner.
This dataset includes 39 genomes isolated from the oral cavity and urogenital tract of a woman and her partner. _Streptococcus mitis_ is common in humans and is considered to be a commensal species, but may also cause a variety of invasive diseases in human. You can read more about the genomes here: [Mores_et_al.pdf](https://github.com/spencer411/2021_Bioinformatics_Fellowship/files/6592768/Mores_et_al.pdf)

8. Genome sequences of biosafety level 2 pathogens from the International Space Station.
This dataset is comprised of 20 biosafety level 2 (BSL-2) opportunistic pathogens isolated from the environmental surfaces of the space station. BSL-2 pathogens pose a moderate health hazard. Examples of agents typically worked with in a BSL-2 environment include equine encephalitis viruses and HIV, as well as _Staphylococcus aureus_. You can read more about the genomes collected on the space station here: [Sielaff_et_al.pdf](https://github.com/spencer411/2021_Bioinformatics_Fellowship/files/6592801/Sielaff_et_al.pdf)

**DATA ANALYSIS TOOLS**

_**Quality Control**_

One of the first steps in analyzing genomic data is to make sure your data is of good quality. Poor quality data can lead to erroneous results and problems with downstream analysis. Here we present two tools that can be used to assess the quality of the genomes you will be analyzing:

**CheckM:** CheckM can be used to determine the completeness and level of contamination in each of your genomes and allows for a taxon specific workflow. More information about CheckM can be found [here](https://github.com/Ecogenomics/CheckM/wiki/Introduction#about).

To install CheckM using conda, copy and paste the code below after creating and activating the CheckM conda environment:

```
conda install -c bioconda checkm-genome
```

Once the conda environment is activated, an example of how CheckM might be executed can be found below:

```
checkm taxon_set genus "Salmonella" sal.ms
checkm analyze -t 16 -x fa sal.ms /network/rit/lab/andamlab/bioinformatics_workshop /network/rit/lab/andamlab/bioinformatics_workshop/checkm_output
checkm qa -t 16 sal.ms /network/rit/lab/andamlab/bioinformatics_workshop/checkm_output
```

In the first line of the code above we are creating a taxon file, in this case called "sal.ms", telling CheckM that our species is of the genus _Salmonella_. A full list of genera supported by CheckM can be found here (as this should be manipulated based on your species): [checkm_taxon_list.txt](https://github.com/spencer411/2021_Bioinformatics_Fellowship/files/6593316/checkm_taxon_list.txt)

In the second line we are telling CheckM to "analyze" using 16 threads (-t 16), and that our genomes have the extension .fa (-x fa) pointing CheckM to a folder that contains all of our _Salmonella_ genomes, and providing CheckM with the path and name of the output folder to create (in this case checkm_output)

In the last line of code we are telling CheckM to assess the data we analyzed in the prior step for contamination and completeness (qa).

Completeness and contamination will be written directly to your output file. Usually, contamination at a levels of 5% or less is considered adequate, and genomes should generally be at least 90% complete.

**Quast:** Quast produces a number of summary statistics that are useful in assessing the quality of your genomes as well. The two measures we are specifically interested in are the numbers of [contigs](https://en.wikipedia.org/wiki/Contig), and the [N50 score](https://en.wikipedia.org/wiki/N50,_L50,_and_related_statistics#N50). More information about Quast can be found [here](https://github.com/ablab/quast#genome-assembly-evaluation-tool). 

To install Quast using conda, copy and paste the code below after creating and activating the Quast conda environment:

```
conda install -c bioconda quast
```

Once the conda environment is activated, an example of how Quast might be executed in a folder full of genomes can be found below:

```
quast.py *.fa
```

The code above is simply telling quast to run on every file in the folder ending in .fa.

Note that Quast produces a folder named "quast_results". In the results folder you will find a report.tsv file. This file can be opened in excel and provides the user with many useful metrics including both the number of contigs, and N50 score. 

Ideally your genomes will have less than 200 contigs and an N50 score greater than 40,000 bp.

_**Average Nucleotide Identity**_

The average nucleotide identity (ANI) is a similarity index between a given pair of genomes. A cutoff score of >95% indicates that they belong to the same species. The program below is a fast option for calculating ANI between pairs of genomes, or between genomes and a reference. Note that this analysis does not support highly divergent genomes (< 80% ANI) and therefore should not be used to compare genomes of divergent species. Nevertheless, it may be useful for students examining divergent genomes to confirm species designation by comparing genomes to a reference. 

**FastANI:** FastANI is developed for fast alignment-free computation of whole-genome Average Nucleotide Identity (ANI). ANI is defined as mean nucleotide identity of orthologous gene pairs shared between two microbial genomes. FastANI supports pairwise comparison of both complete and draft genome assemblies. More detailed information about FastANI can be found [here](https://github.com/ParBLiSS/FastANI#fastani).

To install FastANI using conda, copy and paste the code below after creating and activating the FastANI conda environment:

```
conda install -c bioconda fastani
```

Once the conda environment is activated, an example of how FastANI might be executed in a folder full of genomes can be found below:

```
fastANI --ql list1.txt --rl list2.txt -o fastani_senterica.txt
```

In the above script we are comparing genomes from list1.txt to list2.txt and the output is written to fastani_senterica.txt. To create a list of genomes for FastANI, one can simply use the following code to create a list for a given folder:

```
ls *.fa > list1.txt
```

If you are interested in comparing your samples to a reference genome, this can be done by using the following script:

```
fastANI --ql list1.txt -r NZ_AP014944.fa -o fastani_refANI_schleif.txt
```

In the script above you are comparing your list against the reference genome NZ_AP014944.fa (downloaded from NCBI). The output is written to fastani_refANI_schleif.txt file.

_**Antibiotic Resistance and Virulence**_

One of the ways we can understand more about our genomes is by identifying genes associated with pathogenicity and resistance to antibiotics. By comparing our sequences to databases that contain the sequences of known antibiotic genes and virulence factors, we can identify these characteristics in our own genomes. There are several different ways to do this, but here we will use one of them most efficient and user friendly tools to do so:

**ABRicate** ABRicate is a tool for the mass screening of contigs for antimicrobial resistance or virulence genes, and it comes bundled with multiple databases. You can read more about ABRicate [here](https://github.com/tseemann/abricate).

To install ABRicate using conda, copy and paste the code below after creating and activating the ABRicate conda environment:

```
conda install -c conda-forge -c bioconda -c defaults abricate
```

Once the conda environment is activated, an example of how ABRicate might be executed to determine antibiotic resistance using the [CARD](https://card.mcmaster.ca/) database in a folder full of genomes can be found below:

```
abricate --db card --quiet *.fa > abricate_amr_results.tab
abricate --summary abricate_amr_results.tab > abricate_amr_summary.tab
```

In the first line of the above script, we are we are getting full results on the antibiotic resistance genes present in each genome, whereas in the second line we are combining those results in a single output file (abricate_amr_summary.tab). This file contains percentages that describe matches for each ABR gene found in each genome. There are actually 9 different databases to choose from when running this program, you can learn more about them [here](https://github.com/tseemann/abricate#databases). So, for example, if you wanted to screen your genomes against the virulence factor database (VFDB), you would do the following:

```
abricate --db vfdb --quiet *.fa > abricate_vfdb_results.tab
abricate --summary abricate_vfdb_results.tab > abricate_vfdb_summary.tab
```

The data created by ABRicate can be extremely informative when combined with a phylogenetic tree (see more on that below). There are also instructions on how that can be done below in the Visualization Tools section.

_**Annotation**_

Now that we have successfully checked for bad genomes in our dataset, and hopefully removed them, we can move on to some more interesting analyses. One of the first things we will want to do with our genomes is annotate them. Annotation is the the process of identifying features of interest in our genomes, which in our case is genes. Although there are several tools for this sort of analysis, we will use the most popular:

**Prokka:** Whole genome annotation is the process of identifying features of interest in a set of genomic DNA sequences, and labelling them with useful information. Prokka is a software tool to annotate bacterial, archaeal and viral genomes quickly and produce standards-compliant output files. More detailed information about Prokka can be found [here](https://pubmed.ncbi.nlm.nih.gov/24642063/).


To install Prokka using conda, copy and paste the code below after creating and activating the Prokka conda environment:

```
conda install -c conda-forge -c bioconda -c defaults prokka
```

Once the conda environment is activated, an example of how Prokka might be executed in a folder full of genomes can be found below:

```
for file in *.fa; do tag=${file%.fa}; prokka --prefix "$tag" --genus Salmonella --outdir "$tag"_prokka $file; done
```

The code above is a bit complicated because of the prefix and out directory names. To get rid of the extension for these names we are using "tag" which is the filename minus the extension (e.g. tag=${file%.fa}). So for example, if you were running this on a single genome it would look like this:

```
prokka --prefix genome_1 --genus Salmonella --outdir genome_1_prokka genome_1.fa
```

The --genus option above needs to be manipulated based on the species you are examining.

Prokka creates a folder that has several files in it based on the results of the annotation. The main file we are interested in for downstream analysis is the [.gff file](https://en.wikipedia.org/wiki/General_feature_format). This file includes both the nucleotide sequence, and the position and names of genes present in the genome. Since you will likely want to move all of the .gff files to a single folder for downstream analysis, you can use the following code from the folder that contains all your genomes to do so, assuming you first make a folder called "annotations"

```
mv **/*.gff annotations
```

_**Pan-Genome Analysis**_

Now we come to one of the more interesting analyses we can carry out on our combined data set. That is a [Pan-genome](https://en.wikipedia.org/wiki/Pan-genome) analysis. A pan-genome can be defined as the entire gene content belonging to a study group. The pan-genome consists of core genes (genes shared by all isolates), shell genes (genes present in the majority of isolates, but not shared by the entire group), and cloud genes (genes present in only a few, or even one isolate). Here you can choose between two of the most commonly used programs for such an analysis:

**Roary:** Roary is a high-speed stand-alone pan genome pipeline, which takes annotated assemblies in .gff format (produced by Prokka) and calculates the pan genome. More detailed information about Roary can be found [here](https://github.com/sanger-pathogens/Roary#introduction).


To install Roary using conda, copy and paste the code below after creating and activating the Roary conda environment:

```
conda install -c bioconda roary
```

Once the conda environment is activated, an example of how Roary might be executed in a folder full of .gff files can be found below:

```
roary -e --mafft -p 16 *.gff
```

The code above is telling Roary to run and build a core gene alignment using the program mafft (-e --mafft) using 16 threads (-p 16) and utilizing all .gff files in the folder (*.gff). Roary produces a large number of output files for downstream analysis and visualization. Feel free to open these files in excel or a text editor to get a better sense of what they are (but some of them are very large, so you might want to move them to your desktop first). More information on the output files and what you can do with them can be found [here](https://sanger-pathogens.github.io/Roary/). Of particular interest will be the core genome alignment (ending in .aln) which can be used to create a phylogenetic tree, but more on that later.

**Panaroo:** Like Roary, Panaroo is a high speed stand alone pan genome pipeline, which takes annotated assemblies in .gff format (produced by Prokka) and calculates the pan genome. The major difference between the two algorithms is that Panaroo is a graph-based pangenome clustering tool that is able to account for many of the sources of error introduced during the annotation of prokaryotic genome assemblies. More detailed information about Panaroo can be found [here](https://genomebiology.biomedcentral.com/articles/10.1186/s13059-020-02090-4).

To install Panaroo using conda, copy and paste the code below after creating and activating the Panaroo conda environment:

```
conda install -c bioconda panaroo

```

Once the conda environment is activated, an example of how Panaroo might be executed in a folder full of .gff files can be found below:

```
panaroo -t 16 -i *.gff -o panaroo_results --clean-mode strict -a core
```

The code above is telling Panaroo to run using 16 threads (-t 16) utilizing all .gff files in the folder (*.gff). It is also telling Panaroo to wrtite the results to the folder panaroo_results (-o), using strict filtering (--clean-mode strict), and to create a core genome alignment (-a). Like Roary, Panaroo produces a large number of output files for downstream analysis and visualization. In fact, the majority of these output files are formatted identically. Therefore, you can use the [link](https://sanger-pathogens.github.io/Roary/) provided above from Roary to understand more about the output files and what you can with them. Again, of particular interest will be the core genome alignment (ending in .aln) which can be used to create a phylogenetic tree (see next step).

_**Tree Building**_

Building a [phylogenetic tree](https://en.wikipedia.org/wiki/Phylogenetic_tree) is one of the most informative ways to display genomic data when examining groups of isolates. To build a phylogenetic tree you will need a core alignment file produced by either Roary or Panaroo above. These alignment files are huge, as they contain the entire genome sequence for each isolate examined, aligned. Phylogenetic trees are built on genetic differences among genome sequences, therefore all we need to build a phylogenetic tree is the variable sites from the alignment file. We can easily extract those sites using snp-sites. 

**snp-sites** Snp-sites extracts single nucleotide polymorphisms ([SNPs](https://en.wikipedia.org/wiki/Single-nucleotide_polymorphism)) from a large whole genome alignment. You can read more about snp-sites [here](https://github.com/sanger-pathogens/snp-sites#introduction).

To install snp-sites using conda, copy and paste the code below after creating and activating the snp-sites conda environment:

```
conda install -c bioconda snp-sites

```

Once the conda environment is activated, you can process your .aln file produced by Roary or Panaroo using the code below:

```
snp-sites core_alignment.aln -p -o core_alignement.phy
```

This will create a phyllip format (.phy) file with only variable sites which can be used in the next step to build a [maximum likelihood tree](https://en.wikipedia.org/wiki/Computational_phylogenetics#Maximum_likelihood). To build a maximum liklihood tree we are going use 
RAxML.

**RAxML** RAxML is a program for sequential and parallel Maximum Likelihood based inference of large phylogenetic trees. It can also be used for post-analyses of sets of phylogenetic trees, analyses of alignments and, evolutionary placement of short
reads. To read more about RAxML click [here](https://academic.oup.com/bioinformatics/article/30/9/1312/238053?login=true).

To install RAxML using conda, copy and paste the code below after creating and activating the RAxML conda environment:

```
conda install -c bioconda raxml
```

Once the conda environment is activated, you can build your tree using the file created by snp-sites using the code below:

```
raxmlHPC -T 16 -s core_alignement.phy -p 12345 -m GTRGAMMA -n raxml_core_output 
```
The code above will run an algorithm to determine the best tree based on variable sites within your data (SNPs). It will create multiple output files, but the one you are interested will have the word "best" in it. In this example it would read "RAxML_bestTree.raxml_core_output". Now that you've built a tree you can open it in a tree viewer, and arrange it appropriately. For that we will use FigTree.

**FigTree** FigTree is designed as a graphical viewer of phylogenetic trees and as a program for producing publication-ready figures. Unlike all of the other programs we have used so far FigTree has a graphical user interface (GUI), which just means it is a regular program you download and install on your computer. You can get the latest version [here](https://github.com/rambaut/figtree/releases).

Once you have FigTree installed you can open it and import your tree by clicking File > Open, and there is your tree! We will want to properly root our tree using FigTree. To do so click Tree > Midpoint Root. As you can see this organizes your tree in a more readable way. Now that our tree is properly rooted we can export it. To do so go to File > Export Trees. At the prompt select Newick from the dropdown menu and click "Save as currently displayed. Name it something like "my_tree.tre".

Now that you have a phylogenetic tree, you will likely want to annotate it with data. See more about that in the visualization section below.

**VISUALIZATION TOOLS**

Hopefully at this point you have a acquired a large amount of data and are interested in visualizing that data. This is how scientists really communicate the results of their work. Below is a mix of general tools (that may be used to transform your data into figures that you conceive), along with some more specific tools (based on the analyses from above). We will start with the general:

**Visualizations With R** At this point in the course you should be familiar with R, and more specifcally R studio. There are a number of resources out there for making visualizations with R, but one of the best is the [R graph gallery](https://www.r-graph-gallery.com/). The R graph gallery not only provides inspiration in the form of beauitful visualizations, it also provides the code. One of the easiest ways to incorporate your own data into these graphs is to run the code for the graph you are interested in, see how they have the data set up, and than manipulate your data so it is set up the same way. Below are some of the visualization techniques you might consider using for your data:

[_Heatmaps_](https://www.r-graph-gallery.com/heatmap) A heatmap is a graphical representation of data where the individual values contained in a matrix are represented as colors. Heatmaps great for comparing things like ANI (specific code for that below), or differences in the number of antibiotic resistance or virulence factors.

[_Boxplots_](https://www.r-graph-gallery.com/boxplot.html) A boxplot is a standardized way of displaying the distribution of data based on a five number summary (“minimum”, first quartile (Q1), median, third quartile (Q3), and “maximum”). It can tell you about your outliers and what their values are. Boxplots are great for comparing the number of accessory genes in the pan genome, differences in the number of antibiotic resistance or virulence factors based on specific groups in your dataset, or how the number of factors vary across time or any other grouping. A visualy appealing variation of the boxplot is the [violin chart](https://www.r-graph-gallery.com/violin.html).

[Chord Diagrams](https://www.r-graph-gallery.com/chord-diagram.html) 
A Chord diagram allows for the visualization of flows between a set of entities. Chord diagrams can be used to show how genes are distributed across different groupings of your genomes. They can also be used to show how your genomes are interrealted based on any given factor (host, year, etc.). 

**Building Trees With The Interactive Tree Of Life (iTOL)**

[iTOL](https://itol.embl.de/) can visualize trees with 50'000 or more leaves. With advanced search capabilities and display of unrooted, circular and regular cladograms or phylograms, exploring and navigating trees of any size is simple. There are a wide range of resources for annotating your phylogentic trees with the data you've produced. Itol includes a number of instructive pages on [tree annotation](https://itol.embl.de/help.cgi#annot) and [how-to videos](https://itol.embl.de/video_tutorial.cgi) for your convenience.

We have worked with iTOL to set up a shared account for this fellowship. 
The user info is below: 

username: bioinfo_2021 / password: ualbany

**Making a FastANI Heatmap**

One of the analysis techniques we looked at above was FastANI. FastANI allows you to calculate the average nulceotdie identity (ANI) between all pairs of genomes you are examining. This can be visualized nicely with the R code here:

```
library("reshape2")
library("ComplexHeatmap")
library("gplots")

### get data, convert to matrix
x <- read.csv("your_heatmap.csv")
matrix <- acast(x, X~Y, value.var="ANI")

### define the colors within 2 zones
breaks = seq(min(matrix), max(1), length.out=100)
gradient1 = colorpanel( sum( breaks[-1]<=95 ), "blue", "white" )
gradient2 = colorpanel( sum( breaks[-1]>95 & breaks[-1]<=100), "white", "red" )

hm.colors = c(gradient1, gradient2)
heatmap.2(matrix, scale = "none", trace = "none", colors = "blue")
```

Prior to running this code, you should open your FastANI output in excel, remove the columns that are not needed, and rename the column headings X, Y and ANI so it looks like this:

<img width="330" alt="Screen Shot 2021-06-07 at 11 06 48 AM" src="https://user-images.githubusercontent.com/43999021/121041139-7a81cb80-c780-11eb-807a-957cd05305bb.png">

After doing so, sort your ANI column by the highest value to the lowest, and save it as a .csv file. After that you should be ready to go!

**Pan-genome Visulations**

There are many tools out there to visualize the output of Roary or Panaroo along with a tree. Some of them (straight from the [Roary website](https://sanger-pathogens.github.io/Roary/)) are listed here:

_**roary_plots.py**_ This contributed script by Marco Galardini is very useful. Additional details can be found [here](https://github.com/sanger-pathogens/Roary/tree/master/contrib/roary_plots) in the repository. It provides 3 figures, showing the tree compared to a matrix with the presence and absence of core and accessory genes. The next is an pie chart of the breakdown of genes and the number of isolate they are present in. And finally there is a graph with the frequency of genes versus the number of genomes.

<img width="477" alt="Screen Shot 2021-06-07 at 11 12 58 AM" src="https://user-images.githubusercontent.com/43999021/121042243-7c985a00-c781-11eb-9876-0da6ae7243cc.png">

By dropping the python script in the same folder as your gene_presence_absence.csv you can run the following code to create them:

```
roary_plots.py name_of_your_newick_tree_file.tre gene_presence_absence.csv
```
_**Interactive visualisation with Phandango**_ James Hadfield has produced the [Phandango website](http://jameshadfield.github.io/phandango/#/) which allows for interactive visualisation of the output of Roary. You can drag and drop the results into your web browser, then interactively play around with the data. There is an example data set from Roary on the website.


**Combining Trees and Data**

