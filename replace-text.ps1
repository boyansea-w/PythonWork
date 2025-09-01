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



# 设置目标文件夹路径
$folderPath = "D:\work\PythonWork"

# 检查文件夹是否存在
if (-Not (Test-Path $folderPath)) {
    Write-Host "文件夹不存在：$folderPath"
    exit
}

# 获取所有文件（不包括子文件夹）
$files = Get-ChildItem -Path $folderPath -File

# 循环处理每个文件
foreach ($file in $files) {
    Write-Host "处理文件：" $file.FullName

    # 示例操作：读取文件内容
    $content = Get-Content -Path $file.FullName -Raw

    # 示例操作：输出文件行数
    $lineCount = ($content -split "`n").Count
    Write-Host "文件行数：" $lineCount

    # 你可以在这里添加更多处理逻辑，比如替换文本、复制文件等
}





假设你有两个文件：

main.ps1：主脚本

child.ps1：被调用的脚本

🧩 child.ps1（接收参数的脚本）
powershell
param (
    [string]$name,
    [int]$age
)

Write-Host "Hello, $name! You are $age years old."
这个脚本使用 param 块来接收两个参数。

🚀 main.ps1（调用脚本并传参）
powershell
