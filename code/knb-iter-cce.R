# Package ID: knb-lter-cce.262.2 Cataloging System:https://pasta.edirepository.org.
# Data set title: Index of visual monitoring, location, species behavior, and identification of cetaceans from CalCOFI cruises in the California Current System, 2005-2015 (ongoing)..
# Data set creator:    - CalCOFI - Scripps Institution of Oceanography 
# Data set creator:  John Hildebrand - Scripps Institution of Oceanography, UCSD 
# Metadata Provider:    - California Current Ecosystem LTER 
# Contact:    - CCE LTER Information Manager California Current Ecosystem LTER  - ccelter-im@ucsd.edu
# Stylesheet v2.14 for metadata conversion into program: John H. Porter, Univ. Virginia, jporter@virginia.edu      
# Uncomment the following lines to have R clear previous work, or set a working directory
# rm(list=ls())      

# setwd("C:/users/my_name/my_dir")       



options(HTTPUserAgent="EDI_CodeGen")
	      

inUrl1  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-cce/262/2/263df4303fc8e2f27499caefad0c6f25" 
infile1 <- tempfile()
try(download.file(inUrl1,infile1,method="curl",extra=paste0(' -A "',getOption("HTTPUserAgent"),'"')))
if (is.na(file.size(infile1))) download.file(inUrl1,infile1,method="auto")

                   
 dt1 <-read.csv(infile1,header=F 
          ,skip=1
            ,sep=","  
                ,quot='"' 
        , col.names=c(
                    "Event.Code",     
                    "Cruise",     
                    "Date..paren.local.paren.",     
                    "Time..paren.local.paren.",     
                    "Date.per.Time..paren.local.paren.",     
                    "GMT.Diff",     
                    "Date.per.Time..paren.GMT.paren.",     
                    "Latitude",     
                    "Longitude",     
                    "Decimal.Latitude",     
                    "Decimal.Longitude",     
                    "PortObs",     
                    "StbdObs",     
                    "Quality",     
                    "Visibility",     
                    "Precipitation",     
                    "Cloud..percent.",     
                    "Glare.Bearing..paren.left.paren.",     
                    "Glare.Bearing..paren.right.paren.",     
                    "Glare.Quality..paren.SL.per.M.per.SE.paren.",     
                    "Wind.Direction..paren.T.paren.",     
                    "Wind.Speed..paren.T.paren.",     
                    "Bft",     
                    "Swell",     
                    "Sighting.No.",     
                    "Init.Observer",     
                    "Cue",     
                    "Ship.Heading.Tru",     
                    "Sighting.Bearing.Tru",     
                    "Bino.reticle",     
                    "Distance",     
                    "Sighting.Method",     
                    "Envelope.Depth",     
                    "Envelope.Depth.2",     
                    "Envolope.Width",     
                    "Envelope.Width.2",     
                    "Best",     
                    "Min",     
                    "Max",     
                    "Calf",     
                    "Species.1",     
                    "Species.2",     
                    "sp.percent.1",     
                    "sp.percent.2",     
                    "Effort..paren.on.per.off.paren.",     
                    "Off.Effort.Code",     
                    "Transect..paren.on.per.off.paren.",     
                    "Off.Transect.Code",     
                    "Primary.Behavior",     
                    "Other.Behavior.1",     
                    "Other.Behavior.2",     
                    "Photos.Taken",     
                    "Photographer..paren.Cam.1.paren.",     
                    "Camera.1",     
                    "First.Frame.1",     
                    "Last.Frame.1",     
                    "Photographer..paren.Cam.2.paren.",     
                    "Camera.2",     
                    "First.Frame.2",     
                    "Last.Frame.2",     
                    "Comments"    ), check.names=TRUE)
               
unlink(infile1)
		    
# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings
                
if (class(dt1$Event.Code)!="factor") dt1$Event.Code<- as.factor(dt1$Event.Code)
if (class(dt1$Cruise)!="factor") dt1$Cruise<- as.factor(dt1$Cruise)                                   
# attempting to convert dt1$Date..paren.local.paren. dateTime string to R date structure (date or POSIXct)                                
tmpDateFormat<-"%Y-%m-%d"
tmp1Date..paren.local.paren.<-as.Date(dt1$Date..paren.local.paren.,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(nrow(dt1[dt1$Date..paren.local.paren. != "",]) == length(tmp1Date..paren.local.paren.[!is.na(tmp1Date..paren.local.paren.)])){dt1$Date..paren.local.paren. <- tmp1Date..paren.local.paren. } else {print("Date conversion failed for dt1$Date..paren.local.paren.. Please inspect the data and do the date conversion yourself.")}                                                                    
                                
if (class(dt1$Date.per.Time..paren.local.paren.)!="factor") dt1$Date.per.Time..paren.local.paren.<- as.factor(dt1$Date.per.Time..paren.local.paren.)
if (class(dt1$Date.per.Time..paren.GMT.paren.)!="factor") dt1$Date.per.Time..paren.GMT.paren.<- as.factor(dt1$Date.per.Time..paren.GMT.paren.)
if (class(dt1$Latitude)!="factor") dt1$Latitude<- as.factor(dt1$Latitude)
if (class(dt1$Longitude)!="factor") dt1$Longitude<- as.factor(dt1$Longitude)
if (class(dt1$Decimal.Latitude)=="factor") dt1$Decimal.Latitude <-as.numeric(levels(dt1$Decimal.Latitude))[as.integer(dt1$Decimal.Latitude) ]               
if (class(dt1$Decimal.Latitude)=="character") dt1$Decimal.Latitude <-as.numeric(dt1$Decimal.Latitude)
if (class(dt1$Decimal.Longitude)=="factor") dt1$Decimal.Longitude <-as.numeric(levels(dt1$Decimal.Longitude))[as.integer(dt1$Decimal.Longitude) ]               
if (class(dt1$Decimal.Longitude)=="character") dt1$Decimal.Longitude <-as.numeric(dt1$Decimal.Longitude)
if (class(dt1$PortObs)!="factor") dt1$PortObs<- as.factor(dt1$PortObs)
if (class(dt1$StbdObs)!="factor") dt1$StbdObs<- as.factor(dt1$StbdObs)
if (class(dt1$Quality)!="factor") dt1$Quality<- as.factor(dt1$Quality)
if (class(dt1$Visibility)=="factor") dt1$Visibility <-as.numeric(levels(dt1$Visibility))[as.integer(dt1$Visibility) ]               
if (class(dt1$Visibility)=="character") dt1$Visibility <-as.numeric(dt1$Visibility)
if (class(dt1$Precipitation)!="factor") dt1$Precipitation<- as.factor(dt1$Precipitation)
if (class(dt1$Cloud..percent.)=="factor") dt1$Cloud..percent. <-as.numeric(levels(dt1$Cloud..percent.))[as.integer(dt1$Cloud..percent.) ]               
if (class(dt1$Cloud..percent.)=="character") dt1$Cloud..percent. <-as.numeric(dt1$Cloud..percent.)
if (class(dt1$Glare.Bearing..paren.left.paren.)=="factor") dt1$Glare.Bearing..paren.left.paren. <-as.numeric(levels(dt1$Glare.Bearing..paren.left.paren.))[as.integer(dt1$Glare.Bearing..paren.left.paren.) ]               
if (class(dt1$Glare.Bearing..paren.left.paren.)=="character") dt1$Glare.Bearing..paren.left.paren. <-as.numeric(dt1$Glare.Bearing..paren.left.paren.)
if (class(dt1$Glare.Bearing..paren.right.paren.)=="factor") dt1$Glare.Bearing..paren.right.paren. <-as.numeric(levels(dt1$Glare.Bearing..paren.right.paren.))[as.integer(dt1$Glare.Bearing..paren.right.paren.) ]               
if (class(dt1$Glare.Bearing..paren.right.paren.)=="character") dt1$Glare.Bearing..paren.right.paren. <-as.numeric(dt1$Glare.Bearing..paren.right.paren.)
if (class(dt1$Glare.Quality..paren.SL.per.M.per.SE.paren.)!="factor") dt1$Glare.Quality..paren.SL.per.M.per.SE.paren.<- as.factor(dt1$Glare.Quality..paren.SL.per.M.per.SE.paren.)
if (class(dt1$Wind.Direction..paren.T.paren.)=="factor") dt1$Wind.Direction..paren.T.paren. <-as.numeric(levels(dt1$Wind.Direction..paren.T.paren.))[as.integer(dt1$Wind.Direction..paren.T.paren.) ]               
if (class(dt1$Wind.Direction..paren.T.paren.)=="character") dt1$Wind.Direction..paren.T.paren. <-as.numeric(dt1$Wind.Direction..paren.T.paren.)
if (class(dt1$Wind.Speed..paren.T.paren.)=="factor") dt1$Wind.Speed..paren.T.paren. <-as.numeric(levels(dt1$Wind.Speed..paren.T.paren.))[as.integer(dt1$Wind.Speed..paren.T.paren.) ]               
if (class(dt1$Wind.Speed..paren.T.paren.)=="character") dt1$Wind.Speed..paren.T.paren. <-as.numeric(dt1$Wind.Speed..paren.T.paren.)
if (class(dt1$Bft)!="factor") dt1$Bft<- as.factor(dt1$Bft)
if (class(dt1$Swell)=="factor") dt1$Swell <-as.numeric(levels(dt1$Swell))[as.integer(dt1$Swell) ]               
if (class(dt1$Swell)=="character") dt1$Swell <-as.numeric(dt1$Swell)
if (class(dt1$Sighting.No.)!="factor") dt1$Sighting.No.<- as.factor(dt1$Sighting.No.)
if (class(dt1$Init.Observer)!="factor") dt1$Init.Observer<- as.factor(dt1$Init.Observer)
if (class(dt1$Cue)!="factor") dt1$Cue<- as.factor(dt1$Cue)
if (class(dt1$Ship.Heading.Tru)=="factor") dt1$Ship.Heading.Tru <-as.numeric(levels(dt1$Ship.Heading.Tru))[as.integer(dt1$Ship.Heading.Tru) ]               
if (class(dt1$Ship.Heading.Tru)=="character") dt1$Ship.Heading.Tru <-as.numeric(dt1$Ship.Heading.Tru)
if (class(dt1$Sighting.Bearing.Tru)=="factor") dt1$Sighting.Bearing.Tru <-as.numeric(levels(dt1$Sighting.Bearing.Tru))[as.integer(dt1$Sighting.Bearing.Tru) ]               
if (class(dt1$Sighting.Bearing.Tru)=="character") dt1$Sighting.Bearing.Tru <-as.numeric(dt1$Sighting.Bearing.Tru)
if (class(dt1$Bino.reticle)!="factor") dt1$Bino.reticle<- as.factor(dt1$Bino.reticle)
if (class(dt1$Distance)=="factor") dt1$Distance <-as.numeric(levels(dt1$Distance))[as.integer(dt1$Distance) ]               
if (class(dt1$Distance)=="character") dt1$Distance <-as.numeric(dt1$Distance)
if (class(dt1$Sighting.Method)!="factor") dt1$Sighting.Method<- as.factor(dt1$Sighting.Method)
if (class(dt1$Envelope.Depth)!="factor") dt1$Envelope.Depth<- as.factor(dt1$Envelope.Depth)
if (class(dt1$Envelope.Depth.2)!="factor") dt1$Envelope.Depth.2<- as.factor(dt1$Envelope.Depth.2)
if (class(dt1$Envolope.Width)!="factor") dt1$Envolope.Width<- as.factor(dt1$Envolope.Width)
if (class(dt1$Envelope.Width.2)!="factor") dt1$Envelope.Width.2<- as.factor(dt1$Envelope.Width.2)
if (class(dt1$Best)=="factor") dt1$Best <-as.numeric(levels(dt1$Best))[as.integer(dt1$Best) ]               
if (class(dt1$Best)=="character") dt1$Best <-as.numeric(dt1$Best)
if (class(dt1$Min)=="factor") dt1$Min <-as.numeric(levels(dt1$Min))[as.integer(dt1$Min) ]               
if (class(dt1$Min)=="character") dt1$Min <-as.numeric(dt1$Min)
if (class(dt1$Max)=="factor") dt1$Max <-as.numeric(levels(dt1$Max))[as.integer(dt1$Max) ]               
if (class(dt1$Max)=="character") dt1$Max <-as.numeric(dt1$Max)
if (class(dt1$Calf)!="factor") dt1$Calf<- as.factor(dt1$Calf)
if (class(dt1$Species.1)!="factor") dt1$Species.1<- as.factor(dt1$Species.1)
if (class(dt1$Species.2)!="factor") dt1$Species.2<- as.factor(dt1$Species.2)
if (class(dt1$sp.percent.1)=="factor") dt1$sp.percent.1 <-as.numeric(levels(dt1$sp.percent.1))[as.integer(dt1$sp.percent.1) ]               
if (class(dt1$sp.percent.1)=="character") dt1$sp.percent.1 <-as.numeric(dt1$sp.percent.1)
if (class(dt1$sp.percent.2)=="factor") dt1$sp.percent.2 <-as.numeric(levels(dt1$sp.percent.2))[as.integer(dt1$sp.percent.2) ]               
if (class(dt1$sp.percent.2)=="character") dt1$sp.percent.2 <-as.numeric(dt1$sp.percent.2)
if (class(dt1$Effort..paren.on.per.off.paren.)!="factor") dt1$Effort..paren.on.per.off.paren.<- as.factor(dt1$Effort..paren.on.per.off.paren.)
if (class(dt1$Off.Effort.Code)!="factor") dt1$Off.Effort.Code<- as.factor(dt1$Off.Effort.Code)
if (class(dt1$Transect..paren.on.per.off.paren.)!="factor") dt1$Transect..paren.on.per.off.paren.<- as.factor(dt1$Transect..paren.on.per.off.paren.)
if (class(dt1$Off.Transect.Code)!="factor") dt1$Off.Transect.Code<- as.factor(dt1$Off.Transect.Code)
if (class(dt1$Primary.Behavior)!="factor") dt1$Primary.Behavior<- as.factor(dt1$Primary.Behavior)
if (class(dt1$Other.Behavior.1)!="factor") dt1$Other.Behavior.1<- as.factor(dt1$Other.Behavior.1)
if (class(dt1$Other.Behavior.2)!="factor") dt1$Other.Behavior.2<- as.factor(dt1$Other.Behavior.2)
if (class(dt1$Photos.Taken)!="factor") dt1$Photos.Taken<- as.factor(dt1$Photos.Taken)
if (class(dt1$Photographer..paren.Cam.1.paren.)!="factor") dt1$Photographer..paren.Cam.1.paren.<- as.factor(dt1$Photographer..paren.Cam.1.paren.)
if (class(dt1$Camera.1)!="factor") dt1$Camera.1<- as.factor(dt1$Camera.1)
if (class(dt1$First.Frame.1)!="factor") dt1$First.Frame.1<- as.factor(dt1$First.Frame.1)
if (class(dt1$Last.Frame.1)!="factor") dt1$Last.Frame.1<- as.factor(dt1$Last.Frame.1)
if (class(dt1$Photographer..paren.Cam.2.paren.)!="factor") dt1$Photographer..paren.Cam.2.paren.<- as.factor(dt1$Photographer..paren.Cam.2.paren.)
if (class(dt1$Camera.2)!="factor") dt1$Camera.2<- as.factor(dt1$Camera.2)
if (class(dt1$First.Frame.2)!="factor") dt1$First.Frame.2<- as.factor(dt1$First.Frame.2)
if (class(dt1$Last.Frame.2)!="factor") dt1$Last.Frame.2<- as.factor(dt1$Last.Frame.2)
if (class(dt1$Comments)!="factor") dt1$Comments<- as.factor(dt1$Comments)
                
# Convert Missing Values to NA for non-dates
                
dt1$Event.Code <- as.factor(ifelse((trimws(as.character(dt1$Event.Code))==trimws("NULL")),NA,as.character(dt1$Event.Code)))
dt1$Cruise <- as.factor(ifelse((trimws(as.character(dt1$Cruise))==trimws("NULL")),NA,as.character(dt1$Cruise)))
dt1$Date.per.Time..paren.local.paren. <- as.factor(ifelse((trimws(as.character(dt1$Date.per.Time..paren.local.paren.))==trimws("NULL")),NA,as.character(dt1$Date.per.Time..paren.local.paren.)))
dt1$Date.per.Time..paren.GMT.paren. <- as.factor(ifelse((trimws(as.character(dt1$Date.per.Time..paren.GMT.paren.))==trimws("NULL")),NA,as.character(dt1$Date.per.Time..paren.GMT.paren.)))
dt1$Latitude <- as.factor(ifelse((trimws(as.character(dt1$Latitude))==trimws("NULL")),NA,as.character(dt1$Latitude)))
dt1$Longitude <- as.factor(ifelse((trimws(as.character(dt1$Longitude))==trimws("NULL")),NA,as.character(dt1$Longitude)))
dt1$Decimal.Latitude <- ifelse((trimws(as.character(dt1$Decimal.Latitude))==trimws("NULL")),NA,dt1$Decimal.Latitude)               
suppressWarnings(dt1$Decimal.Latitude <- ifelse(!is.na(as.numeric("NULL")) & (trimws(as.character(dt1$Decimal.Latitude))==as.character(as.numeric("NULL"))),NA,dt1$Decimal.Latitude))
dt1$Decimal.Longitude <- ifelse((trimws(as.character(dt1$Decimal.Longitude))==trimws("NULL")),NA,dt1$Decimal.Longitude)               
suppressWarnings(dt1$Decimal.Longitude <- ifelse(!is.na(as.numeric("NULL")) & (trimws(as.character(dt1$Decimal.Longitude))==as.character(as.numeric("NULL"))),NA,dt1$Decimal.Longitude))
dt1$PortObs <- as.factor(ifelse((trimws(as.character(dt1$PortObs))==trimws("NULL")),NA,as.character(dt1$PortObs)))
dt1$StbdObs <- as.factor(ifelse((trimws(as.character(dt1$StbdObs))==trimws("NULL")),NA,as.character(dt1$StbdObs)))
dt1$Quality <- as.factor(ifelse((trimws(as.character(dt1$Quality))==trimws("NULL")),NA,as.character(dt1$Quality)))
dt1$Visibility <- ifelse((trimws(as.character(dt1$Visibility))==trimws("NULL")),NA,dt1$Visibility)               
suppressWarnings(dt1$Visibility <- ifelse(!is.na(as.numeric("NULL")) & (trimws(as.character(dt1$Visibility))==as.character(as.numeric("NULL"))),NA,dt1$Visibility))
dt1$Precipitation <- as.factor(ifelse((trimws(as.character(dt1$Precipitation))==trimws("NULL")),NA,as.character(dt1$Precipitation)))
dt1$Cloud..percent. <- ifelse((trimws(as.character(dt1$Cloud..percent.))==trimws("NULL")),NA,dt1$Cloud..percent.)               
suppressWarnings(dt1$Cloud..percent. <- ifelse(!is.na(as.numeric("NULL")) & (trimws(as.character(dt1$Cloud..percent.))==as.character(as.numeric("NULL"))),NA,dt1$Cloud..percent.))
dt1$Glare.Bearing..paren.left.paren. <- ifelse((trimws(as.character(dt1$Glare.Bearing..paren.left.paren.))==trimws("NULL")),NA,dt1$Glare.Bearing..paren.left.paren.)               
suppressWarnings(dt1$Glare.Bearing..paren.left.paren. <- ifelse(!is.na(as.numeric("NULL")) & (trimws(as.character(dt1$Glare.Bearing..paren.left.paren.))==as.character(as.numeric("NULL"))),NA,dt1$Glare.Bearing..paren.left.paren.))
dt1$Glare.Bearing..paren.right.paren. <- ifelse((trimws(as.character(dt1$Glare.Bearing..paren.right.paren.))==trimws("NULL")),NA,dt1$Glare.Bearing..paren.right.paren.)               
suppressWarnings(dt1$Glare.Bearing..paren.right.paren. <- ifelse(!is.na(as.numeric("NULL")) & (trimws(as.character(dt1$Glare.Bearing..paren.right.paren.))==as.character(as.numeric("NULL"))),NA,dt1$Glare.Bearing..paren.right.paren.))
dt1$Glare.Quality..paren.SL.per.M.per.SE.paren. <- as.factor(ifelse((trimws(as.character(dt1$Glare.Quality..paren.SL.per.M.per.SE.paren.))==trimws("NULL")),NA,as.character(dt1$Glare.Quality..paren.SL.per.M.per.SE.paren.)))
dt1$Wind.Direction..paren.T.paren. <- ifelse((trimws(as.character(dt1$Wind.Direction..paren.T.paren.))==trimws("NULL")),NA,dt1$Wind.Direction..paren.T.paren.)               
suppressWarnings(dt1$Wind.Direction..paren.T.paren. <- ifelse(!is.na(as.numeric("NULL")) & (trimws(as.character(dt1$Wind.Direction..paren.T.paren.))==as.character(as.numeric("NULL"))),NA,dt1$Wind.Direction..paren.T.paren.))
dt1$Wind.Speed..paren.T.paren. <- ifelse((trimws(as.character(dt1$Wind.Speed..paren.T.paren.))==trimws("NULL")),NA,dt1$Wind.Speed..paren.T.paren.)               
suppressWarnings(dt1$Wind.Speed..paren.T.paren. <- ifelse(!is.na(as.numeric("NULL")) & (trimws(as.character(dt1$Wind.Speed..paren.T.paren.))==as.character(as.numeric("NULL"))),NA,dt1$Wind.Speed..paren.T.paren.))
dt1$Bft <- as.factor(ifelse((trimws(as.character(dt1$Bft))==trimws("NULL")),NA,as.character(dt1$Bft)))
dt1$Swell <- ifelse((trimws(as.character(dt1$Swell))==trimws("NULL")),NA,dt1$Swell)               
suppressWarnings(dt1$Swell <- ifelse(!is.na(as.numeric("NULL")) & (trimws(as.character(dt1$Swell))==as.character(as.numeric("NULL"))),NA,dt1$Swell))
dt1$Sighting.No. <- as.factor(ifelse((trimws(as.character(dt1$Sighting.No.))==trimws("NULL")),NA,as.character(dt1$Sighting.No.)))
dt1$Init.Observer <- as.factor(ifelse((trimws(as.character(dt1$Init.Observer))==trimws("NULL")),NA,as.character(dt1$Init.Observer)))
dt1$Cue <- as.factor(ifelse((trimws(as.character(dt1$Cue))==trimws("NULL")),NA,as.character(dt1$Cue)))
dt1$Ship.Heading.Tru <- ifelse((trimws(as.character(dt1$Ship.Heading.Tru))==trimws("NULL")),NA,dt1$Ship.Heading.Tru)               
suppressWarnings(dt1$Ship.Heading.Tru <- ifelse(!is.na(as.numeric("NULL")) & (trimws(as.character(dt1$Ship.Heading.Tru))==as.character(as.numeric("NULL"))),NA,dt1$Ship.Heading.Tru))
dt1$Sighting.Bearing.Tru <- ifelse((trimws(as.character(dt1$Sighting.Bearing.Tru))==trimws("NULL")),NA,dt1$Sighting.Bearing.Tru)               
suppressWarnings(dt1$Sighting.Bearing.Tru <- ifelse(!is.na(as.numeric("NULL")) & (trimws(as.character(dt1$Sighting.Bearing.Tru))==as.character(as.numeric("NULL"))),NA,dt1$Sighting.Bearing.Tru))
dt1$Bino.reticle <- as.factor(ifelse((trimws(as.character(dt1$Bino.reticle))==trimws("NULL")),NA,as.character(dt1$Bino.reticle)))
dt1$Distance <- ifelse((trimws(as.character(dt1$Distance))==trimws("NULL")),NA,dt1$Distance)               
suppressWarnings(dt1$Distance <- ifelse(!is.na(as.numeric("NULL")) & (trimws(as.character(dt1$Distance))==as.character(as.numeric("NULL"))),NA,dt1$Distance))
dt1$Sighting.Method <- as.factor(ifelse((trimws(as.character(dt1$Sighting.Method))==trimws("NULL")),NA,as.character(dt1$Sighting.Method)))
dt1$Envelope.Depth <- as.factor(ifelse((trimws(as.character(dt1$Envelope.Depth))==trimws("NULL")),NA,as.character(dt1$Envelope.Depth)))
dt1$Envelope.Depth.2 <- as.factor(ifelse((trimws(as.character(dt1$Envelope.Depth.2))==trimws("NULL")),NA,as.character(dt1$Envelope.Depth.2)))
dt1$Envolope.Width <- as.factor(ifelse((trimws(as.character(dt1$Envolope.Width))==trimws("NULL")),NA,as.character(dt1$Envolope.Width)))
dt1$Envelope.Width.2 <- as.factor(ifelse((trimws(as.character(dt1$Envelope.Width.2))==trimws("NULL")),NA,as.character(dt1$Envelope.Width.2)))
dt1$Best <- ifelse((trimws(as.character(dt1$Best))==trimws("NULL")),NA,dt1$Best)               
suppressWarnings(dt1$Best <- ifelse(!is.na(as.numeric("NULL")) & (trimws(as.character(dt1$Best))==as.character(as.numeric("NULL"))),NA,dt1$Best))
dt1$Min <- ifelse((trimws(as.character(dt1$Min))==trimws("NULL")),NA,dt1$Min)               
suppressWarnings(dt1$Min <- ifelse(!is.na(as.numeric("NULL")) & (trimws(as.character(dt1$Min))==as.character(as.numeric("NULL"))),NA,dt1$Min))
dt1$Max <- ifelse((trimws(as.character(dt1$Max))==trimws("NULL")),NA,dt1$Max)               
suppressWarnings(dt1$Max <- ifelse(!is.na(as.numeric("NULL")) & (trimws(as.character(dt1$Max))==as.character(as.numeric("NULL"))),NA,dt1$Max))
dt1$Calf <- as.factor(ifelse((trimws(as.character(dt1$Calf))==trimws("NULL")),NA,as.character(dt1$Calf)))
dt1$Species.1 <- as.factor(ifelse((trimws(as.character(dt1$Species.1))==trimws("NULL")),NA,as.character(dt1$Species.1)))
dt1$Species.2 <- as.factor(ifelse((trimws(as.character(dt1$Species.2))==trimws("NULL")),NA,as.character(dt1$Species.2)))
dt1$sp.percent.1 <- ifelse((trimws(as.character(dt1$sp.percent.1))==trimws("NULL")),NA,dt1$sp.percent.1)               
suppressWarnings(dt1$sp.percent.1 <- ifelse(!is.na(as.numeric("NULL")) & (trimws(as.character(dt1$sp.percent.1))==as.character(as.numeric("NULL"))),NA,dt1$sp.percent.1))
dt1$sp.percent.2 <- ifelse((trimws(as.character(dt1$sp.percent.2))==trimws("NULL")),NA,dt1$sp.percent.2)               
suppressWarnings(dt1$sp.percent.2 <- ifelse(!is.na(as.numeric("NULL")) & (trimws(as.character(dt1$sp.percent.2))==as.character(as.numeric("NULL"))),NA,dt1$sp.percent.2))
dt1$Effort..paren.on.per.off.paren. <- as.factor(ifelse((trimws(as.character(dt1$Effort..paren.on.per.off.paren.))==trimws("NULL")),NA,as.character(dt1$Effort..paren.on.per.off.paren.)))
dt1$Off.Effort.Code <- as.factor(ifelse((trimws(as.character(dt1$Off.Effort.Code))==trimws("NULL")),NA,as.character(dt1$Off.Effort.Code)))
dt1$Transect..paren.on.per.off.paren. <- as.factor(ifelse((trimws(as.character(dt1$Transect..paren.on.per.off.paren.))==trimws("NULL")),NA,as.character(dt1$Transect..paren.on.per.off.paren.)))
dt1$Off.Transect.Code <- as.factor(ifelse((trimws(as.character(dt1$Off.Transect.Code))==trimws("NULL")),NA,as.character(dt1$Off.Transect.Code)))
dt1$Primary.Behavior <- as.factor(ifelse((trimws(as.character(dt1$Primary.Behavior))==trimws("NULL")),NA,as.character(dt1$Primary.Behavior)))
dt1$Other.Behavior.1 <- as.factor(ifelse((trimws(as.character(dt1$Other.Behavior.1))==trimws("NULL")),NA,as.character(dt1$Other.Behavior.1)))
dt1$Other.Behavior.2 <- as.factor(ifelse((trimws(as.character(dt1$Other.Behavior.2))==trimws("NULL")),NA,as.character(dt1$Other.Behavior.2)))
dt1$Photos.Taken <- as.factor(ifelse((trimws(as.character(dt1$Photos.Taken))==trimws("NULL")),NA,as.character(dt1$Photos.Taken)))
dt1$Photographer..paren.Cam.1.paren. <- as.factor(ifelse((trimws(as.character(dt1$Photographer..paren.Cam.1.paren.))==trimws("NULL")),NA,as.character(dt1$Photographer..paren.Cam.1.paren.)))
dt1$Camera.1 <- as.factor(ifelse((trimws(as.character(dt1$Camera.1))==trimws("NULL")),NA,as.character(dt1$Camera.1)))
dt1$First.Frame.1 <- as.factor(ifelse((trimws(as.character(dt1$First.Frame.1))==trimws("NULL")),NA,as.character(dt1$First.Frame.1)))
dt1$Last.Frame.1 <- as.factor(ifelse((trimws(as.character(dt1$Last.Frame.1))==trimws("NULL")),NA,as.character(dt1$Last.Frame.1)))
dt1$Photographer..paren.Cam.2.paren. <- as.factor(ifelse((trimws(as.character(dt1$Photographer..paren.Cam.2.paren.))==trimws("NULL")),NA,as.character(dt1$Photographer..paren.Cam.2.paren.)))
dt1$Camera.2 <- as.factor(ifelse((trimws(as.character(dt1$Camera.2))==trimws("NULL")),NA,as.character(dt1$Camera.2)))
dt1$First.Frame.2 <- as.factor(ifelse((trimws(as.character(dt1$First.Frame.2))==trimws("NULL")),NA,as.character(dt1$First.Frame.2)))
dt1$Last.Frame.2 <- as.factor(ifelse((trimws(as.character(dt1$Last.Frame.2))==trimws("NULL")),NA,as.character(dt1$Last.Frame.2)))
dt1$Comments <- as.factor(ifelse((trimws(as.character(dt1$Comments))==trimws("NULL")),NA,as.character(dt1$Comments)))


# Here is the structure of the input data frame:
str(dt1)                            
attach(dt1)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(Event.Code)
summary(Cruise)
summary(Date..paren.local.paren.)
summary(Time..paren.local.paren.)
summary(Date.per.Time..paren.local.paren.)
summary(GMT.Diff)
summary(Date.per.Time..paren.GMT.paren.)
summary(Latitude)
summary(Longitude)
summary(Decimal.Latitude)
summary(Decimal.Longitude)
summary(PortObs)
summary(StbdObs)
summary(Quality)
summary(Visibility)
summary(Precipitation)
summary(Cloud..percent.)
summary(Glare.Bearing..paren.left.paren.)
summary(Glare.Bearing..paren.right.paren.)
summary(Glare.Quality..paren.SL.per.M.per.SE.paren.)
summary(Wind.Direction..paren.T.paren.)
summary(Wind.Speed..paren.T.paren.)
summary(Bft)
summary(Swell)
summary(Sighting.No.)
summary(Init.Observer)
summary(Cue)
summary(Ship.Heading.Tru)
summary(Sighting.Bearing.Tru)
summary(Bino.reticle)
summary(Distance)
summary(Sighting.Method)
summary(Envelope.Depth)
summary(Envelope.Depth.2)
summary(Envolope.Width)
summary(Envelope.Width.2)
summary(Best)
summary(Min)
summary(Max)
summary(Calf)
summary(Species.1)
summary(Species.2)
summary(sp.percent.1)
summary(sp.percent.2)
summary(Effort..paren.on.per.off.paren.)
summary(Off.Effort.Code)
summary(Transect..paren.on.per.off.paren.)
summary(Off.Transect.Code)
summary(Primary.Behavior)
summary(Other.Behavior.1)
summary(Other.Behavior.2)
summary(Photos.Taken)
summary(Photographer..paren.Cam.1.paren.)
summary(Camera.1)
summary(First.Frame.1)
summary(Last.Frame.1)
summary(Photographer..paren.Cam.2.paren.)
summary(Camera.2)
summary(First.Frame.2)
summary(Last.Frame.2)
summary(Comments) 
                # Get more details on character variables
                 
summary(as.factor(dt1$Event.Code)) 
summary(as.factor(dt1$Cruise)) 
summary(as.factor(dt1$Date.per.Time..paren.local.paren.)) 
summary(as.factor(dt1$Date.per.Time..paren.GMT.paren.)) 
summary(as.factor(dt1$Latitude)) 
summary(as.factor(dt1$Longitude)) 
summary(as.factor(dt1$PortObs)) 
summary(as.factor(dt1$StbdObs)) 
summary(as.factor(dt1$Quality)) 
summary(as.factor(dt1$Precipitation)) 
summary(as.factor(dt1$Glare.Quality..paren.SL.per.M.per.SE.paren.)) 
summary(as.factor(dt1$Bft)) 
summary(as.factor(dt1$Sighting.No.)) 
summary(as.factor(dt1$Init.Observer)) 
summary(as.factor(dt1$Cue)) 
summary(as.factor(dt1$Bino.reticle)) 
summary(as.factor(dt1$Sighting.Method)) 
summary(as.factor(dt1$Envelope.Depth)) 
summary(as.factor(dt1$Envelope.Depth.2)) 
summary(as.factor(dt1$Envolope.Width)) 
summary(as.factor(dt1$Envelope.Width.2)) 
summary(as.factor(dt1$Calf)) 
summary(as.factor(dt1$Species.1)) 
summary(as.factor(dt1$Species.2)) 
summary(as.factor(dt1$Effort..paren.on.per.off.paren.)) 
summary(as.factor(dt1$Off.Effort.Code)) 
summary(as.factor(dt1$Transect..paren.on.per.off.paren.)) 
summary(as.factor(dt1$Off.Transect.Code)) 
summary(as.factor(dt1$Primary.Behavior)) 
summary(as.factor(dt1$Other.Behavior.1)) 
summary(as.factor(dt1$Other.Behavior.2)) 
summary(as.factor(dt1$Photos.Taken)) 
summary(as.factor(dt1$Photographer..paren.Cam.1.paren.)) 
summary(as.factor(dt1$Camera.1)) 
summary(as.factor(dt1$First.Frame.1)) 
summary(as.factor(dt1$Last.Frame.1)) 
summary(as.factor(dt1$Photographer..paren.Cam.2.paren.)) 
summary(as.factor(dt1$Camera.2)) 
summary(as.factor(dt1$First.Frame.2)) 
summary(as.factor(dt1$Last.Frame.2)) 
summary(as.factor(dt1$Comments))
detach(dt1)               
