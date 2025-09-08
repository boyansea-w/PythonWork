import read_excel
import configparser

# 读取配置文件
iniConfig = configparser.ConfigParser()
iniConfig.read('make_mapper.ini', encoding='utf-8')
inputFile = iniConfig.get('inputfile', 'fileNm')
listSheetNm = iniConfig.get('inputfile', 'listSheetNm')
startRow = iniConfig.getint('inputfile', 'startRow')
startColumn = iniConfig.get('inputfile', 'startColumn')
endColumn = iniConfig.get('inputfile', 'endColumn')
keyColumnNum = iniConfig.getint('inputfile', 'keyColumn')

# 调用函数读取 Excel 并生成映射
result_map = read_excel.excel_to_map(inputFile, listSheetNm, keyColumnNum, startRow, startColumn, 0, endColumn)

# 打印结果
for key, value in result_map.items():


    print(f"{key}: {value}") 