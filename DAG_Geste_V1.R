#Directed Acyclic Graph for GESTE Data Analysis Plan
#By JuKnox 1 7 2019

install.packages("ggdag")
library(ggdag)

metals_thyroid_adiposity_dag <- dagify(adiposity ~ thyroid,
                         adiposity ~ thyroid, 
                         thyroid ~ prenatalmetals,
                         thyroid ~ prenatalmetalsmixture, 
                         labels = c("prenatalmetals" = "Prenatal \n Metals", 
                                    "prenatalmetalsmixture" = "Prenatal \n Metals \n Mixture", 
                                    "thyroid" = "Childhood \n Thyroid\n Hormones",
                                    "adiposity" = "Adiposity",
                         exposure = "prenatalmetals",
                         exposure = "prenatalmetalsmixture", 
                         outcome = "adiposity",
                         outcome = "thyroid"))

ggdag(metals_thyroid_adiposity_dag, text = FALSE, use_labels = "label")
