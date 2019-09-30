#!/bin/sh
sleep 3
echo "开始更新koolproxy规则"
echo
sleep 3
echo "第一步：下载规则"
echo
echo -e "下载easylistchina广告规则"
wget --no-check-certificate -q -O /tmp/daily.txt https://raw.githubusercontent.com/user1121114685/koolproxyR/master/koolproxyR/koolproxyR/data/rules/easylistchina.txt
echo
echo -e "下载fanboy-annoyance广告规则"
wget --no-check-certificate -q -O /tmp/fanboy-annoyance.txt https://raw.githubusercontent.com/user1121114685/koolproxyR/master/koolproxyR/koolproxyR/data/rules/fanboy-annoyance.txt
echo
echo -e "下载yhost广告规则"
wget --no-check-certificate -q -O /tmp/yhosts.txt https://raw.githubusercontent.com/user1121114685/koolproxyR/master/koolproxyR/koolproxyR/data/rules/yhosts.txt
echo
echo -e "下载kp.dat广告规则"
wget --no-check-certificate -q -O /tmp/kp.dat https://raw.githubusercontent.com/user1121114685/koolproxyR/master/koolproxyR/koolproxyR/data/rules/kp.dat
echo
echo -e "下载kpr_video_list.txt规则"
wget --no-check-certificate -q -O /tmp/kpr_video_list.txt https://raw.githubusercontent.com/user1121114685/koolproxyR/master/koolproxyR/koolproxyR/data/rules/kpr_video_list.txt
echo
echo -e "下载user.txt规则"
wget --no-check-certificate -q -O /tmp/user.txt https://raw.githubusercontent.com/user1121114685/koolproxyR/master/koolproxyR/koolproxyR/data/rules/user.txt
echo
echo
sleep 3
echo "第二步：合并规则"
sleep 3
echo
echo -e "合并yhosts.txt、fanboy-annoyance.txt缓存"
cat /tmp/yhosts.txt /tmp/fanboy-annoyance.txt  > /tmp/koolproxy
echo
echo -e "合并kpr_video_list.txt、kpr_video_list_1.txt缓存"
cat /tmp/kpr_video_list.txt /tmp/user.txt > /tmp/user
echo
echo -e "删除fanboy-annoyance等临时文件"
rm -rf /tmp/yhosts.txt /tmp/fanboy-annoyance.txt  /tmp/kpr_video_list.txt  /tmp/user.txt
echo
sleep 3
echo "第三步：创建表头，这一步可以省略"
echo
echo "adrules_update.sh上这一步是统一广告规则格式，这里不需要"
sleep 3
echo
echo
echo -e "创建koolproxy规则文件头"
echo "
!x  -----------------------------------------------------------------------------------------------------------------
!x  -----[KoolProxy 3.8.4]
!x  -----update[rules]: 2019-04-07 19:40 
!x  -----update[video]: 2019-04-13 23:43
!x  -----Thanks: From lvba Rule Group
!x  -----Thanks for help: <yiclear> <adbyby> <adm> <adblock> <adguard>
" > /tmp/koolproxy.txt
echo
echo -e "创建user规则文件头"
echo "
!x  -----------------------------------------------------------------------------------------------------------------
!x  -----[KoolProxy 3.8.4]
!x  -----Thanks: From lvba Group
!x  -----Thanks for help: <yiclear> <adbyby> <adm> <adblock> <adguard>
!x  -----------------------------------------------------------------------------------------------------------------
!x  -----------------------------------------------------------------------------------------------------------------" > /tmp/user.txt
sleep 3
echo
echo "第四步：去重、并创建新的缓存文件"
echo
echo -e "去重复规则"
sort /tmp/koolproxy | uniq >> /tmp/koolproxy.txt
sort /tmp/user | uniq >> /tmp/user.txt
echo
echo -e "删除临时文件"
echo
rm -rf /tmp/koolproxy  /tmp/user
echo
sleep 3
echo
echo "第五步："
echo
sleep 3
if [ -s "/tmp/koolproxy.txt" ]; then
    mv -f /tmp/koolproxy.txt /root/koolproxy/koolproxy.txt
    rm -f /tmp/koolproxy.txt
fi
echo
if [ -s "/tmp/daily.txt" ]; then
    mv -f /tmp/daily.txt /root/koolproxy/daily.txt
    rm -f /tmp/daily.txt 
fi
echo
echo
if [ -s "/tmp/user.txt" ]; then
    mv -f /tmp/user.txt /root/koolproxy/user.txt
    rm -f /tmp/user.txt 
fi
echo
if [ -s "/tmp/kp.dat" ]; then
    mv -f  /tmp/kp.dat /root/koolproxy/kp.dat
    rm -f /tmp/kp.dat
fi
echo
echo -e "规则更新成功"
echo

exit 0
