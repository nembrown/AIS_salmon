#from melissa orobko:https://github.com/melissaorobko/searching-WebOfScience-with-R/blob/master/accessing-WOS-with-R_basics.R

# Use the rwos package to access Web of Science records

# Install the rwos package from github:
#devtools::install_github("juba/rwos")
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
wos_search(sid, 'TS=("(Bellamya chinensis OR Cipangopaludina chinensis)" AND (invas* OR introduced OR non-native OR alien OR exotic))', editions=collections)
#rthere is a July 20 version which is just my cuts not super systematic, after July 26th, I systematically cut the long list down: 
#filter out nthose withnot a climate match to canada, 
#filter out genus only if no other specific representation, 
#filter out if has 0 mentions of the species +invasive ANd only mentioned in one pub ... 
#goes from 876 to 390. then fed in here as working_list_long_cut
species_list<-read.csv("C:Inputs//working_list_long_cut.csv")
head(species_list)
species_list$Species.name<-as.factor(species_list$Species.name)
species_names_ais = unique(species_list$Species.name)
species_res = list()

species_list$wos<-"NA"

for(species_ in species_names_ais) {
  
  
  species_res[[species_]] = wos_search(sid=sid, query=paste0('TS=(', species_, " AND (invas* OR introduced OR non-native OR non native OR non indigenous OR alien OR exotic OR non-indigenous)", ")"), editions = collections)
  species_list[species_list$Species.name== paste0(species_), ]$wos<-species_res[[species_]]$results
  Sys.sleep(1)
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
  Sys.sleep(1)
}

species_list$wos_pet_trade<-as.numeric(species_list$wos_pet_trade)


####### Live trade
species_list$wos_live_trade<-"NA"
species_res_live_trade = list()

for(species_ in species_names_ais) {
  
  
  species_res_live_trade[[species_]] = wos_search(sid=sid, query=paste0('TS=(', species_, " AND (live trade OR live market)", ")"), editions = collections)
  species_list[species_list$Species.name== paste0(species_), ]$wos_live_trade<-species_res_live_trade[[species_]]$results
  Sys.sleep(1)
}

species_list$wos_live_trade<-as.numeric(species_list$wos_live_trade)




#### Bait
species_list$wos_bait<-"NA"
species_res_bait = list()

for(species_ in species_names_ais) {
  
  
  species_res_bait[[species_]] = wos_search(sid=sid, query=paste0('TS=(', species_, " AND (bait OR bait bucket OR bait fish OR bait industry)", ")"), editions = collections)
  species_list[species_list$Species.name== paste0(species_), ]$wos_bait<-species_res_bait[[species_]]$results
  Sys.sleep(1)
}

species_list$wos_bait<-as.numeric(species_list$wos_bait)



# Biological supply
species_list$wos_biol_supply<-"NA"
species_res_biol_supply = list()

for(species_ in species_names_ais) {
  
  
  species_res_biol_supply[[species_]] = wos_search(sid=sid, query=paste0('TS=(', species_, " AND (biological supply OR classroom)", ")"), editions = collections)
  species_list[species_list$Species.name== paste0(species_), ]$wos_biol_supply<-species_res_biol_supply[[species_]]$results
  Sys.sleep(1)
}

species_list$wos_biol_supply<-as.numeric(species_list$wos_biol_supply)


#### aquaculture
species_list$wos_aquaculture<-"NA"
species_res_aquaculture = list()

for(species_ in species_names_ais) {
  
  
  species_res_aquaculture[[species_]] = wos_search(sid=sid, query=paste0('TS=(', species_, " AND (aquaculture OR cultivation)", ")"), editions = collections)
  species_list[species_list$Species.name== paste0(species_), ]$wos_aquaculture<-species_res_aquaculture[[species_]]$results
  Sys.sleep(1)
}

species_list$wos_aquaculture<-as.numeric(species_list$wos_aquaculture)


#### stocking
species_list$wos_stocking<-"NA"
species_res_stocking = list()

for(species_ in species_names_ais) {
  
  
  species_res_stocking[[species_]] = wos_search(sid=sid, query=paste0('TS=(', species_, " AND (stocking OR fish stocking OR hatchery)", ")"), editions = collections)
  species_list[species_list$Species.name== paste0(species_), ]$wos_stocking<-species_res_stocking[[species_]]$results
  Sys.sleep(1)
}

species_list$wos_stocking<-as.numeric(species_list$wos_stocking)

#### boating
species_list$wos_boating<-"NA"
species_res_boating = list()

for(species_ in species_names_ais) {
  
  
  species_res_boating[[species_]] = wos_search(sid=sid, query=paste0('TS=(', species_, " AND (boating OR recreational boating OR watercraft OR float plane)", ")"), editions = collections)
  species_list[species_list$Species.name== paste0(species_), ]$wos_boating<-species_res_boating[[species_]]$results
  Sys.sleep(1)
}

species_list$wos_boating<-as.numeric(species_list$wos_boating)


#### shipping
species_list$wos_shipping<-"NA"
species_res_shipping = list()

for(species_ in species_names_ais) {
  
  
  species_res_shipping[[species_]] = wos_search(sid=sid, query=paste0('TS=(', species_, " AND (shipping OR ballast)", ")"), editions = collections)
  species_list[species_list$Species.name== paste0(species_), ]$wos_shipping<-species_res_shipping[[species_]]$results
  Sys.sleep(1)
}

species_list$wos_shipping<-as.numeric(species_list$wos_shipping)


#### canal
species_list$wos_canal<-"NA"
species_res_canal = list()

for(species_ in species_names_ais) {
  
  
  species_res_canal[[species_]] = wos_search(sid=sid, query=paste0('TS=(', species_, " AND (canal OR diversion)", ")"), editions = collections)
  species_list[species_list$Species.name== paste0(species_), ]$wos_canal<-species_res_canal[[species_]]$results
  Sys.sleep(1)
}

species_list$wos_canal<-as.numeric(species_list$wos_canal)

#### spread_adj
species_list$wos_spread_adj<-"NA"
species_res_spread_adj = list()

for(species_ in species_names_ais) {
  
  
  species_res_spread_adj[[species_]] = wos_search(sid=sid, query=paste0('TS=(', species_, " AND (Montana OR Idaho OR Alaska OR Washington OR Alberta OR Yukon)", ")"), editions = collections)
  species_list[species_list$Species.name== paste0(species_), ]$wos_spread_adj<-species_res_spread_adj[[species_]]$results
  Sys.sleep(1)
}

species_list$wos_spread_adj<-as.numeric(species_list$wos_spread_adj)


#### BC
species_list$wos_bc<-"NA"
species_res_bc = list()

for(species_ in species_names_ais) {
  
  
  species_res_bc[[species_]] = wos_search(sid=sid, query=paste0('TS=(', species_, " AND (British Columbia)", ")"), editions = collections)
  species_list[species_list$Species.name== paste0(species_), ]$wos_bc<-species_res_bc[[species_]]$results
  Sys.sleep(1)
}

species_list$wos_bc<-as.numeric(species_list$wos_bc)

#### salmon
species_list$wos_salmon<-"NA"
species_res_salmon = list()

for(species_ in species_names_ais) {
  
  
  species_res_salmon[[species_]] = wos_search(sid=sid, query=paste0('TS=(', species_, " AND salmon AND impact AND (invas* OR introduced OR non native OR non indigenous OR non-native OR alien OR exotic OR non-indigenous)", ")"), editions = collections)
  species_list[species_list$Species.name== paste0(species_), ]$wos_salmon<-species_res_salmon[[species_]]$results
  Sys.sleep(1)
}

species_list$wos_salmon<-as.numeric(species_list$wos_salmon)


#### impact
species_list$wos_impact<-"NA"
species_res_impact = list()

for(species_ in species_names_ais) {
  
  
  species_res_impact[[species_]] = wos_search(sid=sid, query=paste0('TS=(', species_, " AND impact AND ecology AND (invas* OR non native OR non indigenous OR introduced OR non-native OR alien OR exotic OR non-indigenous)", ")"), editions = collections)
  species_list[species_list$Species.name== paste0(species_), ]$wos_impact<-species_res_impact[[species_]]$results
  Sys.sleep(1)
}

species_list$wos_impact<-as.numeric(species_list$wos_impact)


write.csv(species_list, file="Outputs/species_list.csv")



###### compare long list to short list 
####### long list
species_list_long<-read.csv("C:Inputs//working_list_long.csv")
head(species_list_long)
species_list_long$Species.name<-as.factor(species_list_long$Species.name)
species_names_ais_long = unique(species_list_long$Species.name)
species_res_long = list()

species_list_long$wos<-"NA"

for(species_ in species_names_ais_long) {
  
  
  species_res_long[[species_]] = wos_search(sid=sid, query=paste0('TS=(', species_, " AND (invas* OR introduced OR non-native OR alien OR exotic)", ")"), editions = collections)
  species_list_long[species_list_long$Species.name== paste0(species_), ]$wos<-species_res_long[[species_]]$results
  Sys.sleep(1)
}

species_list_long$wos<-as.numeric(species_list_long$wos)

write.csv(species_list_long, file="Outputs/species_list_long.csv")

#### long list not in short list
species_list_compare<- subset(species_list_long, !(species_list_long$Species.name  %in% species_names_ais))
species_names_ais_compare = unique(species_list_compare$Species.name)
species_res_compare = list()

species_list_compare$wos<-"NA"

for(species_ in species_names_ais_compare) {
  
  
  species_res_compare[[species_]] = wos_search(sid=sid, query=paste0('TS=(', species_, " AND (invas* OR introduced OR non-native OR alien OR exotic)", ")"), editions = collections)
  species_list_compare[species_list_compare$Species.name== paste0(species_), ]$wos<-species_res_compare[[species_]]$results
  Sys.sleep(1)
}

species_list_compare$wos<-as.numeric(species_list_compare$wos)

write.csv(species_list_compare, file="Outputs/species_list_compare.csv")

###### species list long but cut
species_list_long_cut<-read.csv("C:Inputs//working_list_long_cut.csv")
head(species_list_long_cut)
species_list_long_cut$Species.name<-as.factor(species_list_long_cut$Species.name)
species_names_ais_long_cut = unique(species_list_long_cut$Species.name)
species_res_long_cut = list()

species_list_long_cut$wos<-"NA"

for(species_ in species_names_ais_long_cut) {
  
  
  species_res_long_cut[[species_]] = wos_search(sid=sid, query=paste0('TS=(', species_, " AND (invas* OR introduced OR non-native OR alien OR exotic)", ")"), editions = collections)
  species_list_long_cut[species_list_long_cut$Species.name== paste0(species_), ]$wos<-species_res_long_cut[[species_]]$results
  Sys.sleep(1)
}

species_list_long_cut$wos<-as.numeric(species_list_long_cut$wos)

write.csv(species_list_long_cut, file="Outputs/species_list_long_cut.csv")

