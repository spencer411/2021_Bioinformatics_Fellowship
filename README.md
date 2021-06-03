# 2021 UAlbany Bioinformatics Fellowship
<img width="479" alt="Screen Shot 2021-06-01 at 1 24 25 PM" src="https://user-images.githubusercontent.com/43999021/120365648-b5958200-c2dc-11eb-8646-2845387692f8.png">

**PROJECT 2 RESOURCES**

This github page serves as a resource for students during project 2 of the UAlbany Summer Bioninformatis Fellowship. Students can find information on the datasets available to them as well as tools for analysis and visualization here.

Our intention is to make this github site available indefinitely as a resource for ongoing and future projects.

**DATASETS**

There are 8 datasets with pre-downloaded and assembled genomes to choose from. A short description of each dataset and a link to the associated publication can be found below. A folder containing the genomes for each dataset can be accesed on the server at the following location (network/rit/path/to/genome/folders)

1. _Lactobacillales_ isolates from the International Space Station.
This dataset consists of 19 _Lactobacillales_ isolates. Members of this genus (_Enterococcus_) have the potential to be pathogenic and carry antibotic resistance genes. You can read more about the genomes collected on the space station here: [Bharadwaj_et_al.pdf](https://github.com/spencer411/2021_Bioinformatics_Fellowship/files/6591772/Bharadwaj_et_al.pdf)

2. _Salmonella enterica_ Serovar Enteritidis isolates associated with outbreaks in Brazil.
This dataset consists of 30 _S. Enteritidis_ isolates originating from both patients and food sources during outbreaks that occured between 1999 and 2006. You can read more about the genomes here: [Cao_et_al.pdf](https://github.com/spencer411/2021_Bioinformatics_Fellowship/files/6592061/Cao_et_al.pdf)

3. Species and subspecies of the genus _Staphylococcus_.
This dataset consists of 64 type strains representing 50 species in the genus _Staphylococcus_ from the National Collection of Type Cultures, United
Kingdom (NCTC), Deutsche Sammlung von Mikroorganismen und Zellkulturen, Germany (DSMZ), and Culture Collection, University of Göteborg, Sweden (CCUG). You can read more about the genomes here: [Cole_et_al.pdf](https://github.com/spencer411/2021_Bioinformatics_Fellowship/files/6592256/Cole_et_al.pdf)

4. _Bacillaceae_ strains isolated from the International Space Station.
This dataset consists of 29 bacterial isolates from the family _Bacillaceae_. Members of this group are common, and can be found in soil, sediments, air, freshwater, marine ecosystems, foods and in extreme environments. You can read more about the genomes collected on the space station here: [Daudu_et_al.pdf](https://github.com/spencer411/2021_Bioinformatics_Fellowship/files/6592307/Daudu_et_al.pdf)

5. Swine-associated Methicillin-Resistant _Staphylococcus aureus_. 
This dataset consists of genome sequences for 63 Livestock-associated MRSA isolates all of Sequence Type (ST) 5, isolated in the United States. ST5 isolates are a public concern due to their pathogenicity and ability to acquire mobile genetic elements. You can read more about the genomes here: [Hau_et_al_1.pdf](https://github.com/spencer411/2021_Bioinformatics_Fellowship/files/6592628/Hau_et_al_1.pdf)

6. Methicillin-resistant _Staphylococcus aureus_ ST5 isolates from a U.S. Hospital.
This dataset consists of 50 clinical MRSA isolates from humans with MRSA-related disease. You can reads more about the genomes here: [Hau_et_al_2.pdf](https://github.com/spencer411/2021_Bioinformatics_Fellowship/files/6592663/Hau_et_al_2.pdf)

7. _Streptococcus mitis_ strains isolated from a woman and her male sexual partner.
This dataset includes 39 genomes isolated from the oral cavity and urogenital tract of a woman and her partner. _Streptococcus mitis_ is common in humans and is considered to be a commensal species, but may also cause a variety of invasive diseases in human. You can read more about the genomes here: [Mores_et_al.pdf](https://github.com/spencer411/2021_Bioinformatics_Fellowship/files/6592768/Mores_et_al.pdf)

8. Genome sequences of biosafety level 2 pathogens from the International Space Station.
This dataset is comprised of 20 biosafety level 2 (BSL-2) opportunistic pathogens isolated from the environmental surfaces of the space station. BSL-2 pathogens pose a moderate health hazard. Examples of agents typically worked with in a BSL-2 environment include equine encephalitis viruses and HIV, as well as _Staphylococcus aureus_. You can read more about the genomes collected on the space station here: [Sielaff_et_al.pdf](https://github.com/spencer411/2021_Bioinformatics_Fellowship/files/6592801/Sielaff_et_al.pdf)

**DATA ANALYSIS TOOLS**

_**Quality Control**_

One of the first steps in analyzing genomic data is to make sure your data is of good quality. Poor quality data can lead to erroneous results and problems with downstream analysis. Here we present two tools that can be used to asseess the quality of the genomes you will be anaylzing:

**CheckM:** CheckM can be used to determine the completeness and level of contaimtination in each of your genomes and allows for a taxon specific workflow. More information about checkM can be found [here](https://github.com/Ecogenomics/CheckM/wiki/Introduction#about).

To install CheckM using conda, copy and paste the code below after setting up and activating the conda CheckM environment:

```
conda install -c bioconda checkm-genome
```

Once the conda environment is activated, an example of how CheckM might be executed can be found below:

```
checkm taxon_set genus "Salmonella" sal.ms
checkm analyze -t 16 -x fa sal.ms /network/rit/lab/andamlab/bioinformatics_workshop /network/rit/lab/andamlab/bioinformatics_workshop/checkm_output
checkm qa -t 16 sal.ms /network/rit/lab/andamlab/bioinformatics_workshop/checkm_output
```

In the first line of the code above we are creating a taxon file, in this case called "sal.ms", telling CheckM that our species is of the genus _Salmonella_. A full list of genera supported by checkm can be found here (as this should be manipulated based on your species): [checkm_taxon_list.txt](https://github.com/spencer411/2021_Bioinformatics_Fellowship/files/6593316/checkm_taxon_list.txt)

In the second line we are telling CheckM to "analyze" using 16 threads (-t 16), and that our genomes have the extension .fa (-x fa) pointing CheckM to a folder that contains all of our _Salmonella_ genomes, and providing CheckM with the path and name of the output folder to create (in this case checkm_output)

In the last line of code we are telling CheckM to assess the data we analyzed in the prior step for contaimnation and completeness (qa).

Completeness and contamination will be written directly to your output file. Usually contamination at a levels of 5% or less is considered adequate, and genomes should generally be at least 90% complete.

**Quast:** Quast produces a number of summary statistics that are useful in assessing the quality of your genomes as well. The two measures we are specifically interested in are the numbers of [contigs](https://en.wikipedia.org/wiki/Contig), and the [N50 score](https://en.wikipedia.org/wiki/N50,_L50,_and_related_statistics#N50). More information about quast can be found [here](https://github.com/ablab/quast#genome-assembly-evaluation-tool). 

To install Quast using conda, copy and paste the code below after setting up and activating the conda Quast environment:

```
conda install -c bioconda quast
```

Once the conda environment is activated, an example of how Quast might be executed in a folder full of genomes can be found below:

```
quast.py *.fa
```

The code above is simply telling quast to run on every file in the folder ending in .fa.

Note that quast produces a folder named "quast_results". In the results folder you will find a report.tsv file. This file can be opened in excel and provides the user with many useful metrics including both the number of contigs, and N50 score. 

Ideally your genomes will have less than 200 contigs and an N50 score greater than 40,000 bp.

_**Annotation**_

Now that we have successfully checked for bad genomes in our dataset, and hopefully removed them, we can now move on to some more interesting analyses. Once of the first things we will want to do with our genomes is annotate them. Annotation is the the process of identifying features of interest in our genomes, which in our case is genes. Although there are several tools for this sort of analysis, we will use the most popular:

**Prokka:** Whole genome annotation is the process of identifying features of interest in a set of genomic DNA sequences, and labelling them with useful information. Prokka is a software tool to annotate bacterial, archaeal and viral genomes quickly and produce standards-compliant output files. More detailed information about Prokka can be found [here](https://pubmed.ncbi.nlm.nih.gov/24642063/).


To install Prokka using conda, copy and paste the code below after setting up and activating the Prokka conda environment:

```
conda install -c conda-forge -c bioconda -c defaults prokka
```

Once the conda environment is activated, an example of how Prokka might be executed in a folder full of genomes can be found below:

```
for file in *.fa; do tag=${file%.fa}; prokka --prefix "$tag" --genus Salmonella --outdir "$tag"_prokka $file; done
```

The code above is a bit complicated because of the prefix and outdirectory names whiche we are setting "tag" which is the filename minus the extension. So for example, if you were running this on a single genome it would look like this:

```
prokka --prefix genome_1 --genus Salmonella --outdir genome_1_prokka genome_1.fa
```




**VISUALIZATION TOOLS**

for FILE in *.fa; do prokka --outdir prokka --genus Salmonella --prefix $FILE%%.* $FILE; done


for FILE in *.fa; do prokka $FILE; done

for file in *.fa; do tag=${file%.fa}; prokka --prefix "$tag" --genus Salmonella --outdir "$tag"_prokka; done
