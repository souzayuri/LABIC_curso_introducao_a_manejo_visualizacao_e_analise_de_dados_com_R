library(tidyverse)

dados_csv <- read_csv("../01_dados/biota_diversidade.csv")

dados_csv_bar <- dados_csv %>%    
  dplyr::group_by(Location) %>%    
  dplyr::summarise(Richness_mean = 
                     mean(Richness))
dados_csv_bar

dados_csv <- read_csv("../01_dados/biota_diversidade.csv")

dados_csv_bar <- dados_csv %>%    
  dplyr::group_by(Location) %>%    
  dplyr::summarise(Richness_mean = 
                     mean(Richness))

ggplot(data = dados_csv_bar, aes(x = Location, 
                                 y = Richness_mean)) +
  geom_col()

dados_csv <- read_csv("../01_dados/biota_diversidade.csv")

dados_csv_bar <- dados_csv %>%    
  dplyr::group_by(Location) %>%    
  dplyr::summarise(Richness_mean = 
                     mean(Richness))

ggplot(data = dados_csv_bar, aes(x = Location, 
                                 y = Richness_mean)) +
  geom_col() + 
  theme_classic() 

dados_csv <- read_csv("../01_dados/biota_diversidade.csv")

dados_csv_bar <- dados_csv %>%    
  dplyr::group_by(Location) %>%    
  dplyr::summarise(Richness_mean = 
                     mean(Richness))

ggplot(data = dados_csv_bar, aes(x = Location, 
                                 y = Richness_mean)) +
  geom_col() +
  theme_classic() + 
  labs(x = "Locais", y = "Riqueza média de espécies") 



dados_csv <- read_csv("../01_dados/biota_diversidade.csv")

dados_csv_bar <- dados_csv %>%    
  dplyr::group_by(Location) %>%    
  dplyr::summarise(Richness_mean = 
                     mean(Richness))

ggplot(data = dados_csv_bar, aes(x = Location, 
                                 y = Richness_mean)) +
  geom_col() +
  theme_classic() +
  labs(x = "Locais", y = "Riqueza média de espécies") +
  theme(
    axis.title = element_text(size = 16))

    
    
    
dados_csv <- read_csv("../01_dados/biota_diversidade.csv")

dados_csv_bar <- dados_csv %>%    
  dplyr::group_by(Location) %>%    
  dplyr::summarise(Richness_mean = 
                     mean(Richness))
  
ggplot(data = dados_csv_bar, aes(x = Location, 
                                 y = Richness_mean)) +
  geom_col() +
  theme_classic() + 
  labs(x = "Locais", y = "Riqueza média de espécies") +
  theme(
    axis.title = element_text(size = 16),
    axis.text.x = element_text(size = 16, 
                               face = "italic",
                               color = "purple")
    )



ggplot(data = dados_csv, aes(x = Richness)) +
  geom_bar(color = "black", fill = "gray") + 
  theme_classic()

ggplot(data = dados_csv, aes(x = Location, fill = Treatment)) +
  geom_bar() + 
  scale_fill_manual(values = c("closed" = "#9A68A4",
                               "open" = "#ADC062")) +
  theme_classic()




ggplot(data = dados_csv, aes(x = Richness)) +
  geom_histogram() +
  theme_classic()

ggplot(data = dados_csv, aes(x = Richness, fill = Treatment)) +
  geom_histogram(color = "black") +
  scale_fill_manual(values = c("closed" = "#9A68A4",
                               "open" = "#ADC062")) +
  theme_classic()




ggplot(dados_csv, aes(x = Richness, 
                      y = D_Shannon)) +
  geom_point() +
  theme_bw()

ggplot(dados_csv, aes(x = Richness, 
                      y = D_Shannon,
                      fill = Treatment)) +
  geom_point(shape = 21, 
             color = "black", 
             size = 3,
             alpha = 0.5) 
theme_bw() 

ggplot(dados_csv, aes(x = Richness, 
                      y = D_Shannon,
                      fill = Treatment)) +
  geom_point(shape = 21, 
             color = "black", 
             size = 3,
             alpha = 0.5) +
  scale_fill_manual(values = c("closed" = "#9A68A4",
                               "open" = "#ADC062")) + 
  theme_bw() 

ggplot(dados_csv, aes(x = Richness, 
                      y = D_Shannon,
                      fill = Treatment)) +
  geom_point(shape = 21, 
             color = "black", 
             size = 3,
             alpha = 0.5) +
  scale_fill_manual(values = c("closed" = "#9A68A4",
                               "open" = "#ADC062")) +
  theme_bw() +
  labs(x = "Riqueza de Espécies", y = "Diversidade Shannon")

ggplot(dados_csv, aes(x = Richness, 
                      y = D_Shannon,
                      fill = Treatment)) +
  geom_point(shape = 21, 
             color = "black", 
             size = 3,
             alpha = 0.5) +
  scale_fill_manual(values = c("closed" = "#9A68A4",
                               "open" = "#ADC062"),
                    name = "Tratamento") + #muda o titulo da legenda
  theme_bw() +
  labs(x = "Riqueza de Espécies", y = "Diversidade Shannon")




ggplot(dados_csv, aes(x = Richness,
                      fill = Treatment)) +
  geom_density(alpha = 0.5) +
  theme_light()




ggplot(dados_csv, aes(x = Treatment,
                      y = Richness)) +
  geom_boxplot()

ggplot(dados_csv, aes(x = Treatment,
                      y = Richness,
                      fill = Treatment)) +
  geom_boxplot() +
  geom_jitter(shape = 21) +
  theme_minimal()

ggplot(dados_csv, aes(x = Treatment,
                      y = Richness,
                      fill = Treatment)) +
  geom_violin() +
  geom_boxplot(width = 0.2, fill = "gray") +
  geom_jitter(shape = 21) +
  theme_minimal()




ggplot(dados_csv, aes(x = Location,
                      y = Richness,
                      fill = Treatment)) +
  geom_violin(
    position = position_dodge(width = 0.8),
    alpha = 0.7
  ) +
  geom_boxplot(
    width = 0.30,
    position = position_dodge(width = 0.8),
    outlier.shape = NA
  ) +
  geom_jitter(
    shape = 21,
    size = 2,
    alpha = 0.7,
    position = position_jitterdodge(
      jitter.width = 0.05,
      dodge.width  = 0.8
    )
  ) +
  scale_fill_manual(
    values = c("closed" = "#9A68A4",
               "open"   = "#ADC062"),
    name = "Tratamento"
  ) + 
  theme_minimal()




ggplot(dados_csv, aes(x = Canopy_cover,
                      y = Richness,
                      fill = Treatment)) +
  geom_smooth(method = "lm", color = "black") +
  facet_wrap(~Location) +
  theme_bw()


ggplot(dados_csv, aes(x = Canopy_cover,
                      y = Richness,
                      fill = Treatment)) +
  geom_smooth(method = "lm", color = "black") +
  theme_bw() +
  scale_x_continuous(
    limits = c(0, 100),
    breaks = seq(0, 100, 10)) +
  scale_y_continuous(
    limits = c(0, 15),
    breaks = seq(0, 15, 5))


plot_densidade <- ggplot(dados_csv, aes(x = Richness,
                                        fill = Treatment)) +
  geom_density(alpha = 0.5) +
  theme_light()

ggsave("../04_figuras/grafico_riqueza.png", 
       plot = plot_densidade,
       width = 8, 
       height = 6,
       dpi = 300)



