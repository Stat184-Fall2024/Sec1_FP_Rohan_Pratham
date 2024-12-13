# Load Required Libraries ----
library(ggplot2)
library(reshape2)
library(dplyr)

# Load Cleaned Data ----
# Load the cleaned dataset prepared in the previous script
cleaned_data <- read.csv(
  file = "Cleaned_Merged_Player_Data.csv"
)

# Correlation Heatmap ----
# Select relevant columns for correlation analysis
correlation_data <- cleaned_data %>%
  select(
    batting_strike_rate, 
    runs, 
    boundaries, 
    boundaries_percent, 
    balls_faced, 
    matches, 
    batting_avg
  )

# Calculate the correlation matrix
cor_matrix <- cor(
  correlation_data, 
  use = "complete.obs"
)

# Melt the correlation matrix for heatmap visualization
cor_melted <- melt(cor_matrix)

# Create and display the correlation heatmap
ggplot(data = cor_melted, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile(color = "white") +
  scale_fill_gradient2(
    low = "blue", 
    high = "red", 
    mid = "white", 
    midpoint = 0, 
    limit = c(-1, 1), 
    name = "Correlation"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1),
    axis.title = element_blank()
  ) +
  labs(
    title = "Correlation Heatmap of Key Batting Variables"
  )

# Scatter Plots for Key Metrics ----
# Function to create scatter plots
create_scatter_plot <- function(x_var, x_label) {
  ggplot(data = cleaned_data, aes_string(x = x_var, y = "batting_strike_rate", color = "batting_style")) +
    geom_point(alpha = 0.6) +
    geom_smooth(method = "loess", color = "gray50", se = FALSE) +
    labs(
      title = paste("Batting Strike Rate vs", x_label, "by Batting Style"),
      x = x_label,
      y = "Batting Strike Rate",
      color = "Batting Style"
    ) +
    theme_minimal() +
    theme(
      legend.position = "bottom",
      plot.title = element_text(size = 16, face = "bold"),
      axis.title = element_text(size = 12),
      legend.title = element_text(size = 10),
      legend.text = element_text(size = 9)
    )
}

# Generate scatter plots for different metrics
create_scatter_plot("runs", "Runs")
create_scatter_plot("boundaries", "Boundaries")
create_scatter_plot("boundaries_percent", "Boundaries Percentage")
create_scatter_plot("balls_faced", "Balls Faced")
create_scatter_plot("matches", "Matches")
create_scatter_plot("batting_avg", "Batting Average")

# Boxplot for Batting Strike Rate by Batting Style ----
ggplot(data = cleaned_data, aes(x = batting_style, y = batting_strike_rate, fill = batting_style)) +
  geom_boxplot(alpha = 0.7, outlier.color = "red", outlier.shape = 16, outlier.size = 2) +
  labs(
    title = "Batting Strike Rate Distribution by Batting Style",
    x = "Batting Style",
    y = "Batting Strike Rate",
    fill = "Batting Style"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 16, face = "bold"),
    axis.title = element_text(size = 12),
    legend.position = "none"
  )

# Histogram of Batting Strike Rate ----
ggplot(data = cleaned_data, aes(x = batting_strike_rate)) +
  geom_histogram(binwidth = 10, fill = "steelblue", color = "black", alpha = 0.7) +
  labs(
    title = "Distribution of Batting Strike Rate",
    x = "Batting Strike Rate",
    y = "Frequency"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 16, face = "bold"),
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 10)
  )

# Boxplot for Batting Average by Batting Style ----
ggplot(data = cleaned_data, aes(x = batting_style, y = batting_avg, fill = batting_style)) +
  geom_boxplot(alpha = 0.7) +
  labs(
    title = "Batting Average by Batting Style",
    x = "Batting Style",
    y = "Batting Average",
    fill = "Batting Style"
  ) +
  theme_minimal()

# Boxplot for Boundaries by Batting Style ----
ggplot(data = cleaned_data, aes(x = batting_style, y = boundaries, fill = batting_style)) +
  geom_boxplot(alpha = 0.7) +
  labs(
    title = "Boundaries by Batting Style",
    x = "Batting Style",
    y = "Boundaries",
    fill = "Batting Style"
  ) +
  theme_minimal()

# Stacked Bar Chart for Total Boundaries by Batting Style ----
ggplot(data = cleaned_data, aes(x = batting_style, y = boundaries, fill = batting_style)) +
  geom_bar(stat = "identity", alpha = 0.8) +
  labs(
    title = "Total Boundaries by Batting Style",
    x = "Batting Style",
    y = "Total Boundaries",
    fill = "Batting Style"
  ) +
  theme_minimal()
