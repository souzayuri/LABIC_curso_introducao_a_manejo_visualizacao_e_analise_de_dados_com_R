dados.txt <- read.table("../01_dados/biota_diversidade.txt", 
                        sep = "\t",
                        header = TRUE)

dim(dados.txt) 

dados.csv <- read.csv("../01_dados/biota_diversidade.csv")

dim(dados.csv) 
head(dados.csv, n = 5)

write.table(dados.txt, "../01_dados/dados_aula_R.txt")
write.csv(dados.csv, "../01_dados/dados_aula_R.csv")

colnames(dados.csv)
rownames(dados.csv)
class(dados.csv)
summary(dados.csv)

head(dados.csv$Id_plot, n = 5)

dados.csv[1,]

head(dados.csv[,1], n = 5)

subset(dados.csv, Location == "CBO")

dim(subset(dados.csv, Location == "CBO"))

head(dados.csv$Id_plot, n = 5)

head(subset(dados.csv, Location == "CBO"), n = 1)
dim(subset(dados.csv, Location == "CBO"))

head(subset(dados.csv, Location == "CBO" & Richness > 5), n = 1)
dim(subset(dados.csv, Location == "CBO" & Richness > 5))

which(dados.csv$Richness > 10)
which(dados.csv$Location == "CBO")

which(dados.csv$Location == "CBO" & dados.csv$Richness > 10)

x <- c(10,1,11,23,4,6,5,8)  
sort(x) 
sort(dados.csv$Date)


dados.traits <- read.csv("../01_dados/biota_plant_traits.csv")   
head(dados.traits, n = 2)    
names(dados.traits) 

dados.csv.traits <- merge(dados.csv, dados.traits,     
                          by = c("Id_plot", "Date"))  
head(dados.csv.traits, n = 2)   


dados.cbind <- cbind(dados.csv, dados.traits$sla)
head(dados.cbind, n = 3)

names(dados.cbind)[names(dados.cbind) == "dados.traits$sla"] <- "sla"

head(is.na(dados.traits$sla), n = 20)


complete.cases(dados.csv)  

complete.cases(dados.csv)  
table(complete.cases(dados.csv))

dados_completos <- dados.csv[complete.cases(dados.csv), ]  
dim(dados_completos)  
dim(dados.csv)

unique(dados.csv$Treatment)
unique(dados.csv$Location)
unique(dados.csv$Date)
unique(dados.csv$Richness)
sort(unique(dados.csv$Richness), decreasing = TRUE)

dados.ric.abn <- dados.csv$Abundance/dados.csv$Richness
head(dados.ric.abn, n = 10)
sort(head(dados.ric.abn, n = 10))

summary(dados.ric.abn)


filtrado <- subset(dados.csv, Date == 2019)
head(filtrado, n = 3)
dim(filtrado)
table(filtrado$Plots)

write.csv(filtrado.cbo, "../01_dados/filtrado_cbo.csv")
























