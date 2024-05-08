import re
import pandas as pd

errors = []

with open('build.log', 'r') as file:
    data = file.readlines()
    pattern = r"\[(\w+)\]\s*(\S+)\s*(\S+)\s*(.+)$"

    for line in data:
        match = re.match(pattern, line.strip())
        if match:
            groups = match.groups()
            category = groups[0]
            file_path = groups[1]
            severity = groups[2]
            error_message = groups[3]

            error_code = None
            if severity == "error":
                error_code_match = re.search(r'error:\s*(\d+)', error_message, re.IGNORECASE)
                if error_code_match:
                    error_code = error_code_match.group(1)

            error_type = "Error" if severity == "error" else "Warning"

            error = {
                'Error Type': error_type,
                'Error Code': error_code,
                'Error Message': error_message,
            }

            errors.append(error)

df = pd.DataFrame(errors)
df.to_excel('newParser3.xlsx', index=False)
