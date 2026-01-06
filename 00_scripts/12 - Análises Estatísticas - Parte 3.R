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



nortest::sf.test(iris$Petal.Length)
nortest::sf.test(iris$Petal.Width)

cor_matrix <- iris %>% 
  dplyr::select(where(is.numeric)) %>% 
  stats::cor(method = "spearman",)

cor_matrix

ggcorrplot(cor_matrix, 
           lab = TRUE,
           lab_size = 4,
           colors = c("#6D9EC1", #valor -1 a 0.0
                      "white", # valor 0
                      "#E46726")) #valor 0 a 1.0

stats::cor.test(iris$Sepal.Length, 
                iris$Petal.Length, 
                method = "spearman")


dados.anf <- read_csv("../01_dados/dados_anfibios.csv")


anf.lm <- lm(n_sp ~ pct_flo,
             data = dados.anf)
anf.lm

summary(anf.lm)

shapiro.test(anf.lm$residuals)

performance::check_model(anf.lm)

lmtest::bptest(anf.lm)

ggplot(dados.anf, aes(x = pct_flo, y = tam_medio_femur)) +
  geom_point(size = 3, alpha = 0.6) +
  geom_smooth(method = "lm", se = TRUE, color = "black") +
  theme_minimal() +
  labs(x = "Cobertura Florestal (%)",
       y = "Tamanho médio do fêmur")





anf.lm2 <- lm(n_sp ~ pct_flo + conect,
              data = dados.anf)
anf.lm2

summary(anf.lm2)

shapiro.test(anf.lm2$residuals)

performance::check_model(anf.lm2)

lmtest::bptest(anf.lm2)

car::vif(anf.lm2)

anova(anf.lm, anf.lm2)

AIC(anf.lm, anf.lm2)




dados_count <- read_csv("../01_dados/dados_count_poisson.csv")
dados_count

modelo_poisson <- stats::glm(contagem ~ temperatura + umidade,
                             data = dados_count,
                             family = poisson(link = "log"))

summary(modelo_poisson)

simulacao <- DHARMa::simulateResiduals(modelo_poisson, plot = TRUE)

DHARMa::testDispersion(simulacao)

DHARMa::testOutliers(simulacao)

DHARMa::testZeroInflation(simulacao)

modelo_null <- glm(contagem ~ 1, 
                   family = poisson, 
                   data = dados_count)

anova(modelo_null, modelo_poisson, test = "Chisq")

fmsb::NagelkerkeR2(modelo_poisson)

sjPlot::plot_model(modelo_poisson, 
                   type = "pred", 
                   terms = c("temperatura", "umidade [50, 70, 90]"),
                   title = "Efeitos Marginais")


report::report(modelo_poisson)
















