del cases
del index.html
copy index_temp.html index.html

curl -o cases "https://covid-19.samsam123.name.my/api/cases?date=latest"
For /F "Delims=" %%A In ('"curl -s https://covid-19.samsam123.name.my/api/cases?date=latest | backend\jq .cases_new"')Do Set cases_new=%%~A

backend\fart index.html "No data" %cases_new%


git config --global user.email "tanyuxuan2005@gmail.com"
git config --global user.name "covidcases Update Bot"
git add .
git commit -m "Updated %date:~4,11% %date:~0,3% %time:~0,2%:%time:~3,2%:%time:~6,2%"
git push