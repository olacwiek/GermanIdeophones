### START 3.2.2021 ----
library(dplyr)
library(ggplot2)

rm(list=ls())
setwd("C:/Users/zas/OneDrive/PSIMS/2019-ideophones/")
df=read.csv('Korpus_Ideophone_updated.csv', sep=';',na.string = "NA",encoding="UTF-8")

### Corpus
korp=read.csv('korpus.csv', sep=';',na.string = "NA",encoding="UTF-8")

t(korp)

ggplot(data = korp, aes())


### Frequency calculations ----

## How many books?
unique(df$Buchtitel)
length(unique(df$Buchtitel))

## How many books are German?
unique(df$Originalsprache)
df %>% 
  filter(Originalsprache == "Deutsch" | Originalsprache == "Deutsch?") %>%
  summarise(count = n_distinct(Buchtitel))

## How many are not German?
df %>% 
  filter(Originalsprache != "Deutsch" | Originalsprache != "Deutsch?") %>%
  summarise(count = n_distinct(Buchtitel))

## What is the count of books of all the different languages?
df %>% 
  group_by(Originalsprache) %>% 
  summarise(count = n_distinct(Buchtitel))

## Total number of ideophones
nrow(df)

## Total number of unique ideophone per page
length(unique(df$X.U.FEFF.ID))

## Total number of unique ideophones per book
df %>%
  group_by(Buchtitel) %>%
  summarise(count = n_distinct(Grundform)) %>% 
  summarise(sum(count))

## How many word forms?
length(unique(df$Ideophon))

## How many lemmas?
length(unique(df$Grundform))

## How many books in age groups?
df %>%
  group_by(Altersgruppe) %>%
  summarise(count = n_distinct(Buchtitel))

str(df)

## Which unique tokens are there?
unique(df$Grundform)

## how many are there exactly
length(unique(df$Grundform))
## 657

## Frequency of ideophones
frequent <- df %>% 
  count(Grundform) %>% 
  arrange(desc(n))
View(frequent)
write.csv(frequent,"frequent.csv",row.names = F,fileEncoding = "UTF-8")

### Seitenanzahl Altersgruppen
df$Altersgruppe <- as.factor(df$Altersgruppe)
str(df)
ggplot(df, aes(x = Altersgruppe, y = Seitenzahl)) +
geom_boxplot()

df %>%
group_by(Altersgruppe) %>%
summarise_at(vars(Seitenzahl), list(mean = mean, sd = sd), na.rm=TRUE)


### Wortanzahl Altersgruppen
str(df)
ggplot(df, aes(x = Altersgruppe, y = Wortanzahl)) +
geom_boxplot()

df %>%
group_by(Altersgruppe) %>%
summarise_at(vars(Wortanzahl), list(mean = mean, sd = sd), na.rm=TRUE)

### % Ideophone / Wortanzahl Altersgruppen
count(df, Quelle)

df$Quelle <- as.factor(df$Quelle)

count <- count(df, Quelle)
str(count)
data <- merge(df, count, by = "Quelle")
str(data)

uniquedf <- data[!duplicated(data$Quelle), ]

str(uniquedf)
uniquedf <- uniquedf %>% mutate(ratio = 100 * n / Wortanzahl)

uniquedf %>% 
group_by(Altersgruppe) %>%
summarise_at(vars(ratio), list(mean = mean, sd = sd), na.rm=TRUE)

### Varianz Ideophone Altersgruppe

df %>%
group_by(Altersgruppe) %>%
summarise(count = n_distinct(Grundform))

### Wiederholung gleicher Ideophone im Buch Altersgruppe

unique(df$Buchtitel)
wdh_df <- df %>%
#filter(Altersgruppe == 1) %>%
group_by(Altersgruppe) %>%
add_count(Buchtitel, Grundform, sort = TRUE) %>%
ungroup()
#summarise_at(vars(n), list(mean = mean, sd = sd), na.rm=TRUE)

str(wdh_df)
summary(wdh_df)

wdh_df %>%
  group_by(Altersgruppe) %>%summarise_at(vars(n), list(mean = mean, sd = sd), na.rm=TRUE)



## ----

# save list of all grundform and export to new df
new <- data.frame(unique(df$Grundform))
con<-file('new.csv',encoding="UTF-8")
write.table(new,file=con,sep = ",", row.names = F)

## create new data frame with the frequency of unique tokens
item <- as.data.frame(table(df$Grundform))

head(item)
## rename first column to Item
names(item)[1] <- "Item"
str(item)
summary(item)
## order the data according to frequency
attach(item)
item <- item[order(Freq),]
detach(item)

head(item)

write_csv(item,'item.csv')

## create new data frame with the token freqeuncy per book
book <- as.data.frame(table(df$Buchtitel))
head(book)
## rename first column to Buchtitel
names(book)[1] <- "Buchtitel"
## order the data according to frequency
attach(book)
book <- book[order(Freq),]
detach(book)

head(book)

## make new column for age group
df$Altersgruppe <- 1
df$Altersgruppe[df$Alterseinstufung=="7-9"] <- 2

## create new data frame with the token freqeuncy per item in each age group
item.age <- as.data.frame(table(df$Grundform,df$Altersgruppe))
head(item.age)
## rename columns
names(item.age)[1] <- "Item"
names(item.age)[2] <- "Altersgruppe"
## order the data according to item
attach(item.age)
item.age <- item.age[order(Item),]
detach(item.age)

## create new data frame with the token freqeuncy per age group
age <- as.data.frame(table(df$Altersgruppe))
## rename first column to Buchtitel
names(age)[1] <- "Altersgruppe"

## see how many books from buchliste are not in the corpus - these did not have any ideophones 
bl=read.csv('Buchliste.csv', sep='\t',na.string = "NA")
str(bl)
buch.ohne <- bl$Buchtitel[!(bl$Buchtitel %in% df$Buchtitel)]
length(buch.ohne) # 135, davon 2 von altersgruppe 2

## check how many books had ideophones in altersgruppe 1 and 2
## create new dataframe with unique book titles
newdf<-df[!duplicated(df$Buchtitel),]
## check how many altersgruppe 1 and 2
length(which(newdf$Altersgruppe=="1")) # 342
length(which(newdf$Altersgruppe=="2")) # 89

## this means there were together 342 + 130 AG 1 books and 89 + 2 AG 2 books
length(which(newdf$Altersgruppe=="1"))*100 / (length(which(newdf$Altersgruppe=="1")) + (length(buch.ohne)-2))
## 72% of AG 1 books have ideophones in them
length(which(newdf$Altersgruppe=="2"))*100 / (length(which(newdf$Altersgruppe=="2")) + (length(buch.ohne)-133))
## 97.8022% of AG 2 books have ideophones in them

# write.csv(item, file="items.csv",row.names=FALSE)

str(df)
## let's see how does it look with page numbers
## create new data frame with the token freqeuncy per book and the info on page number
book.page <- as.data.frame(table(df$Buchtitel,df$Seitenzahl,df$Altersgruppe))
head(book.page)
## rename first column to Buchtitel
names(book.page)[1] <- "Buchtitel"
names(book.page)[2] <- "Seitenanzahl"
names(book.page)[3] <- "Altersgruppe"
## drop all values where Freq = 0 
book.page<-book.page[!(book.page$Freq==0),]
## calculate frequency per page
book.page$Seitenanzahl <- as.integer(book.page$Seitenanzahl)
book.page$MW.Freq <- book.page$Freq / book.page$Seitenanzahl
## calculate mean frequency per page in book per Altersgruppe
str(book.page)
aggregate(book.page[, 5:5], list(book.page$Altersgruppe), mean)
# 1       1 0.4457179
# 2       2 0.4208931



### 11.08.2020
# I wanna try extracting a few columns: grundform, buchtitel
# in order to later calculate the frequency but counting 1 grundform per buchtitel
grundform <- select(df,c(Grundform,Buchtitel))
write_csv(grundform,'grundform.csv')
gf_unique=read.csv('grundform.csv', sep='\t',na.string = "NA",encoding="UTF-8")
## create new data frame with the frequency of unique tokens
gf_unique_freq <- as.data.frame(table(gf_unique$Grundform))
gf_unique_freq
write_csv(gf_unique_freq,'gf_unique_freq.csv')

