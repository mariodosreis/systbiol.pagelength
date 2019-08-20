Length of Systematic Biology papers
===================================

Data downloaded from PubMed on 20th August 2019.

Files pubmed?.html contain the raw data from PubMed, using "Systematic
biology"[Journal] in the search. The search resulted in 1,542 records for years
1996 to 2019.

The pubmed?.html files were then concatenated and hand-edited to remove records
without page numbers (mostly advanced online publications). The edited file is
systbiol-pubmed-allpg.txt and has 1,495 records.

Grep and Awk were then used to extract the PMID, Date of Publication (DP) and
pages (PG). These are in pmid.txt, dp.txt, and pg.txt. These files were pasted
into pasted.txt, which was then analysed in R (see systbiol.R).

Note that no effort was made to classify records according to type (i.e. review,
research, opinion, book reviews, announcements, etc.).

Report bugs/issues to mariodosreis@gmail.com.
