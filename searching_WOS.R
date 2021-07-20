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
  
  
  species_res[[species_]] = wos_search(sid=sid, query=paste0('TS=(', species_, " AND (invas* OR introduced OR non-native OR alien OR exotic)", ")"), editions = collections)
  species_list[species_list$Species.name== paste0(species_), ]$wos<-species_res[[species_]]$results
  Sys.sleep(0.5)
}

species_list$wos<-as.numeric(species_list$wos)

write.csv(species_list, file="Outputs/species_list.csv")

#### Now do this for vectors
####### Pet or aquarium trade
species_list$wos_pet_trade<-"NA"
species_res_pet_trade = list()

for(species_ in species_names_ais) {
  
  
  species_res_pet_trade[[species_]] = wos_search(sid=sid, query=paste0('TS=(', species_, " AND (aquarium trade OR pet trade OR aquarium OR pet)", ")"), editions = collections)
  species_list[species_list$Species.name== paste0(species_), ]$wos_pet_trade<-species_res_pet_trade[[species_]]$results
  Sys.sleep(0.5)
}

species_list$wos_pet_trade<-as.numeric(species_list$wos_pet_trade)


####### Live trade
species_list$wos_live_trade<-"NA"
species_res_live_trade = list()

for(species_ in species_names_ais) {
  
  
  species_res_live_trade[[species_]] = wos_search(sid=sid, query=paste0('TS=(', species_, " AND (live trade OR live market)", ")"), editions = collections)
  species_list[species_list$Species.name== paste0(species_), ]$wos_live_trade<-species_res_live_trade[[species_]]$results
  Sys.sleep(0.5)
}

species_list$wos_live_trade<-as.numeric(species_list$wos_live_trade)




#### Bait
species_list$wos_bait<-"NA"
species_res_bait = list()

for(species_ in species_names_ais) {
  
  
  species_res_bait[[species_]] = wos_search(sid=sid, query=paste0('TS=(', species_, " AND (bait OR bait bucket OR bait fish OR bait industry)", ")"), editions = collections)
  species_list[species_list$Species.name== paste0(species_), ]$wos_bait<-species_res_bait[[species_]]$results
  Sys.sleep(0.5)
}

species_list$wos_bait<-as.numeric(species_list$wos_bait)



# Biological supply
species_list$wos_biol_supply<-"NA"
species_res_biol_supply = list()

for(species_ in species_names_ais) {
  
  
  species_res_biol_supply[[species_]] = wos_search(sid=sid, query=paste0('TS=(', species_, " AND (biological supply OR classroom)", ")"), editions = collections)
  species_list[species_list$Species.name== paste0(species_), ]$wos_biol_supply<-species_res_biol_supply[[species_]]$results
  Sys.sleep(0.5)
}

species_list$wos_biol_supply<-as.numeric(species_list$wos_biol_supply)


#### aquaculture
species_list$wos_aquaculture<-"NA"
species_res_aquaculture = list()

for(species_ in species_names_ais) {
  
  
  species_res_aquaculture[[species_]] = wos_search(sid=sid, query=paste0('TS=(', species_, " AND (aquaculture OR cultivation)", ")"), editions = collections)
  species_list[species_list$Species.name== paste0(species_), ]$wos_aquaculture<-species_res_aquaculture[[species_]]$results
  Sys.sleep(0.5)
}

species_list$wos_aquaculture<-as.numeric(species_list$wos_aquaculture)


#### stocking
species_list$wos_stocking<-"NA"
species_res_stocking = list()

for(species_ in species_names_ais) {
  
  
  species_res_stocking[[species_]] = wos_search(sid=sid, query=paste0('TS=(', species_, " AND (stocking OR fish stocking OR hatchery)", ")"), editions = collections)
  species_list[species_list$Species.name== paste0(species_), ]$wos_stocking<-species_res_stocking[[species_]]$results
  Sys.sleep(0.5)
}

species_list$wos_stocking<-as.numeric(species_list$wos_stocking)

#### boating
species_list$wos_boating<-"NA"
species_res_boating = list()

for(species_ in species_names_ais) {
  
  
  species_res_boating[[species_]] = wos_search(sid=sid, query=paste0('TS=(', species_, " AND (boating OR recreational boating OR watercraft OR float plane)", ")"), editions = collections)
  species_list[species_list$Species.name== paste0(species_), ]$wos_boating<-species_res_boating[[species_]]$results
  Sys.sleep(0.5)
}

species_list$wos_boating<-as.numeric(species_list$wos_boating)


#### shipping
species_list$wos_shipping<-"NA"
species_res_shipping = list()

for(species_ in species_names_ais) {
  
  
  species_res_shipping[[species_]] = wos_search(sid=sid, query=paste0('TS=(', species_, " AND (shipping OR ballast)", ")"), editions = collections)
  species_list[species_list$Species.name== paste0(species_), ]$wos_shipping<-species_res_shipping[[species_]]$results
  Sys.sleep(0.5)
}

species_list$wos_shipping<-as.numeric(species_list$wos_shipping)


#### canal
species_list$wos_canal<-"NA"
species_res_canal = list()

for(species_ in species_names_ais) {
  
  
  species_res_canal[[species_]] = wos_search(sid=sid, query=paste0('TS=(', species_, " AND (canal OR diversion)", ")"), editions = collections)
  species_list[species_list$Species.name== paste0(species_), ]$wos_canal<-species_res_canal[[species_]]$results
  Sys.sleep(0.5)
}

species_list$wos_canal<-as.numeric(species_list$wos_canal)

#### spread_adj
species_list$wos_spread_adj<-"NA"
species_res_spread_adj = list()

for(species_ in species_names_ais) {
  
  
  species_res_spread_adj[[species_]] = wos_search(sid=sid, query=paste0('TS=(', species_, " AND (Montana OR Idaho OR Alaska OR Washington OR Alberta OR Yukon)", ")"), editions = collections)
  species_list[species_list$Species.name== paste0(species_), ]$wos_spread_adj<-species_res_spread_adj[[species_]]$results
  Sys.sleep(0.5)
}

species_list$wos_spread_adj<-as.numeric(species_list$wos_spread_adj)


#### BC
species_list$wos_bc<-"NA"
species_res_bc = list()

for(species_ in species_names_ais) {
  
  
  species_res_bc[[species_]] = wos_search(sid=sid, query=paste0('TS=(', species_, " AND (British Columbia)", ")"), editions = collections)
  species_list[species_list$Species.name== paste0(species_), ]$wos_bc<-species_res_bc[[species_]]$results
  Sys.sleep(0.5)
}

species_list$wos_bc<-as.numeric(species_list$wos_bc)


write.csv(species_list, file="Outputs/species_list.csv")
