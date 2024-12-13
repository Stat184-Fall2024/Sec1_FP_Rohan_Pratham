# Load Required Libraries ----
library(dplyr)
library(knitr)
library(kableExtra)

# Load Cleaned Data ----
# Load the cleaned dataset prepared in the previous script
cleaned_data <- read.csv(
  file = "Cleaned_Merged_Player_Data.csv"
)

# Create Summary Statistics Table ----
# Select relevant columns for summary
batting_data <- cleaned_data %>%
  select(
    runs, 
    boundaries, 
    balls_faced, 
    matches, 
    batting_avg, 
    boundaries_percent, 
    batting_strike_rate
  )

# Calculate summary statistics
summary_table <- batting_data %>%
  summarise(
    Variable = c(
      "Runs", 
      "Boundaries", 
      "Balls Faced", 
      "Matches", 
      "Batting Average", 
      "Boundaries Percentage", 
      "Strike Rate"
    ),
    Mean = c(
      mean(runs, na.rm = TRUE), 
      mean(boundaries, na.rm = TRUE), 
      mean(balls_faced, na.rm = TRUE), 
      mean(matches, na.rm = TRUE), 
      mean(batting_avg, na.rm = TRUE), 
      mean(boundaries_percent, na.rm = TRUE), 
      mean(batting_strike_rate, na.rm = TRUE)
    ),
    Median = c(
      median(runs, na.rm = TRUE), 
      median(boundaries, na.rm = TRUE), 
      median(balls_faced, na.rm = TRUE), 
      median(matches, na.rm = TRUE), 
      median(batting_avg, na.rm = TRUE), 
      median(boundaries_percent, na.rm = TRUE), 
      median(batting_strike_rate, na.rm = TRUE)
    ),
    Minimum = c(
      min(runs, na.rm = TRUE), 
      min(boundaries, na.rm = TRUE), 
      min(balls_faced, na.rm = TRUE), 
      min(matches, na.rm = TRUE), 
      min(batting_avg, na.rm = TRUE), 
      min(boundaries_percent, na.rm = TRUE), 
      min(batting_strike_rate, na.rm = TRUE)
    ),
    Maximum = c(
      max(runs, na.rm = TRUE), 
      max(boundaries, na.rm = TRUE), 
      max(balls_faced, na.rm = TRUE), 
      max(matches, na.rm = TRUE), 
      max(batting_avg, na.rm = TRUE), 
      max(boundaries_percent, na.rm = TRUE), 
      max(batting_strike_rate, na.rm = TRUE)
    )
  )

# Rename columns for clarity
colnames(summary_table) <- c("Variable", "Mean", "Median", "Minimum", "Maximum")

# Display Summary Statistics Table ----
# Output the polished table with improved formatting
summary_table %>%
  kable(
    caption = "Summary Statistics for Key Batting Variables", 
    digits = 2, 
    align = c("l", rep("c", 4))
  ) %>%
  kable_styling(
    bootstrap_options = c("striped", "hover", "condensed"), 
    full_width = FALSE, 
    font_size = 14
  ) %>%
  row_spec(0, bold = TRUE)  # Bold header row

# Create Batting Style Comparison Table ----
# Group data by batting style and calculate average metrics
batting_style_comparison <- cleaned_data %>%
  group_by(batting_style) %>%
  summarise(
    Avg_Runs = mean(runs, na.rm = TRUE),
    Avg_Boundaries = mean(boundaries, na.rm = TRUE),
    Avg_Boundaries_Percent = mean(boundaries_percent, na.rm = TRUE),
    Avg_Batting_Avg = mean(batting_avg, na.rm = TRUE),
    Avg_Strike_Rate = mean(batting_strike_rate, na.rm = TRUE)
  )

# Display Batting Style Comparison Table ----
# Output the polished table with improved formatting
batting_style_comparison %>%
  kable(
    caption = "Comparison of Batting Metrics by Batting Style", 
    digits = 2, 
    align = c("l", rep("c", 5))
  ) %>%
  kable_styling(
    bootstrap_options = c("striped", "hover", "condensed"), 
    full_width = FALSE, 
    font_size = 14
  ) %>%
  row_spec(0, bold = TRUE)  # Bold header row

