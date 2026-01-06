install.packages("tidyverse")
library("tidyverse")


dados_csv <- readr::read_csv("../01_dados/biota_diversidade.csv")
dados_csv

dados_tidy <- dados_csv %>% #seleciona o objeto     
  select(c(2,3,4)) %>% 
  table()
dados_tidy 

dados_txt <- readr::read_table("../01_dados/biota_diversidade.txt")
dados_txt

dplyr::glimpse(dados_csv)

dados_csv %>% 
  dplyr::select(Id_plot, Location, Plots)

dados_csv %>% 
  dplyr::select(1, 2, 3)

dados_csv %>%    
  dplyr::select(-c(Id_plot, Location, Plots)) 

dados_csv %>%    
  dplyr::select(-c(1, 2, 3))

dados_csv %>% 
  dplyr::select(dplyr::starts_with("D_"))

dados_csv %>% 
  dplyr::select(dplyr::ends_with("on"))

dados_csv %>% 
  dplyr::select(Treatment, dplyr::everything())

dados_csv %>% 
  dplyr::filter(Location == "CBO" | Treatment == "closed" & Date == 2019)

dados_csv %>% 
  dplyr::slice(1:5)

dados_csv %>%       
  dplyr::slice(c(1, 5, 10))

dados_csv %>% 
  dplyr::slice_sample(n = 10)

dados_csv %>%    
  dplyr::slice_sample(prop = 0.1)

dados_csv %>% 
  dplyr::distinct()

dados_csv %>% 
  dplyr::distinct(Location)

dados_csv %>%       
  dplyr::rename(Tratamento = Treatment,                      
                Local = Location,                  
                Parcelas = Plots,                 
                ID = Id_plot)

dados_csv_col_n <- dados_csv %>% 
  dplyr::filter(Date == 2019) %>% 
  tibble::column_to_rownames("Id_plot") # seleciona a coluna existente
dados_csv_col_n

dados_csv_col_n %>% 
  dplyr::filter(Date == 2019) %>% 
  tibble::rownames_to_column("Id_plot")

head(dados_csv %>% 
       dplyr::mutate(coluna_nova = ""), n = 5)

head(dados_csv %>% 
       dplyr::mutate(coluna_nova = "",
                     Treatment = toupper(Treatment), #coloca tudo maiúsculo
                     hbvr_body_size_kg_log = log(hbvr_body_size_kg)), n = 5)

dados_csv <- dados_csv %>% 
  dplyr::mutate(ID = dplyr::row_number()) %>% 
  dplyr::select(ID, dplyr::everything())
dados_csv


dados_csv %>% 
  dplyr::mutate(Richness_cond = dplyr::if_else(Richness > 5, 
                                               "Verdadeiro",
                                               "Falso")) %>% 
  dplyr::select(1,2,3,4, dplyr::starts_with("Rich"))


dados_csv %>% 
  dplyr::mutate(
    Richness_cat = dplyr::case_when(
      Richness > 20 ~ "muito alta",
      Richness > 10 ~ "alta",
      Richness > 5 ~ "média",
      TRUE ~ "baixa"  # condição padrão
    )) %>% 
  dplyr::select(1,2,3,4, dplyr::starts_with("Rich"))


dados_csv %>% 
  dplyr::select(1,2,3,4, dplyr::starts_with("Rich")) 

dados_csv %>% 
  dplyr::select(1,2,3,4, dplyr::starts_with("Rich")) %>% 
  dplyr::arrange(Richness)

dados_csv %>% 
  dplyr::group_by(Location, Treatment) %>% 
  dplyr::summarise(
    Richness_media = mean(Richness),
    Abundance_soma= sum(Abundance),
    Treatment_count = n()) %>% 
  dplyr::ungroup()

dados_csv %>% 
  dplyr::count(Location)

dados_csv %>% 
  tidyr::drop_na(Canopy_cover)

dados_csv %>% 
  dplyr::mutate(
    Canopy_cover = tidyr::replace_na(Canopy_cover, 0)) %>% 
  dplyr::select(1:5, "Canopy_cover")

dados_csv_long <- dados_csv %>% 
  tidyr::pivot_longer(
    cols = 10:19,
    names_to = "Variaveis",
    values_to = "Valores")
dados_csv_long

dados_csv %>% 
  tidyr::pivot_longer(
    cols = 10:19,
    names_to = "Variaveis",
    values_to = "Valores") %>% 
  dplyr::select(3:5, starts_with("Va"))


dados_csv_long %>% 
  tidyr::pivot_wider(
    names_from = Variaveis,
    values_from = Valores)


traits <- readr::read_csv("../01_dados/biota_plant_traits.csv") %>% 
  dplyr::slice_sample(n = 10)
traits

head(dados_csv %>% 
       dplyr::left_join(traits, by = c("Id_plot","Location", "Plots", 
                                       "Treatment", "Date")), n = 5)



traits.sample <- readr::read_csv("../01_dados/biota_plant_traits.csv") %>%
  dplyr::slice_sample(n = 20)
head(traits.sample, n = 5)

dados.sample <- readr::read_csv("../01_dados/biota_diversidade.csv") %>% 
  dplyr::slice_sample(n = 20)
head(dados.sample, n = 5)

dados.sample %>%    
  dplyr::inner_join(traits.sample, by = c("Id_plot","Location", "Plots", 
                                          "Treatment", "Date"))

dados_fj <- dados.sample %>%   
  dplyr::full_join(traits.sample, by = c("Id_plot","Location", "Plots",
                                         "Treatment", "Date"))
dados_fj

readr::write_csv(dados_fj, "../01_dados/dados_full_join.csv")


