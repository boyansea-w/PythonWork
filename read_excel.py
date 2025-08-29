#安装依赖：确保你已安装 pandas 和 openpyxl（用于读取 .xlsx 文件）：
#py -m pip install pandas openpyxl
#格式化工具
#py -m pip install black

import pandas as pd

def excel_to_map(file_path: str, sheet_name : str, key_col : str, from_row : int, from_col: str, to_row: int, to_col: str):   
    """_summary_
    读取 Excel 指定 sheet 和范围的数据，并将 A 列作为 key 构建字典。   
    参数:
    - file_path (str): 文件路径
    - sheet_name (str): sheet名称
    - key_col (str): 作为键的列
    - from_row (str): 数据范围 Start row
    - from_col (int): 数据范围 Start column
    - to_row (str): 数据范围 End row
    - to_col (int): 数据范围 End column

    Returns:
        dict: 以 from_col 列为键，其他列为值的字典
    """    
    # 提取列范围（例如 A1:G20）和起始行
    data_range = from_col + ":" + to_col

    # 读取数据
    df = pd.read_excel(
        file_path,
        sheet_name=sheet_name,
        usecols=data_range,
        skiprows=0,
        nrows=to_row - from_row + 1
    )
    # 用空字符串填充缺失值(空白Cell)
    df.fillna('', inplace=True)

    # 构建 map：from_col列为 key，其他列为 value（dict）
    data_map = df.set_index(df.columns[0]).to_dict(orient='index')
    return data_map

# 示例调用
if __name__ == '__main__':
    file_path = r'D:\work\PythonWork\PAST0101.xlsx'  # 替换为你的文件路径
    sheet_name = 'Sheet1'

    result_map = excel_to_map(file_path, sheet_name, 'A', 2, 'A', 24, 'H')

    # 打印其中一个 key 的数据
    sample_key = list(result_map.keys())[0]
    print(f"{sample_key}: {result_map[sample_key]}")
    print("列名如下：")
    print(result_map.keys())  # 👈 打印所有列名
