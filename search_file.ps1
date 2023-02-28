#찾고자 하는 파일에 대한 키워드 확인
$keyword = get-content ".\keyword.txt"

#오늘 날짜 확인
$today = get-date -format "yyyy-MM-dd"

#디렉토리 위치 추가
$dirpath = ".\log\" + $today + "\"

#검토 결과 리포트 파일명
$filepath = $dirpath + $env:username + ".csv"

$data = ""
$result = ""
"설치된 파일을 확인 중입니다. 오류 메시지가 출력 되더라도 걱정하지마세요 `n-to milbongK -"
#오늘날짜로 폴더 만들기
new-item -path $dirpath -type directory

$result = systeminfo
for ($i = 0; $i -lt $keyword.count; $i++) {
    $data = (get-childitem -path C:\, D:\, E:\ -recurse -filter $keyword[$i] | format-table FullName) | out-string
    $keyword[$i]
    $result += "키워드: " + $keyword[$i] + "`n" + $data
"설치된 파일을 확인 중입니다. 오류 메시지가 출력 되더라도 걱정하지마세요 `n-to milbongK -"
}

#파일 결과 내보내기
out-file -filePath $filepath -inputobject $result
