if(!require(tidyverse)) install.packages("tidyverse")     # Manipulação e visualização
if(!require(car)) install.packages("car")                 # Testes de pressupostos
if(!require(corrplot)) install.packages("corrplot")       # Matriz de correlação
if(!require(ggcorrplot)) install.packages("ggcorrplot")   # Heatmap de correlação
if(!require(qqplotr)) install.packages("qqplotr")         # Plota intervalo de confiança do qqplot
if(!require(nortest)) install.packages("nortest")         # teste de normalidade shapiro-francia
if(!require(report)) install.packages("report")           # cria sumário dos resultados dos modelos
if(!require(rstatix)) install.packages("rstatix")         # Testes estatísticos
if(!require(effectsize)) install.packages("effectsize")   # Tamanho de efeito
if(!require(emmeans)) install.packages("emmeans")         # Médias marginais e post-hoc
if(!require(sjPlot)) install.packages("sjPlot")           # Visualização de modelos
if(!require(ggeffects)) install.packages("ggeffects")     # Efeitos de modelos
if(!require(see)) install.packages("see")                 # Necessário para Performance
if(!require(performance)) install.packages("performance") # Diagnóstico de modelos
if(!require(DHARMa)) install.packages("DHARMa")           # Diagnóstico de GLMs
if(!require(fmsb)) install.packages("fmsb")               # Calcula pseudo r2


head(iris, n = 5)
min(iris$Sepal.Length)
max(iris$Sepal.Length)
mean(iris$Sepal.Length)
median(iris$Sepal.Length)
names(which.max(table(iris$Sepal.Length)))
var(iris$Sepal.Length)
sd(iris$Sepal.Length)
sd(iris$Sepal.Length) /sqrt(length(iris$Sepal.Length)) 


iris %>% 
  dplyr::summarise(
    n = n(),
    min_sepala = min(Sepal.Length, na.rm = TRUE),
    max_sepala = max(Sepal.Length, na.rm = TRUE),
    media_sepala = mean(Sepal.Length, na.rm = TRUE),
    mediana_sepala = median(Sepal.Length, na.rm = TRUE),
    var_sepala = var(Sepal.Length, na.rm = TRUE),
    dp_sepala = sd(Sepal.Length, na.rm = TRUE),
    se_sepala = (sd(Sepal.Length, na.rm = TRUE) / sqrt(n()))
  )

iris %>% 
  dplyr::group_by(Species) %>% 
  dplyr::summarise(
    n = n(),
    min_sepala = min(Sepal.Length, na.rm = TRUE),
    max_sepala = max(Sepal.Length, na.rm = TRUE),
    media_sepala = mean(Sepal.Length, na.rm = TRUE),
    mediana_sepala = median(Sepal.Length, na.rm = TRUE),
    var_sepala = var(Sepal.Length, na.rm = TRUE),
    dp_sepala = sd(Sepal.Length, na.rm = TRUE),
    se_sepala = (sd(Sepal.Length, na.rm = TRUE) / sqrt(n()))
  ) %>% 
  dplyr::ungroup()

ggplot(iris, aes(x = Sepal.Length)) +
  geom_histogram(bins = 20, fill = "steelblue", alpha = 0.7) +
  facet_wrap(~Species) +
  theme_minimal() +
  labs(x = "Comprimento da Sépala (cm)", 
       y = "Frequência")





