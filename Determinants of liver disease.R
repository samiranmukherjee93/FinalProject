#Using NHANES data to assess the determinants of advanced fibrosis 
#https://wwwn.cdc.gov/nchs/nhanes/continuousnhanes/default.aspx?Cycle=2017-2020
#using machine learning and then plot that geospatially

#Final project

install.packages("haven")

library(haven)

## Replace 'your_data_file.xpt' with the path to your XPT file
demo_data <- read_xpt("P_DEMO.XPT") |> data.frame("P_DEMO.XPT")
hepq_data <- read_xpt("P_HEQ.XPT") |> data.frame("P_HEQ.XPT")
lab_data <- read_xpt("P_BIOPRO.XPT") |> data.frame("P_BIOPRO.XPT")
dmq_data <- read_xpt("P_DIQ.XPT") |> data.frame("P_DIQ.XPT") 
a1c_data <- read_xpt("P_GHB.XPT") |> data.frame("P_GHB.XPT")
hepb_data <- read_xpt("P_HEPBD.XPT") |> data.frame("P_HEPBD.XPT")
hepc_data <- read_xpt("P_HEPC.XPT") |> data.frame("P_HEPC.XPT")
fibroscan_data <- read_xpt("P_LUX.XPT") |> data.frame("P_LUX.XPT")
insurance_data <- read_xpt("P_HIQ.XPT") |> data.frame("P_HIQ.XPT")

head(fibroscan_data)

#Merge each of the tables. To create one master data sheet. Has to happen stepwise

merged_df <- merge(demo_data, hepq_data, by = "SEQN")
merged_df <- merge(merged_df, hepb_data, by = "SEQN")
merged_df <- merge(merged_df, hepc_data, by = "SEQN")
merged_df <- merge(merged_df, lab_data, by = "SEQN")
merged_df <- merge(merged_df, dmq_data, by = "SEQN")
merged_df <- merge(merged_df, a1c_data, by = "SEQN")
merged_df <- merge(merged_df, fibroscan_data, by = "SEQN")
merged_df <- merge(merged_df, insurance_data, by = "SEQN")

##to make an overview_and_introduction



