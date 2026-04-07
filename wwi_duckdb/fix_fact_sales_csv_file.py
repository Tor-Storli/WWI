import re

input_file = r'C:\Users\storl\Desktop\WWI\wwi_duckdb\wwi_duckdb\seeds\Sale.csv'
output_file = r'C:\Users\storl\Desktop\WWI\wwi_duckdb\wwi_duckdb\seeds\Sale_fixed.csv'

with open(input_file, 'r', encoding='utf-8-sig', errors='replace') as infile:
    content = infile.read()

# 1. Handle "The Gu" specifically first
# Converts """The Gu"" -> 'The Gu'
content = re.sub(r'"""The Gu""', "'The Gu'", content)

# 2. Fix the Tail: Find triple quotes followed by a delimiter or end of string
# Replaces """ with "
content = re.sub(r'"""(?=[,\n\r]|$)', '"', content)

# 3. Fix the Head: Find triple quotes preceded by a delimiter or start of string
# Replaces [delimiter]""" with [delimiter]"'
# We use (\r\n|\n|,|^) to capture what comes before the quotes
content = re.sub(r'(\r\n|\n|,|^)"""', r'\1"\'', content)

with open(output_file, 'w', encoding='utf-8', newline='') as outfile:
    outfile.write(content)

print("Done! Fixed-width issue resolved.")