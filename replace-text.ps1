# 设置路径
$sourcePath = "D:\work\PythonWork\test.txt"
$targetPath = "D:\work\PythonWork\test2.txt"

# 创建 UTF8 无 BOM 编码对象
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

# 使用 StreamReader 读取原始内容（确保按 UTF8 无 BOM 读取）
$reader = New-Object System.IO.StreamReader($sourcePath, $utf8NoBom)
$content = $reader.ReadToEnd()
$reader.Close()

# 替换内容
$updatedContent = $content -replace "1234", "9999"

# 使用 StreamWriter 写入新文件（确保按 UTF8 无 BOM 写入）
$writer = New-Object System.IO.StreamWriter($targetPath, $false, $utf8NoBom)
$writer.Write($updatedContent)
$writer.Close()


#执行
# powershell -ExecutionPolicy Bypass -File "D:\work\PythonWork\replace-text.ps1"
