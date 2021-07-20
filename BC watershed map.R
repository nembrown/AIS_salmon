# loading libraries -------------------------------------------------------
library(CMISTR)
library(ggplot2)
library(tidyverse)
library(RColorBrewer)
library(patchwork)
library(ggpattern)
library(ggstance)

# For mapping
library(ncdf4)
library(reshape2)
library(dplyr)
library(ncdf4) # package for netcdf manipulation
library(raster) # package for raster manipulation
library(rgdal) # package for geospatial analysis
library(maptools)
library(sf)
library(raster)
library(spData)
library(tmap)    # for static and interactive maps
library(leaflet) # for interactive maps
library(maphead) # for interactive maps
library(shiny)
library(rgdal) # spatial/shp reading
library(viridis) # nice color palette
library(ggmap) # ggplot functionality for maps ---> dplyr, purr is dependency
library(ggsn) # for scale bars/north arrows in ggplots
library(maps)
library(mapdata)
library(sp)
library(rgeos)
library(ggsflabel)


wsa_sf<-sf::st_read("C:Inputs//WSA_PD_SVW_polygon.shp")

BC_watershed_plot<-ggplot(wsa_sf) + geom_sf(aes(fill=MJRDRNGNM))
ggsave(BC_watershed_plot, file="Plots/BC_watershed_plot.png", dpi=600)
