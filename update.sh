chmod +x ./jq

curl  -H "user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36"  https://covid-19.samsam123.name.my/api/cases?date=latest
rm cases
rm index.html
cp index_temp.html index.html

echo Grabbing the latest cases...
content=$(wget -o cases https://covid-19.samsam123.name.my/api/cases?date=latest)
cases=$( ./jq -r ".cases_new" cases ) 
echo Replacing cases...
sed -i "s/No data/$cases/g" index.html
echo Setting date and time as string...
dateandtime=$( date ) 
sed -i "s/INSERT_DATE_HERE/$dateandtime/g" index.html
echo Removing quotes...
sed -i 's/\"//g' index.html

echo Removing temporary files...
rm cases

echo Pushing to GitHub...
git config --global user.email "tanyuxuan2005@gmail.com"
git config --global user.name "covidcases Update Bot"
git fetch
git add .
git commit -m "Updated on $date"
git push
