# import pandas as pd
# import glob
# import os

# def combine_csvs(folder_path, output_filename="combined.csv"):
#     """
#     Combines all CSV files in a folder into a single CSV file.

#     Args:
#         folder_path (str): The path to the folder containing the CSV files.
#         output_filename (str, optional): The name of the output CSV file. Defaults to "combined.csv".
#     """
#     all_files = glob.glob(os.path.join(folder_path, "*.csv"))
#     all_df = []
#     for f in all_files:
#         df = pd.read_csv(f)
#         all_df.append(df)
    
#     combined_df = pd.concat(all_df, ignore_index=True)
#     combined_df.to_csv(os.path.join(folder_path, output_filename), index=False)

# # Example usage:
# # folder_path = "/path/to/your/folder"  # Replace with the actual path to your folder
# folder_path = "/Users/ahmed/Desktop/trading_python_files/polygon/all_different_stock_histories"
# combine_csvs(folder_path)






import pandas as pd
import os
import glob

def combine_csvs_with_filename(folder_path, output_filename="combined.csv"):
    """
    Combines all CSV files in a folder into a single CSV, adding a column for the filename.

    Args:
        folder_path (str): The path to the folder containing the CSV files.
        output_filename (str, optional): The name of the output CSV file. Defaults to "combined.csv".
    """
    all_files = glob.glob(os.path.join(folder_path, "*.csv"))

    all_df = []
    for f in all_files:
        df = pd.read_csv(f)
        df['filename'] = os.path.basename(f)
        all_df.append(df)
    
    combined_df = pd.concat(all_df, ignore_index=True)
    combined_df.to_csv(output_filename, index=False)
    print(f"Combined CSV saved to {output_filename}")


folder_path = "/Users/ahmed/Desktop/trading_python_files/polygon/all_different_stock_histories"
combine_csvs_with_filename(folder_path)