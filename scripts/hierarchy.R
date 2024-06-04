### START 26.02.2021 ----
library(dplyr)
library(tidyverse)
library(ggplot2)
library(gplots)

rm(list=ls())
setwd("C:/Users/zas/OneDrive/PSIMS/2021-ideophones-hierarchy/")
# data = read_csv('rdata_empfindung_2021-02-26_15-08.csv', col_names = TRUE, na = "NA")
# data = read_delim('data_empfindung_2021-02-26_14-39.txt', delim = ';', col_names = TRUE, na = "NA")
# values = read_delim('values_empfindung_2021-02-26_14-39.txt', delim = ';', col_names = TRUE, na = "NA")

### Read data ----
data <- read.table(
  'rdata_empfindung_2021-02-26_15-08.csv',
  sep="\t", header=TRUE, encoding = "UTF-8")

str(data)

### Clean data ----
## Remove unnecessary columns
data <- select(data, -c(SERIAL,REF,QUESTNNR,MODE,STARTED,WK02,WK02_01,ZF01_CP,ZF01x01,ZF01x02,ZF01x03,ZF01x04, 
                        ZF01x05,ZF01x06,ZF01x07,ZF01x08,ZF01x09,ZF01x10,ZF01x11,ZF01x12,ZF01x13,ZF01x14,ZF01x15,
                        ZF01x16,ZF01x17,ZF01x18,ZF01x19,ZF01x20,ZF01x21,ZF01x22,ZF01x23,ZF01x24,ZF01x25,ZF01x26,
                        ZF01x27,ZF01x28,ZF01x29,ZF01x30,ZF01x31,ZF01x32,ZF01x33,ZF01x34,ZF01x35,ZF01x36,ZF01x37,
                        ZF01x38,ZF01x39,ZF01x40,ZF01x41,ZF01x42,ZF01x43,ZF01x44,ZF01x45,ZF01x46,ZF01x47,ZF01x48,
                        ZF01x49,ZF01x50,ZF01x51,ZF01x52,ZF01x53,ZF01x54,ZF01x55,ZF01x56,ZF01x57,ZF01x58,ZF01x59,
                        ZF01x60,ZF01x61,ZF01x62,ZF01x63,ZF01x64,ZF01x65,ZF01x66,ZF01x67,ZF01x68,ZF01x69,ZF01x70,
                        ZF01x71,ZF01x72,ZF01x73,ZF01x74,ZF01x75,ZF01x76,ZF01x77,ZF01x78,ZF01x79,ZF01x80,ZF01x81,
                        ZF01x82,ZF01x83,ZF01x84,ZF01x85,TIME001,TIME002,TIME003,TIME004,TIME005,TIME006,TIME007,
                        TIME008,TIME009,TIME010,TIME011,TIME012,TIME013,TIME014,TIME015,TIME016,TIME017,TIME018,
                        TIME019,TIME020,TIME021,TIME022,TIME023,TIME024,TIME025,TIME026,TIME027,TIME028,TIME029,
                        TIME030,TIME031,TIME032,TIME033,TIME034,TIME035,TIME036,TIME037,TIME038,TIME039,TIME040,
                        TIME041,TIME042,TIME043,TIME044,TIME045,TIME046,TIME047,TIME048,TIME049,TIME050,TIME051,
                        TIME052,TIME053,TIME054,TIME055,TIME056,TIME057,TIME058,TIME059,TIME060,TIME061,TIME062,
                        TIME063,TIME064,TIME065,TIME066,TIME067,TIME068,TIME069,TIME070,TIME071,TIME072,TIME073,
                        TIME074,TIME075,TIME076,TIME077,TIME078,TIME079,TIME080,TIME081,TIME082,TIME083,TIME084,
                        TIME085,TIME086,TIME087,TIME088,MAILSENT,LASTDATA,Q_VIEWER,LASTPAGE,MISSING,MISSREL,
                        TIME_RSI,DEG_TIME))

## Rename variables (cf. stimuli.xlsx)
data <- rename(data,
               age = SD01_01,
               L1 = SD02_01,
               gender = SD03,
               oh = EX01,
               ach = EX02,
               hmm = EX03,
               oje = EX04,
               pst = EX05,
               aha = EX06,
               puh = EX07,
               naja = EX08,
               nanu = EX09,
               hurra = EX10,
               platsch = EX11,
               aua = EX12,
               ups = EX13,
               auweia = EX14,
               huhu = EX15,
               bäh = EX16,
               hoppla = EX17,
               igitt = EX18,
               zickzack = EX19,
               husch = EX20,
               pfui = EX21,
               kuckuck = EX22,
               ratsch = EX23,
               bums = EX24,
               dingdong = EX25,
               hicks = EX26,
               potzblitz = EX27,
               schwups = EX28,
               papperlapapp = EX29,
               ruck_zuck = EX30,
               holterdiepolter = EX31,
               klackerdiklack = EX32,
               krimskrams = EX33,
               kuddelmuddel = EX34,
               mischmasch = EX35,
               pardauz = EX36,
               schickimicki = EX37,
               flugs = EX38,
               plem_plem = EX39,
               ratz_fatz = EX40,
               rambazamba = EX41,
               hä = EX42,
               remmidemmi = EX43,
               wirrwarr = EX44,
               hallodri = EX45,
               ballaballa = EX46,
               dallidalli = EX47,
               rickeracke = EX48,
               singsang = EX49,
               tohuwabohu = EX50,
               rabatz = EX51,
               flutsch = EX52,
               kracks = EX53,
               wumms = EX54,
               tatütata = EX55,
               klatsch = EX56,
               knurr = EX57,
               schnipp_schnapp = EX58,
               flapp = EX59,
               puff = EX60,
               quack = EX61,
               rülps = EX62,
               hauruck = EX63,
               brumm = EX64,
               wusch = EX65,
               plums = EX66,
               plopp = EX67,
               pah = EX68,
               hui = EX69,
               krächz = EX70,
               dreieck = KO01,
               rot = KO02,
               stinkt = KO03,
               joggen = KO04,
               laut = KO05,
               leise = KO06,
               schleimig = KO07,
               liebe = KO08,
               kariert = KO09,
               salzig = KO10,
               rau = KO11,
               krank = KO12,
               kriechen = KO13,
               fruchtig = KO14,
               bunt = KO15,
               oh_open = EX01_07,
               ach_open = EX02_07,
               hmm_open = EX03_07,
               oje_open = EX04_07,
               pst_open = EX05_07,
               aha_open = EX06_07,
               puh_open = EX07_07,
               naja_open = EX08_07,
               nanu_open = EX09_07,
               hurra_open = EX10_07,
               platsch_open = EX11_07,
               aua_open = EX12_07,
               ups_open = EX13_07,
               auweia_open = EX14_07,
               huhu_open = EX15_07,
               bäh_open = EX16_07,
               hoppla_open = EX17_07,
               igitt_open = EX18_07,
               husch_open = EX20_07,
               pfui_open = EX21_07,
               kuckuck_open = EX22_07,
               ratsch_open = EX23_07,
               hicks_open = EX26_07,
               potzblitz_open = EX27_07,
               schwups_open = EX28_07,
               papperlapapp_open = EX29_07,
               ruck_zuck_open = EX30_07,
               holterdiepolter_open = EX31_07,
               klackerdiklack_open = EX32_07,
               krimskrams_open = EX33_07,
               kuddelmuddel_open = EX34_07,
               mischmasch_open = EX35_07,
               pardauz_open = EX36_07,
               schickimicki_open = EX37_07,
               flugs_open = EX38_07,
               plem_plem_open = EX39_07,
               ratz_fatz_open = EX40_07,
               rambazamba_open = EX41_07,
               hä_open = EX42_07,
               remmidemmi_open = EX43_07,
               wirrwarr_open = EX44_07,
               hallodri_open = EX45_07,
               ballaballa_open = EX46_07,
               dallidalli_open = EX47_07,
               rickeracke_open = EX48_07,
               singsang_open = EX49_07,
               tohuwabohu_open = EX50_07,
               rabatz_open = EX51_07,
               kracks_open = EX53_07,
               wumms_open = EX54_07,
               tatütata_open = EX55_07,
               klatsch_open = EX56_07,
               knurr_open = EX57_07,
               schnipp_schnapp_open = EX58_07,
               flapp_open = EX59_07,
               puff_open = EX60_07,
               quack_open = EX61_07,
               hauruck_open = EX63_07,
               wusch_open = EX65_07,
               plopp_open = EX67_07,
               pah_open = EX68_07,
               hui_open = EX69_07,
               dreieck_open = KO01_07,
               rot_open = KO02_07,
               stinkt_open = KO03_07,
               joggen_open = KO04_07,
               laut_open = KO05_07,
               leise_open = KO06_07,
               schleimig_open = KO07_07,
               salzig_open = KO10_07,
               kriechen_open = KO13_07,
               fruchtig_open = KO14_07,
)

str(data)

## Remove incomplete cases
table(data$FINISHED)
table(data$MAXPAGE)
# I will proceed only with finished cases
data <- data[(data$FINISHED==TRUE),]

## Check the native language
table(data$L1)
# remove the Turkish speaker
data <- data[!(data$L1=="Türkisch"),]

data$L1[data$L1=='Deutsch '] <- 'Deutsch'
data$L1[data$L1=='deutsch '] <- 'Deutsch'
data$L1[data$L1=='deutsch'] <- 'Deutsch'
data$L1[data$L1=='Deitsch'] <- 'Deutsch'
unique(data$L1)

## Check the genders
table(data$gender) # nice! almost equal
data$gender[data$gender==1] <- 'female'
data$gender[data$gender==2] <- 'male'

## Check age
data %>% 
  summarize_at(vars(age), list(mean = mean, sd = sd))

## Create data frame with codes for ideophone categories
codes <- tibble(
  x = 1:7,
  y = c("sound", "movement", "visual", "feeling_state", "texture", "form", "other")
)
codes

## Or maybe replace responses with text
data[data==1] <- "sound"
data[data==2] <- "movement"
data[data==3] <- "visual"
data[data==4] <- "feeling_state"
data[data==5] <- "texture"
data[data==6] <- "form"
data[data==7] <- "other"


### Control examination ----
## Overall choice preference
table(data$dreieck) # form
table(data$rot) # visual
table(data$stinkt) # feeling_state / other
table(data$joggen) # movement
table(data$laut) # sound
table(data$leise) # sound
table(data$schleimig) # texture
table(data$liebe) # movement
table(data$kariert) # feeling_state
table(data$salzig) # other
table(data$rau) # texture
table(data$krank) # feeling_state
table(data$kriechen) # movement
table(data$fruchtig) # other
table(data$bunt) # visual

## What was answered as 'other'?
data$dreieck_open # nothing was written
data$rot_open # 7 times 'farbe', so color = something visual
data$stinkt_open # most say it's 'geruch' = smell
data$joggen_open # one person said 'sport' = movement
data$laut_open # one said 'Geräusch' = sound
data$leise_open # one said 'Geräusch' = sound
data$schleimig_open # 'Jemand verhält sich schleimig'
data$salzig_open # 'Geschmack' = taste
data$kriechen_open # nothing was written
data$fruchtig_open # 'Geschmack' = taste

### Data examination ----
#### Category evaluation ----
## Create new data frame to work with easier
resp <- data %>% 
  select(oh, ach, hmm, oje, pst, aha, puh, naja, nanu, hurra, platsch, aua, ups, auweia, huhu, bäh, 
         hoppla, igitt, zickzack, husch, pfui, kuckuck, ratsch, bums, dingdong, hicks, potzblitz, 
         schwups, papperlapapp, ruck_zuck, holterdiepolter, klackerdiklack, krimskrams, kuddelmuddel, 
         mischmasch, pardauz, schickimicki, flugs, plem_plem, ratz_fatz, rambazamba, hä, remmidemmi, 
         wirrwarr, hallodri, ballaballa, dallidalli, rickeracke, singsang, tohuwabohu, rabatz, flutsch, 
         kracks, wumms, tatütata, klatsch, knurr, schnipp_schnapp, flapp, puff, quack, rülps, hauruck, 
         brumm, wusch, plums, plopp, pah, hui, krächz)
resp

## Sum the categories in each column
counts <- resp %>%
  gather(measure, value) %>%
  count(measure, value) %>%
  spread(measure, n)

## convert the data as a table
dt <- as.table(as.matrix(counts))
## Graph
balloonplot(t(dt), main ="ideophones", xlab ="", ylab="",
            label = FALSE, show.margins = FALSE)
## Doesn't display that much though

chisq.test(table(resp$schnipp_schnapp))
## The chi square test is also not valid, because even if two of the seven groups are similar, 
## 5 are still very different

ggplot(counts, aes(y=ach, x=value)) +
  geom_bar(stat="identity")
## So we can use this as a method to identify which category was chosen

## Create a list of all ideophones from the test
ideo <- colnames(resp)
ideo

## and check every ideophone from the list one by one
### oh: feeling
ggplot(counts, aes(y=oh, x=value)) +
  geom_bar(stat="identity")
counts$oh

### ach: feeling
ggplot(counts, aes(y=ach, x=value)) +
  geom_bar(stat="identity")
counts$ach

### hmm: feeling
ggplot(counts, aes(y=hmm, x=value)) +
  geom_bar(stat="identity")
counts$hmm

### oje: feeling
ggplot(counts, aes(y=oje, x=value)) +
  geom_bar(stat="identity")
counts$oje

### pst: sound
ggplot(counts, aes(y=pst, x=value)) +
  geom_bar(stat="identity")
counts$pst

### aha: feeling
ggplot(counts, aes(y=aha, x=value)) +
  geom_bar(stat="identity")
counts$aha

### puh: feeling
ggplot(counts, aes(y=puh, x=value)) +
  geom_bar(stat="identity")
counts$puh

### naja: feeling
ggplot(counts, aes(y=naja, x=value)) +
  geom_bar(stat="identity")
counts$naja

### nanu: feeling
ggplot(counts, aes(y=nanu, x=value)) +
  geom_bar(stat="identity")
counts$nanu

### hurra: feeling
ggplot(counts, aes(y=hurra, x=value)) +
  geom_bar(stat="identity")
counts$hurra

### platsch: sound
ggplot(counts, aes(y=platsch, x=value)) +
  geom_bar(stat="identity")
counts$platsch

### aua: feeling
ggplot(counts, aes(y=aua, x=value)) +
  geom_bar(stat="identity")
counts$aua

### ups: sound
ggplot(counts, aes(y=ups, x=value)) +
  geom_bar(stat="identity")
counts$ups

### auweia: feeling
ggplot(counts, aes(y=auweia, x=value)) +
  geom_bar(stat="identity")
counts$auweia

### huhu: sound
ggplot(counts, aes(y=huhu, x=value)) +
  geom_bar(stat="identity")
counts$huhu

### bäh: feeling
ggplot(counts, aes(y=bäh, x=value)) +
  geom_bar(stat="identity")
counts$bäh

### hoppla: feeling 57 / movement 37
ggplot(counts, aes(y=hoppla, x=value)) +
  geom_bar(stat="identity")
counts$hoppla
## look what people wrote in other
data$hoppla_open
## how many percent is feeling
57*100/121
## and movement
37*100/121
## the difference is ~17%, ergo I proceed with feeling

### igitt: feeling
ggplot(counts, aes(y=igitt, x=value)) +
  geom_bar(stat="identity")
counts$igitt

### zickzack: movement 48 / form 31 / visual 23 / texture 17
ggplot(counts, aes(y=zickzack, x=value)) +
  geom_bar(stat="identity")
counts$zickzack
## how many percent is movement
48*100/121
## and form
31*100/121
## the difference is ~14%, ergo I proceed with movement

### husch: movement
ggplot(counts, aes(y=husch, x=value)) +
  geom_bar(stat="identity")
counts$husch

### pfui: feeling
ggplot(counts, aes(y=pfui, x=value)) +
  geom_bar(stat="identity")
counts$pfui

### kuckuck: sound
ggplot(counts, aes(y=kuckuck, x=value)) +
  geom_bar(stat="identity")
counts$kuckuck

### ratsch: sound
ggplot(counts, aes(y=ratsch, x=value)) +
  geom_bar(stat="identity")
counts$ratsch

### bums: sound
ggplot(counts, aes(y=bums, x=value)) +
  geom_bar(stat="identity")
counts$bums

### dingdong: sound
ggplot(counts, aes(y=dingdong, x=value)) +
  geom_bar(stat="identity")
counts$dingdong

### hicks: sound
ggplot(counts, aes(y=hicks, x=value)) +
  geom_bar(stat="identity")
counts$hicks

### potzblitz: feeling
ggplot(counts, aes(y=potzblitz, x=value)) +
  geom_bar(stat="identity")
counts$potzblitz

### schwups: movement
ggplot(counts, aes(y=schwups, x=value)) +
  geom_bar(stat="identity")
counts$schwups

### papperlapapp: feeling
ggplot(counts, aes(y=papperlapapp, x=value)) +
  geom_bar(stat="identity")
counts$papperlapapp

### ruck_zuck: movement
ggplot(counts, aes(y=ruck_zuck, x=value)) +
  geom_bar(stat="identity")
counts$ruck_zuck

### holterdiepolter: movement 49 / sound 48
ggplot(counts, aes(y=holterdiepolter, x=value)) +
  geom_bar(stat="identity")
counts$holterdiepolter
## look what people wrote in other
data$holterdiepolter_open
## how many percent is movement
49*100/121
## and form
48*100/121
## the difference is >1%, ergo both categories apply

### klackerdiklack: sound
ggplot(counts, aes(y=klackerdiklack, x=value)) +
  geom_bar(stat="identity")
counts$klackerdiklack

### krimskrams: visual
ggplot(counts, aes(y=krimskrams, x=value)) +
  geom_bar(stat="identity")
counts$krimskrams

### kuddelmuddel: feeling 50 / visual 33
ggplot(counts, aes(y=kuddelmuddel, x=value)) +
  geom_bar(stat="identity")
counts$kuddelmuddel
## look what people wrote in other
data$kuddelmuddel_open
## how many percent is feeling
50*100/121
## and visual
33*100/121
## the difference is 14%, ergo feeling

### mischmasch: visual 45 / texture 25 / feeling 23 / form 18
ggplot(counts, aes(y=mischmasch, x=value)) +
  geom_bar(stat="identity")
counts$mischmasch
## look what people wrote in other
data$mischmasch_open
## how many percent is visual
45*100/121
## and texture
25*100/121
## and feeling
23*100/121
## the difference is 17%, ergo visual; texture and feeling are both equal

### pardauz: sound 40 / feeling 29 / movement 18
ggplot(counts, aes(y=pardauz, x=value)) +
  geom_bar(stat="identity")
counts$pardauz
## look what people wrote in other
data$pardauz_open
## how many percent is sound
40*100/121
## and feeling
29*100/121
## the difference is 10%, ergo sound

### schickimicki: visual
ggplot(counts, aes(y=schickimicki, x=value)) +
  geom_bar(stat="identity")
counts$schickimicki

### flugs: movement
ggplot(counts, aes(y=flugs, x=value)) +
  geom_bar(stat="identity")
counts$flugs

### plem_plem: feeling
ggplot(counts, aes(y=plem_plem, x=value)) +
  geom_bar(stat="identity")
counts$plem_plem

### ratz_fatz: movement
ggplot(counts, aes(y=ratz_fatz, x=value)) +
  geom_bar(stat="identity")
counts$ratz_fatz

### rambazamba: feeling 39 / sound 31 / movement 29 / visual 14
ggplot(counts, aes(y=rambazamba, x=value)) +
  geom_bar(stat="identity")
counts$rambazamba
## look what people wrote in other
data$rambazamba_open
## how many percent is feeling
39*100/121
## and sound
31*100/121
## and movement
29*100/121
## the difference is almost 7%, ergo feeling; sound and movement are both equal

### hä: feeling
ggplot(counts, aes(y=hä, x=value)) +
  geom_bar(stat="identity")
counts$hä

### remmidemmi: sound 49 / feeling 33 / movement 22
ggplot(counts, aes(y=remmidemmi, x=value)) +
  geom_bar(stat="identity")
counts$remmidemmi
## look what people wrote in other
data$remmidemmi_open
## how many percent is sound
49*100/121
## and feeling
33*100/121
## the difference is 13%, ergo sound

### wirrwarr: feeling 55 / visual 31
ggplot(counts, aes(y=wirrwarr, x=value)) +
  geom_bar(stat="identity")
counts$wirrwarr
## look what people wrote in other
data$wirrwarr_open
## how many percent is feeling
55*100/121
## and visual
31*100/121
## the difference is 20%, ergo feeling

### hallodri: feeling 56 / visual 30
ggplot(counts, aes(y=hallodri, x=value)) +
  geom_bar(stat="identity")
counts$hallodri
## look what people wrote in other
data$hallodri_open
## how many percent is feeling
56*100/121
## and visual
30*100/121
## the difference is 21%, ergo feeling

### ballaballa: feeling
ggplot(counts, aes(y=ballaballa, x=value)) +
  geom_bar(stat="identity")
counts$ballaballa

### dallidalli: movement
ggplot(counts, aes(y=dallidalli, x=value)) +
  geom_bar(stat="identity")
counts$dallidalli

### rickeracke: sound 54 / movement 31
ggplot(counts, aes(y=rickeracke, x=value)) +
  geom_bar(stat="identity")
counts$rickeracke
## look what people wrote in other
data$rickeracke_open
## how many percent is sound
54*100/121
## and movement
31*100/121
## the difference is 19%, ergo sound

### singsang: sound
ggplot(counts, aes(y=singsang, x=value)) +
  geom_bar(stat="identity")
counts$singsang

### tohuwabohu: feeling 57 / visual 27
ggplot(counts, aes(y=tohuwabohu, x=value)) +
  geom_bar(stat="identity")
counts$tohuwabohu
## look what people wrote in other
data$tohuwabohu_open
## how many percent is feeling
57*100/121
## and visual
27*100/121
## the difference is 25%, ergo feeling

### rabatz: sound 
ggplot(counts, aes(y=rabatz, x=value)) +
  geom_bar(stat="identity")
counts$rabatz

### flutsch: movement
ggplot(counts, aes(y=flutsch, x=value)) +
  geom_bar(stat="identity")
counts$flutsch

### kracks: sound
ggplot(counts, aes(y=kracks, x=value)) +
  geom_bar(stat="identity")
counts$kracks

### wumms: sound
ggplot(counts, aes(y=wumms, x=value)) +
  geom_bar(stat="identity")
counts$wumms

### tatütata: sound
ggplot(counts, aes(y=tatütata, x=value)) +
  geom_bar(stat="identity")
counts$tatütata

### klatsch: sound
ggplot(counts, aes(y=klatsch, x=value)) +
  geom_bar(stat="identity")
counts$klatsch

### knurr: sound
ggplot(counts, aes(y=knurr, x=value)) +
  geom_bar(stat="identity")
counts$knurr

### schnipp_schnapp: sound 46 / movement 45
ggplot(counts, aes(y=schnipp_schnapp, x=value)) +
  geom_bar(stat="identity")
counts$schnipp_schnapp
## look what people wrote in other
data$schnipp_schnapp_open
## how many percent is sound
46*100/121
## and movement
45*100/121
## the difference is <1%, ergo sound and movement

### flapp: sound
ggplot(counts, aes(y=flapp, x=value)) +
  geom_bar(stat="identity")
counts$flapp

### puff: sound
ggplot(counts, aes(y=puff, x=value)) +
  geom_bar(stat="identity")
counts$puff

### quack: sound
ggplot(counts, aes(y=quack, x=value)) +
  geom_bar(stat="identity")
counts$quack

### rülps: sound
ggplot(counts, aes(y=rülps, x=value)) +
  geom_bar(stat="identity")
counts$rülps

### hauruck: movement
ggplot(counts, aes(y=hauruck, x=value)) +
  geom_bar(stat="identity")
counts$hauruck

### brumm: sound
ggplot(counts, aes(y=brumm, x=value)) +
  geom_bar(stat="identity")
counts$brumm

### wusch: movement 58 / sound 51
ggplot(counts, aes(y=wusch, x=value)) +
  geom_bar(stat="identity")
counts$wusch
## look what people wrote in other
data$wusch_open
## how many percent is movement
58*100/121
## and sound
51*100/121
## the difference is >5%, ergo movement

### plums: sound 62 / movement 45
ggplot(counts, aes(y=plums, x=value)) +
  geom_bar(stat="identity")
counts$plums
## how many percent is sound
62*100/121
## and movement
45*100/121
## the difference is 16%, ergo sound

### plopp: sound
ggplot(counts, aes(y=plopp, x=value)) +
  geom_bar(stat="identity")
counts$plopp

### pah: feeling 68 / sound 37
ggplot(counts, aes(y=pah, x=value)) +
  geom_bar(stat="identity")
counts$pah
## look what people wrote in other
data$pah_open
## how many percent is feeling
68*100/121
## and sound
37*100/121
## the difference is 26%, ergo feeling

### hui: feeling 52 / sound 31 / movement 28
ggplot(counts, aes(y=hui, x=value)) +
  geom_bar(stat="identity")
counts$hui
## look what people wrote in other
data$hui_open
## how many percent is feeling
52*100/121
## and sound
31*100/121
## and movement
28*100/121
## the difference is 17%, ergo feeling; sound and movement are the same

### krächz: sound
ggplot(counts, aes(y=krächz, x=value)) +
  geom_bar(stat="identity")
counts$krächz


### Categories ----
#### I created a data frame with categories
categories <- read.table(
  'categories.csv',
  encoding = "UTF-8", sep=";", header=TRUE)

## Show only those which are feeling/state
filter(categories, category == "feeling_state")


catcount <- count(categories, category)

catcount <- catcount %>% arrange(match(category, c("sound", "movement", "visual", "feeling_state")))

## order levels
catcount$category <- factor(catcount$category, levels = c("sound", "movement", "visual", "feeling_state"))

### Plot categories
mycols <- c("#A62B3E", "#2660A4", "#74A57F", "#F49390", "#A3CEF1", "#C5E6A6")
cats <- ggplot(catcount, aes(y = n, x = category, fill = category)) +
  geom_bar(stat = "identity", alpha = 0.8)+
  scale_fill_manual(values = mycols,
                    labels = c("Sound", "Movement", "Visual", "Feeling\nor state")) +
  scale_x_discrete(labels = c("Sound", "Movement", "Visual", "Feeling\nor state")) +
  geom_text(aes(label = n), vjust=1.6, color="white", size=4)+
  labs(x = "Ideophone category",
       y = "Number of ideophones",
       fill = "Ideophone\ncategory") + theme_bw() +
        theme(strip.text.x = element_text(size = 12),
              #strip.background = element_rect(fill = "#F8766D"),
              axis.text = element_text(size = 12),
              axis.title = element_text(size = 16,
                                        face = "bold"),
              legend.title = element_text(size = 14),
              legend.text = element_text(size = 12))

#ggsave(plot = cats, filename = "cats.pdf", width = 7, height = 4)


