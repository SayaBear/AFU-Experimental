#!/bin/bash
echo "本脚本集成了来自STCN的minimax4233、wolaiwozhengfu的脚本内容并加以修改，向上述二位大佬表示感谢！"
echo "请确保填写的信息准确，填错了脚本不会有任何提示。";
echo "ASF安装完成后，运行方式是chmod +x ArchiSteamFarm，sudo ./ArchiSteamFarm";
echo "按Enter继续";
echo "输入你的帐号";
read Account
echo "输入你的密码";
read Code
echo -e "是否需要开启高级设置？ \n1.开启 \n2.不开启"
read -r -p "请输入数字" GJ
case $GJ in
  1)echo "请选择您是否要开启功能1？ \n1.开启 \n2.不开启"
    read -r -p "请输入数字 \n" GNA
    echo "请选择您是否要开启功能2？ \n1.开启 \n2.不开启"
	read -r -p "请输入数字 \n" GNB
	GNC=`expr $GNA + $GNB`
	;;
  2)echo "OK"
    ;;
esac
echo -e "是否需要开启通过steam组输入指令功能？ \n1.开启 \n2.不开启"
read -r -p "请输入数字 \n" GP
case $GP in
  1)echo "输入你的steam64位id"
    read ID
    echo "输入你的组id"
    read Group
    touch bot.json
    echo -e "{
    "\"Enabled\"": true,
    "\"SteamLogin\"": "\"$Account\"",
    "\"SteamPassword\"": "\"$Code\"",
    "\"IsBotAccount\"": false,
	"\"IsBotAccount2\"": "\"$GNC\"",
    "\"s_SteamMasterClanID\"": "\"$Group\"",
    "\"SteamUserPermissions\"": {
      "\"$ID\"": 3
    }
  }" > /bot.json
  ;;
  2)touch bot.json
    echo -e "{
    "\"Enabled\"": true,
    "\"SteamLogin\"": "\"$Account\"",
    "\"SteamPassword\"": "\"$Code\"",
	"\"IsBotAccount2\"": "\"$GNC\"",
    "\"IsBotAccount\"": false
  }" > /bot.json
  ;;
esac
echo -e "{
  "\"CurrentCulture\"": "\"zh-CN\"",
  "\"UpdateChannel\"": 0,
}" > /ASF.json