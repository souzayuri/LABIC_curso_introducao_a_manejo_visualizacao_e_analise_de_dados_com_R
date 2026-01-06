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



dados_iris <- iris %>% 
  dplyr::mutate(
    Tamanho = dplyr::case_when(
      Sepal.Length < 5.5 ~ "Pequena",
      Sepal.Length < 6.5 ~ "Média",
      TRUE ~ "Grande"))
head(dados_iris, n = 15)
dim(dados_iris)

tabela <- table(dados_iris$Species, dados_iris$Tamanho)
tabela

teste_chi <- chisq.test(tabela)
teste_chi

dados_iris %>% 
  count(Species, Tamanho) %>% 
  ggplot(aes(x = Species, y = n, fill = Tamanho)) +
  geom_col(position = "dodge") +
  theme_minimal() +
  labs(y = "Frequência", 
       x = "Espécies",
       fill = "Tamanho da Sépala")

nortest::sf.test(iris$Sepal.Length)

iris %>% 
  dplyr::group_by(Species) %>% 
  dplyr::summarise(
    p_value = nortest::sf.test(Sepal.Length)$p.value,
    w_value = nortest::sf.test(Sepal.Length)$statistic
  )

ggplot(iris, aes(sample = Sepal.Length)) +
  qqplotr::stat_qq_band(conf = 0.95, alpha = 0.4) + # intervalo de confiança
  stat_qq_line(color = "darkred") + # linha
  stat_qq_point() + # pontos
  facet_wrap(~Species) +
  theme_minimal() +
  labs(title = "Q-Q Plot - Avaliação da Normalidade")


dados_2sp <- iris %>% 
  dplyr::filter(Species %in% c("setosa", "versicolor"))

car::leveneTest(Sepal.Length ~ Species, data = dados_2sp)


teste_t <- t.test(Sepal.Length ~ Species, 
                  data = dados_2sp,
                  var.equal = TRUE)
teste_t


effectsize::cohens_d(Sepal.Length ~ Species, data = dados_2sp)


ggplot(dados_2sp, aes(x = Species, 
                      y = Sepal.Length, 
                      fill = Species)) +
  geom_violin(alpha = 0.5) +
  geom_boxplot(width = 0.2, alpha = 0.7) +
  geom_jitter(width = 0.1, alpha = 0.3) +
  theme_minimal() +
  labs(x = "Espécie", 
       y = "Comprimento da Sépala (cm)") +
  theme(legend.position = "none")


dados.anf <- read_csv("../01_dados/dados_anfibios.csv")
glimpse(dados.anf)

car::leveneTest(tam_medio_femur ~ matriz,
                data = dados.anf)


modelo_anova <- aov(tam_medio_femur ~ matriz,
                    data = dados.anf)
summary(modelo_anova)

shapiro.test(modelo_anova$residuals)

boxplot(modelo_anova$residuals ~ dados.anf$matriz)

effectsize::eta_squared(modelo_anova)

report::report(modelo_anova)


tukey_result <- stats::TukeyHSD(modelo_anova)
tukey_result

ggplot(dados.anf, aes(x = matriz, y = tam_medio_femur)) +
  geom_boxplot(aes(fill = matriz), alpha = 0.5) +
  theme_minimal() +
  labs(y = "Tamanho médio do fêmur (cm)", x = "Espécie") +
  theme(legend.position = "none")


dados.anf <- read_csv("../01_dados/dados_anfibios.csv")
glimpse(dados.anf)

car::leveneTest(tam_torax_medio ~ matriz,
                data = dados.anf)


modelo_kruskal <- kruskal.test(tam_torax_medio ~ matriz,
                               data = dados.anf)
modelo_kruskal





