x <- 10

y <- c(10,20)
y

10 + 10

10 - 6

10 * 6

10 / 6

10 ^ 6

sqrt(10)

log(10)

x <- 1
str(x) 

y <- "espécie" 
str(y)

z <- TRUE 
mode(z)

n <- NA
mode(n)

x <- 80 
mode(x)

temp <- c(30,32,34,34,35,32,30)
temp

amos <- c("amostra_1", "amostra_2", 
          "amostra_3", "amostra_4", 
          "amostra_5")
amos

se <- 1:10
se

se.e <- seq(from = 0, to = 100, by = 10)
se.e

re.num.t <- rep(x = c(1,2), times = 5)
re.num.t

re.cha.t <- rep(x = c("a","b"), each = 5)
re.cha.t

am2 <- paste0("amostra_", 1:6, sep = "_0")
am2

ve <- c("a", 1, TRUE)
ve

ve <- c(1, "a", TRUE)
mode(ve)

ve <- c(TRUE, 1, "a")
mode(ve)

ve <- c(1, TRUE, "a")
mode(ve)

ve <- c(1, TRUE)
mode(ve)

ve <- c(1, "a")
mode(ve)

ve <- mode(c("a", FALSE))
ve

fa.no <- factor(x = c("closed", "open", 
                      "open", "open"),
                levels = c("closed", "open"))
fa.no

class(fa.no)
levels(fa.no)
mode(fa.no)

fa.or <- factor(x = c("alta", "media", 
                      "baixa", "baixa", 
                      "media", "alta"),
                levels = c("baixa", "media", "alta"), 
                ordered = TRUE)
fa.or

fa.num.no <- factor(x = c(1, 1, 1, 2, 3, 4,
                          6, 10, 10, 10, 5),
                    levels = c(1:10)) 
fa.num.no

class(fa.num.no)
levels(fa.num.no)
mode(fa.num.no)

fa.num.or <- factor(x = c(1, 1, 1, 2, 3, 4,
                          6, 10, 10, 10, 5),
                    levels = c(1:10), ordered = TRUE) 
fa.num.or

class(fa.num.or)
levels(fa.num.or)
mode(fa.num.or)

ve.ch <- c("alta", "media", "baixa", "baixa", "media")
ve.ch

class(ve.ch)
mode(ve.ch)

fa.no <- as.factor(ve.ch)
fa.no

class(fa.no)
mode(fa.no)

fa.or <- as.ordered(ve.ch)
fa.or

class(fa.or)
mode(fa.or)

ve <- 1:12 
ma.col <- matrix(data = ve,                  
                 nrow = 4,   
                 ncol = 3,                   
                 byrow = FALSE) 
ma.col

ve <- 1:12 
ma.row <- matrix(data = ve,                   
                 nrow = 4,                   
                 ncol = 3,                   
                 byrow = TRUE) 
ma.row 

vec1 <- c(1, 2, 3)
vec1
vec2 <- c(4, 5, 6)
vec2
ma.rbind <- rbind(vec1, vec2)
ma.rbind

vec1 <- c(1, 2, 3)
vec1
vec2 <- c(4, 5, 6)
vec2
ma.cbind <- cbind(vec1, vec2)
ma.cbind

ve <- 1:8
ve

ar <- array(data = ve, dim = c(2, 2, 3)) 
ar


vec.ch <- c("sp1", "sp2", "sp3")
vec.nu <- c(4, 5, 6)
vec.fa <- factor(c("campo", "floresta", "floresta"))

df <- data.frame(vec.ch, vec.nu, vec.fa)
df
str(df)


df <- data.frame(especies = vec.ch, 
                 abundancia = vec.nu, 
                 vegetacao = vec.fa)
df


df.cb <- cbind(vec.ch, vec.nu, vec.fa)
df.cb
str(df.cb)

li <- list(rep(1, 20), # vector
           factor(1:5), # factor
           cbind(c(1, 2), c(1, 2)),
           df) # matrix
li

li[[4]]

li[[1]]

li[[2]]

char <- c("2009", "2010", "2012", "2015", "2026")
char
mode(char)

num <- as.numeric(char)
num
mode(num)

num <- c(2009, 2010, 2012, 2015, 2026)
num
mode(num)

char <- as.character(num)
char
mode(char)

df.con <- df
df.con
str(df.con)

df.con$abundancia <- as.character(df.con$abundancia)
str(df.con)

df.con$abundancia <- as.numeric(df.con$abundancia)
str(df.con)

unique(df$especies)

v.n <- 1:10
v.n

f.c <- factor(x = c("Pasto", "Floresta", "Campo", "Urbano", "Rio", 
                    "Pasto", "Floresta", "Campo", "Urbano", "Rio"),
              levels = c("Pasto", "Floresta", "Campo", "Urbano", "Rio"))
f.c

m.n <- matrix(data = 1:9, nrow = 3, ncol = 2)
m.n

df.tc <- data.frame(ID = 1:5,
                    Habitat = f.c,
                    Abundancia = c(12, 8, 15, 3, 10))
df.tc


l.todos <- list(v.n, f.c, m.n, df.tc)
l.todos

l.todos[[4]]

df.m <- l.todos[[4]]
str(df.m)