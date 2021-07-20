#from melissa orobko:https://github.com/melissaorobko/searching-WebOfScience-with-R/blob/master/accessing-WOS-with-R_basics.R

# Use the rwos package to access Web of Science records

# Install the rwos package from github:
devtools::install_github("juba/rwos")
library(rwos)

# Authenticate
#   This is where you *should* be able to specify your WOS username and password 
#   that are connected to your institutional access for remote access, but it's never 
#   worked for me. I'd love to hear if it does work for you!
sid <- wos_authenticate()

# Specify which collections/editions you have access to
collections <- c('SCI', 'SSCI', 'ISTP', 'ISSHP')



# The basic search functions --------------------------------------------------------

# wos_search() returns the number of papers matching the query.
res <- wos_search(sid, 'AU=Wickham Hadley', editions = collections)

# wos_retrieve_all() takes the wos_search() results and returns a table of all the
#   papers in the search, which can then very easily be worked with in R (e.g. filter 
#   out papers that are before a certain year)
pubs <- wos_retrieve_all(res)


# Test using Research Categories ----------------------------------------------------

res <- wos_search(sid, 'TS=(Percina antesella AND invasive)', editions = collections)
pubs <- wos_retrieve_all(res)

#######
species_list<-read.csv("C:Inputs//working_list.csv")
head(species_list)
View(species_list)
species_list$Species.name<-as.factor(species_list$Species.name)
species_names_ais = unique(species_list$Species.name)
species_res = list()

species_list$wos<-"NA"

for(species_ in species_names_ais) {
  
  
  species_res[[species_]] = wos_search(sid=sid, query=paste0('TS=(', species_, " AND invas*", ")"), editions = collections)
  species_list[species_list$Species.name== paste0(species_), ]$wos<-species_res[[species_]]$results
  Sys.sleep(0.5)
}

species_list$wos<-as.numeric(species_list$wos)

