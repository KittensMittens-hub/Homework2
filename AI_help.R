# Запрос для Deep Seek: есть значение истинной вероятности успеха (например 0.3) и исходы 1- успех,  0- неудача. 
нужен код для tydiverse чтобы найти  мат ожидание, дисперсию и стандартное отклонение

# Load the library
library(tidyverse)

# Set the true probability of success
p <- 0.3

# Calculate the theoretical metrics directly
theoretical_metrics <- tibble(
  Ожидание = p,
  Дисперсия = p * (1 - p),
  Стандартное_отклонение = sqrt(p * (1 - p))
)

# View the result
theoretical_metrics

#далее я разбиралсь чем заменить rbind(runif(n_patients, 0, 1) 

  r
library(tidyverse)

# Параметры
n_patients <- 500 # Количество добровольцев
p_success <- 0.7  # Истинная вероятность положительного исхода

# Генерация результатов добровольцев (0 или 1)
set.seed(123) # для воспроизводимости результатов
my_group_outcome_upd <- rbinom(n_patients, 1, p_success)

# Вывод результатов
print(my_group_outcome_upd)

# Расчет выборочного среднего
sample_mean <- mean(my_group_outcome_upd)
print(paste("Выборочное среднее:", sample_mean))

# Дополнительно: создание таблицы с результатами
patients_data <- tibble(
  patient_id = 1:n_patients,
  outcome = my_group_outcome_upd
)

# Просмотр первых нескольких записей
head(patients_data)

# Сводная статистика
summary_stats <- patients_data %>%
  summarise(
    sample_mean = mean(outcome),
    sample_variance = var(outcome),
    sample_sd = sd(outcome),
    success_count = sum(outcome),
    failure_count = n() - sum(outcome)
  )

print(summary_stats)

# выяснила, что  round(rbinom(n_patients, 1, p_true)) от rbinom(n_patients, 1, p_true)
# в данном случае аналогичны

# Отличие от других распределений:
runif(n, 0, 1) - равномерное распределение (дробные числа от 0 до 1)

rbinom(n, 1, p) - биномиальное распределение (целые числа 0 или 1)

rnorm(n, mean, sd) - нормальное распределение