#!/bin/bash
echo "本脚本集成了来自STCN的minimax4233、wolaiwozhengfu的脚本内容并加以修改，向上述二位大佬表示感谢！"
echo "请确保填写的信息准确，填错了脚本不会有任何提示。";
echo "ASF安装完成后，运行方式是chmod +x ArchiSteamFarm，sudo ./ArchiSteamFarm";
echo "按Enter继续";
echo "输入你的帐号";
read Account
echo "输入你的密码";
read Code
sudo apt-get update
sudo apt-get install libicu-dev
sudo apt install unzip
sudo apt install screen
wget https://github.com/JustArchi/ArchiSteamFarm/releases/download/3.3.0.3/ASF-linux-x64.zip
unzip ASF-linux-x64.zip -d ASF/
echo -e "请选择您是需要单纯挂卡还是需要进行进阶操作 \n1.单纯挂卡 \n2.进阶操作"
read -r -p "请输入数字" IL
case $IL in
  1)cd ASF/config
    touch bot.json
    echo -e "{
    "\"Enabled\"": true,
    "\"SteamLogin\"": "\"$Account\"",
    "\"SteamPassword\"": "\"$Code\"",
    "\"IsBotAccount\"": false
  }" > /root/ASF/config/bot.json
  ;;
  2)echo -e "是否需要开启通过steam组输入指令功能？ \n1.开启 \n2.不开启 \n请输入数字";
    read GP
    case $GP in
    1)echo "输入你的steam64位id"
      read ID
      echo "输入你的组id"
      read Group
	  echo -e "请选择您期待的挂卡顺序 \n0.无序模式 \n1.根据AppID正序挂卡 \n2.根据AppID逆序挂卡 \n3.根据剩余掉卡数自少到多挂卡 \n4.根据剩余挂卡数自多到少挂卡 \n5.根据游戏时间自少到多挂卡 \n6.根据游戏时间自多到少挂卡 \n7.根据游戏名A-Z挂卡 \n8.根据游戏名Z-A挂卡 \n9.随机模式 \n10.根据徽章等级由低到高挂卡 \n11.根据徽章等级由高到低挂卡 \n12.根据游戏入库时间由远及近挂卡 \n13.根据游戏入库时间由近及远挂卡 \n14.优先挂不可交易卡牌 \n15.优先挂可交易卡牌"
	  read Order #check
      cd ASF/config
      touch bot.json
      echo -e "{
      "\"Enabled\"": true,
      "\"SteamLogin\"": "\"$Account\"",
      "\"SteamPassword\"": "\"$Code\"",
      "\"IsBotAccount\"": false,
      "\"s_SteamMasterClanID\"": "\"$Group\"",
      "\"SteamUserPermissions\"": {
        "\"$ID\"": 3
		},
	  "\"TradingPreferences\"": "\"$Order\"",
	  "\"AcceptGifts\"": "\"$GT\"",
	  "\"LootableTypes\"": [
	    "\"$LO\""
      ],
	  "\"MatchableTypes\"": [
	    "\"$MA\""
      ],
	  "\"AutoSteamSaleEvent\"": "\"$SL\"",
	  "\"OnlineStatus\"": "\"$Status\"",
	  "\"SendOnFarmingFinished\"": "\"$FS\"",
	  "\"IdlePriorityQueueOnly\"": "\"$QE\"",
	  "\"IdleRefundableGames\"": "\"$FD\"",
	  "\"ShutdownOnFarmingFinished\"": "\"$SD\"",
	  "\"CustomGamePlayedWhileFarming\"": "\"$CT\"",
	  "\"CustomGamePlayedWhileIdle\"": "\"$CM\"",
	  "\"GamesPlayedWhileIdle\"": [
	    "\"$GP\""
     }" > /root/ASF/config/bot.json #check
	  echo -e "请选择您是否要自动接受礼物 \n1.是 \n2.否"
	  read GF
	  if [ $GF == 1 ]; then
	    sed -i 's/GT/True/' /root/ASF/config/bot.json
	  else
	    sed -i 's/GT/False/' /root/ASF/config/bot.json
	  fi
	  
     ;;
    2)cd ASF/config
      touch bot.json
      echo -e "{
      "\"Enabled\"": true,
      "\"SteamLogin\"": "\"$Account\"",
      "\"SteamPassword\"": "\"$Code\"",
      "\"IsBotAccount\"": false
    }" > /root/ASF/config/bot.json
    ;;
	esac
  ;;
esac
echo -e "{
  "\"CurrentCulture\"": "\"zh-CN\"",
  "\"UpdateChannel\"": 0,
}" > /root/ASF/config/ASF.json
cd /root/ASF
screen -U -S ASF
