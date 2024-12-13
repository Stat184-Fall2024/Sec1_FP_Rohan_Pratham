# Load Required Packages ----
library(dplyr)

# Load Datasets ----
# Load the primary dataset containing IPL player statistics
primary_data <- read.csv(
  file = "/Users/rohan1809/Desktop/STAT 184/Sec1_FP_Rohan_Pratham/data/IPL Player Stat.csv"
)

# Load the secondary dataset with additional player details
secondary_data <- read.csv(
  file = "/Users/rohan1809/Desktop/STAT 184/2024_players_details.csv"
)

# Preprocessing: Rename Columns ----
# Rename the `player` column in the primary dataset to match for joining
primary_data <- primary_data %>%
  rename(Name = player)

# Merge Datasets ----
# Perform a left join to combine datasets based on the `Name` column
merged_data <- primary_data %>%
  left_join(
    secondary_data,
    by = "Name"
  )

# Filter Merged Data ----
# Remove rows with missing values in the `longBattingStyles` column
filtered_merged_data <- merged_data %>%
  filter(!is.na(longBattingStyles))

# View and Save Filtered Data ----
# Check the structure of the filtered data
str(filtered_merged_data)
# View the filtered data in a tabular format
View(filtered_merged_data)
# Save the filtered merged dataset to a CSV file
write.csv(
  filtered_merged_data,
  file = "Merged_Player_Data.csv",
  row.names = FALSE
)

# Data Cleaning and Selection ----
# Select relevant columns, rename for clarity, and filter data
cleaned_data <- filtered_merged_data %>%
  select(
    Name,                  # Player's name
    runs,                  # Total runs scored
    boundaries,            # Number of boundaries
    boundaries_percent,    # Percentage of boundaries
    balls_faced,           # Total balls faced
    matches,               # Number of matches played
    batting_avg,           # Batting average
    batting_strike_rate,   # Strike rate
    longBattingStyles      # Batting style (e.g., left-hand/right-hand)
  ) %>%
  rename(
    batting_style = longBattingStyles  # Rename for clarity
  ) %>%
  filter(
    balls_faced > 100  # Include only players who faced more than 100 balls
  )

# View and Save Cleaned Data ----
# View the cleaned data
View(cleaned_data)
# Save the cleaned dataset to a new CSV file
write.csv(
  cleaned_data,
  file = "Cleaned_Merged_Player_Data.csv",
  row.names = FALSE
)
