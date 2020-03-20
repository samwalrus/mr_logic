# Using logic programming to represent causal inference through Mendelian randomization

This project will explore the relationship between mendelian randomization and logic programming.

See an example of logic programming for Mendelian inheritance here: http://cplint.eu/e/mendel.pl

See a description of Mendelian randomization with various biases here: https://www.biorxiv.org/content/10.1101/602516v2 (Note that this will be updated in the next few days. Figure 1 is relevant).


## Potential activities

**Task 1.** Write a probabilistic logic programme that simulates the biological structure underlying Mendelian randomization (MR)

- Parental transmission of alleles to offspring
- Manifestation of exposure phenotype in offspring
- Manifestation of outcome phenotype in offspring


**Task 2:** Generate data using this logic programme

- Mimics the type of data that we have to perform MR already
- Other types of data that could be more useful? For example, generating data for siblings or trios


**Task 3:** Can we learn the programme from the data?

- Can we learn the parameters given a model?
- Can we learn the structure of the model?
- How does it compare to inferential MR techniques?


**Task 4:** Can we add complications to the original programme in (Task 1) and then proceed to (2-3) with this more complex model?

- Potential joint transmission of environmental influences from Parents
- Potential secondary (pleiotropic) effects of the allele on the outcome



