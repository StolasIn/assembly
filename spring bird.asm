;___________________________________________________________________________
;
;遊戲主題 : spring bird
;製作遊戲原因 : 組合語言專題
;遊戲製造時間 : 2020/11/16 ~ 2020/1/16
;遊戲製造者 : StolasIn
;目前遊戲版本 : version 6 持續更新中
;遊戲遊玩方式 : 按下space建後 鳥會向上飛一格 請以此能力盡量通過障礙物
;遊戲來源參考 : flappy bird
;遊戲使用語言 : assembly language x8086 masm
;使用ide : visual studio 2019
;使用library : irvine's library
;參考資料來源 : Assembly Language for x86 Processors 7 edition / Irvine
;___________________________________________________________________________


include irvine32.inc

ExitProcess proto,dwExitCode:dword

.data
;主要場景設定-------------------------------------------------------------------------------------------------

;初始場景設定
vbegin byte "________________________________________________________________________________________________________________",0
v1  byte "|                    *******                      *****                       *****                       ***** |",0
v2  byte "|                    *******                      *****                       *****                       ***** |",0
v3  byte "|                                                *******                      *****                       ***** |",0
v4  byte "|                                                *******                      *****                       ***** |",0
v5  byte "|                                                                             *****                       ***** |",0
v6  byte "|                                                                             *****                       ***** |",0
v7  byte "|                                                                             *****                       ***** |",0
v8  byte "|                                                                             *****                      *******|",0
v9  byte "|                    *******                                                  *****                      *******|",0
v10 byte "|                    *******                                                  *****                             |",0
v11 byte "|                     *****                      *******                      *****                             |",0
v12 byte "|                     *****                      *******                     *******                            |",0
v13 byte "|                     *****                       *****                      *******                            |",0
v14 byte "|                     *****                       *****                                                         |",0
v15 byte "|                     *****                       *****                                                         |",0
v16 byte "|                     *****                       *****                                                  *******|",0
v17 byte "|                     *****                       *****                         $                        *******|",0
v18 byte "|                     *****                       *****                                                   ***** |",0
v19 byte "|                     *****                       *****                                                   ***** |",0
v20 byte "|                     *****                       *****                      *******                      ***** |",0
vend byte "_________________________________________________________________________________________________________________",0





;歡迎場景
v_wel1  byte "                ____    __    ____  _______  __        ______   ______   .___  ___.  _______               ",0
v_wel2  byte "                \   \  /  \  /   / |   ____||  |      /      | /  __  \  |   \/   | |   ____|              ",0
v_wel3  byte "                 \   \/    \/   /  |  |__   |  |     |  ,----'|  |  |  | |  \  /  | |  |__                 ",0
v_wel4  byte "                  \            /   |   __|  |  |     |  |     |  |  |  | |  |\/|  | |   __|                ",0
v_wel5  byte "                   \    /\    /    |  |____ |  `----.|  `----.|  `--'  | |  |  |  | |  |____               ",0
v_wel6  byte "                    \__/  \__/     |_______||_______| \______| \______/  |__|  |__| |_______|              ",0
v_wel7  byte "                                                                                                           ",0
v_wel8  byte "         _______..______   .______       __  .__   __.   _______    .______    __  .______       _______   ",0
v_wel9  byte "        /       ||   _  \  |   _  \     |  | |  \ |  |  /  _____|   |   _  \  |  | |   _  \     |       \  ",0
v_wel10 byte "       |   (----`|  |_)  | |  |_)  |    |  | |   \|  | |  |  __     |  |_)  | |  | |  |_)  |    |  .--.  | ",0
v_wel11 byte "        \   \    |   ___/  |      /     |  | |  . `  | |  | |_ |    |   _  <  |  | |      /     |  |  |  | ",0
v_wel12 byte "    .----)   |   |  |      |  |\  \----.|  | |  |\   | |  |__| |    |  |_)  | |  | |  |\  \----.|  '--'  | ",0
v_wel13 byte "    |_______/    | _|      | _| `._____||__| |__| \__|  \______|    |______/  |__| | _| `._____||_______/  ",0





;使用者遊戲設定場景
v_set1 byte "  _______      ___      .___  ___.  _______         _______. _______ .___________.",0
v_set2 byte " /  _____|    /   \     |   \/   | |   ____|       /       ||   ____||           |",0
v_set3 byte "|  |  __     /  ^  \    |  \  /  | |  |__         |   (----`|  |__   `---|  |----`",0
v_set4 byte "|  | |_ |   /  /_\  \   |  |\/|  | |   __|         \   \    |   __|      |  |     ",0
v_set5 byte "|  |__| |  /  _____  \  |  |  |  | |  |____    .----)   |   |  |____     |  |     ",0
v_set6 byte " \______| /__/     \__\ |__|  |__| |_______|   |_______/    |_______|    |__|     ",0





;infinity遊戲場景
inf1 byte " __ __   ___   __ __       ____  ____     ___      ____  ____   _____  ____  ____   ____  ______  __ __      __ ",0
inf2 byte "|  |  | /   \ |  |  |     /    ||    \   /  _]    |    ||    \ |     ||    ||    \ |    ||      ||  |  |    |  |",0
inf3 byte "|  |  ||     ||  |  |    |  o  ||  D  ) /  [_      |  | |  _  ||   __| |  | |  _  | |  | |      ||  |  |    |  |",0
inf4 byte "|  ~  ||  O  ||  |  |    |     ||    / |    _]     |  | |  |  ||  |_   |  | |  |  | |  | |_|  |_||  ~  |    |__|",0
inf5 byte "|___, ||     ||  :  |    |  _  ||    \ |   [_      |  | |  |  ||   _]  |  | |  |  | |  |   |  |  |___, |     __ ",0
inf6 byte "|     ||     ||     |    |  |  ||  .  \|     |     |  | |  |  ||  |    |  | |  |  | |  |   |  |  |     |    |  |",0
inf7 byte "|____/  \___/  \__,_|    |__|__||__|\_||_____|    |____||__|__||__|   |____||__|__||____|  |__|  |____/     |__|",0





;重製後的場景設定
v1_ori  byte "|                    *******                      *****                       *****                       ***** |",0
v2_ori  byte "|                    *******                      *****                       *****                       ***** |",0
v3_ori  byte "|                                                *******                      *****                       ***** |",0
v4_ori  byte "|                                                *******                      *****                       ***** |",0
v5_ori  byte "|                                                                             *****                       ***** |",0
v6_ori  byte "|                                                                             *****                       ***** |",0
v7_ori  byte "|                                                                             *****                       ***** |",0
v8_ori  byte "|                                                                             *****                      *******|",0
v9_ori  byte "|                    *******                                                  *****                      *******|",0
v10_ori byte "|                    *******                                                  *****                             |",0
v11_ori byte "|                     *****                      *******                      *****                             |",0
v12_ori byte "|                     *****                      *******                     *******                            |",0
v13_ori byte "|                     *****                       *****                      *******                            |",0
v14_ori byte "|                     *****                       *****                                                         |",0
v15_ori byte "|                     *****                       *****                                                         |",0
v16_ori byte "|                     *****                       *****                                                  *******|",0
v17_ori byte "|                     *****                       *****                        $                         *******|",0
v18_ori byte "|                     *****                       *****                                                   ***** |",0
v19_ori byte "|                     *****                       *****                                                   ***** |",0
v20_ori byte "|                     *****                       *****                      *******                      ***** |",0





;死亡場景
v_dead1  byte "                                  ___           ___           ___           ___      ",0
v_dead2  byte "                                 /  /\         /  /\         /__/\         /  /\     ",0
v_dead3  byte "                                /  /:/_       /  /::\       |  |::\       /  /:/_    ",0
v_dead4  byte "                               /  /:/ /\     /  /:/\:\      |  |:|:\     /  /:/ /\   ",0
v_dead5  byte "                              /  /:/_/::\   /  /:/~/::\   __|__|:|\:\   /  /:/ /:/_  ",0
v_dead6  byte "                             /__/:/__\/\:\ /__/:/ /:/\:\ /__/::::| \:\ /__/:/ /:/ /\ ",0
v_dead7  byte "                             \  \:\ /~~/:/ \  \:\/:/__\/ \  \:\~~\__\/ \  \:\/:/ /:/ ",0
v_dead8  byte "                              \  \:\  /:/   \  \::/       \  \:\        \  \::/ /:/  ",0
v_dead9  byte "                               \  \:\/:/     \  \:\        \  \:\        \  \:\/:/   ",0
v_dead10 byte "                                \  \::/       \  \:\        \  \:\        \  \::/    ",0
v_dead11 byte "                                 \__\/         \__\/         \__\/         \__\/     ",0
v_dead12 byte "                                  ___                        ___           ___       ",0
v_dead13 byte "                                 /  /\          ___         /  /\         /  /\      ",0
v_dead14 byte "                                /  /::\        /__/\       /  /:/_       /  /::\     ",0
v_dead15 byte "                               /  /:/\:\       \  \:\     /  /:/ /\     /  /:/\:\    ",0
v_dead16 byte "                              /  /:/  \:\       \  \:\   /  /:/ /:/_   /  /:/~/:/    ",0
v_dead17 byte "                             /__/:/ \__\:\  ___  \__\:\ /__/:/ /:/ /\ /__/:/ /:/___  ",0
v_dead18 byte "                             \  \:\ /  /:/ /__/\ |  |:| \  \:\/:/ /:/ \  \:\/:::::/  ",0
v_dead19 byte "                              \  \:\  /:/  \  \:\|  |:|  \  \::/ /:/   \  \::/~~~~   ",0
v_dead20 byte "                               \  \:\/:/    \  \:\__|:|   \  \:\/:/     \  \:\       ",0
v_dead21 byte "                                \  \::/      \__\::::/     \  \::/       \  \:\      ",0
v_dead22 byte "                                 \__\/           ~~~~       \__\/         \__\/      ",0






;獲勝場景
win1  byte "                  yyyyyyy           yyyyyyy        ooooooooooo          uuuuuu    uuuuuu             ",0         
win2  byte "                   y:::::y         y:::::y       oo:::::::::::oo        u::::u    u::::u             ",0         
win3  byte "                    y:::::y       y:::::y       o:::::::::::::::o       u::::u    u::::u             ",0        
win4  byte "                     y:::::y     y:::::y        o:::::ooooo:::::o       u::::u    u::::u             ",0         
win5  byte "                      y:::::y   y:::::y         o::::o     o::::o       u::::u    u::::u             ",0         
win6  byte "                       y:::::y y:::::y          o::::o     o::::o       u::::u    u::::u             ",0         
win7  byte "                        y:::::y:::::y           o::::o     o::::o       u::::u    u::::u             ",0         
win8  byte "                         y:::::::::y            o::::o     o::::o       u:::::uuuu:::::u             ",0         
win9  byte "                          y:::::::y             o:::::ooooo:::::o       u:::::::::::::::uu           ",0       
win10 byte "                           y:::::y              o:::::::::::::::o        u:::::::::::::::u           ",0       
win11 byte "                          y:::::y                oo:::::::::::oo          uu::::::::uu:::u           ",0       
win12 byte "                         y:::::y                   ooooooooooo              uuuuuuuu  uuuu           ",0       
win13 byte "                        y:::::y                                                                      ",0       
win14 byte "                       y:::::y                                                                       ",0       
win15 byte "                      y:::::y                                   iiii                                 ",0       
win16 byte "                     y:::::y                                   i::::i                                ",0       
win17 byte "                    yyyyyyy                                     iiii                                 ",0          
win18 byte "                                                                                                     ",0            
win19 byte "                  wwwwwww           wwwww           wwwwwww   iiiiiii   nnnn  nnnnnnnn               ",0   
win20 byte "                   w:::::w         w:::::w         w:::::w    i:::::i   n:::nn::::::::nn             ",0 
win21 byte "                    w:::::w       w:::::::w       w:::::w      i::::i   n::::::::::::::nn            ",0
win22 byte "                     w:::::w     w:::::::::w     w:::::w       i::::i   nn:::::::::::::::n           ",0
win23 byte "                      w:::::w   w:::::w:::::w   w:::::w        i::::i     n:::::nnnn:::::n           ",0
win24 byte "                       w:::::w w:::::w w:::::w w:::::w         i::::i     n::::n    n::::n           ",0
win25 byte "                        w:::::w:::::w   w:::::w:::::w          i::::i     n::::n    n::::n           ",0
win26 byte "                         w:::::::::w     w:::::::::w           i::::i     n::::n    n::::n           ",0
win27 byte "                          w:::::::w       w:::::::w           i::::::i    n::::n    n::::n           ",0
win28 byte "                           w:::::w         w:::::w            i::::::i    n::::n    n::::n           ",0
win29 byte "                            w:::w           w:::w             i::::::i    n::::n    n::::n           ",0
win30 byte "                             www             www              iiiiiiii    nnnnnn    nnnnnn           ",0





easter1  byte "            _______  __   __       _______  __   __  ___   _______                            ",0
easter2  byte "           |   _   ||  | |  |     |       ||  | |  ||   | |       |                           ",0
easter3  byte "           |  |_|  ||  |_|  |     |  _____||  |_|  ||   | |_     _|                           ",0
easter4  byte "           |       ||       |     | |_____ |       ||   |   |   |                             ",0
easter5  byte "           |       ||       |     |_____  ||       ||   |   |   |                             ",0
easter6  byte "           |   _   ||   _   |      _____| ||   _   ||   |   |   |                             ",0
easter7  byte "           |__| |__||__| |__|     |_______||__| |__||___|   |___|                             ",0
easter8  byte "            __   __  _______  ______    _______       _     _  _______       _______  _______ ",0
easter9  byte "           |  | |  ||       ||    _ |  |       |     | | _ | ||       |     |       ||       |",0
easter10 byte "           |  |_|  ||    ___||   | ||  |    ___|     | || || ||    ___|     |    ___||   _   |",0
easter11 byte "           |       ||   |___ |   |_||_ |   |___      |       ||   |___      |   | __ |  | |  |",0
easter12 byte "           |       ||    ___||    __  ||    ___|     |       ||    ___|     |   ||  ||  |_|  |",0
easter13 byte "           |   _   ||   |___ |   |  | ||   |___      |   _   ||   |___      |   |_| ||       |",0           
easter14 byte "           |__| |__||_______||___|  |_||_______|     |__| |__||_______|     |_______||_______|",0
easter15 byte "            _______  _______  _______  ___   __    _                                          ",0
easter16 byte "           |   _   ||       ||   _   ||   | |  |  | |                                         ",0
easter17 byte "           |  |_|  ||    ___||  |_|  ||   | |   |_| |                                         ",0
easter18 byte "           |       ||   | __ |       ||   | |       |                                         ",0
easter19 byte "           |       ||   ||  ||       ||   | |  _    |                                         ",0
easter20 byte "           |   _   ||   |_| ||   _   ||   | | | |   |                                         ",0
easter21 byte "           |__| |__||_______||__| |__||___| |_|  |__|                                         ",0





;使用一個array of offset減少取值難度
vb dword v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11,v12,v13,v14,v15,v16,v17,v18,v19,v20

;初始場景設定
vb_ori dword v1_ori,v2_ori,v3_ori,v4_ori,v5_ori,v6_ori,v7_ori,v8_ori,v9_ori,v10_ori,v11_ori,v12_ori,v13_ori,v14_ori,v15_ori,v16_ori,v17_ori,v18_ori,v19_ori,v20_ori

;死亡場景設定
v_dead_b dword v_dead1,v_dead2,v_dead3,v_dead4,v_dead5,v_dead6,v_dead7,v_dead8,v_dead9,v_dead10,v_dead11,v_dead12,v_dead13,v_dead14,v_dead15,v_dead16,v_dead17,v_dead18,v_dead19,v_dead20,v_dead21,v_dead22

;welcome場景設定
v_wel_b dword v_wel1,v_wel2,v_wel3,v_wel4,v_wel5,v_wel6,v_wel7,v_wel8,v_wel9,v_wel10,v_wel11,v_wel12,v_wel13

;使用者設定場景
v_set_b dword v_set1,v_set2,v_set3,v_set4,v_set5,v_set6

;獲勝場景設定
v_win_b dword win1,win2,win3,win4,win5,win6,win7,win8,win9,win10,win11,win12,win13,win14,win15,win16,win17,win18,win19,win20,
				win21,win22,win23,win24,win25,win26,win27,win28,win29,win30

;彩蛋場景設定
v_easter_b dword easter1,easter2,easter3,easter4,easter5,easter6,easter7,easter8,easter9,easter10,easter11,easter12,
					easter13,easter14,easter15,easter16,easter17,easter18,easter19,easter20,easter21

;二維陣列設定結束



;輸出語句區塊-------------------------------------------------------------------------------------------------

;進入遊戲後的歡迎語句
greeting byte "welcome to my assembly language project",0dh,0ah,
				"fake flappy bird",0dh,0ah,"So... have fun!!!",0

;介紹規則時的底線設計
q1 byte "                 ____________________________________________________________________________",0


;遊戲設定的詢問語句
questions byte    "                 1. please set the pipe randomize of the range property before the game start",0dh,0ah,
                  "                 2. (each question must be entry two Integer which is smaller and larger)",0dh,0ah,
                  "                 3. The width of a pipe :",0dh,0ah,
                  "                 4. Distance between two pipe :",0dh,0ah,
                  "                 5. If you want to set default value (entry 'd' in the next page)",0


;違法輸入
invalid_input byte "invalid input please set again",0 

;default詢問
question_use_defalut byte "use our recommend game mode ? : ",0dh,0ah,"press 'd' if you want to use default mode, or press any other key in the keyboard",0

;水管寬度讀入
question_set_pipe_width byte "entry two Integer to set the range of pipe width : ",0

;水管間距讀入
question_set_pipe_between byte "entry two Integer to set the distance of two pipe : ",0

;分數語句
score byte "you score is : ",0


;about彩蛋
about_me byte "這是一個由我(StolasIn)獨立製作的遊戲，也是第一個做出來的遊戲",0dh,0ah,
				"如果有人能發現到這個彩蛋，那代表你真的很用心在看這個code",0dh,0ah,
				"不得不說在用組合語言寫的時候真的非常痛苦，特別是在加彩蛋時",0dh,0ah,
				"但如果能被發現的話，那一切也都值得了，畢竟一個彩蛋最輝煌的時候就是被找到的時候",0dh,0ah,
				"最後, 88",0

;獲得錢語句
coin_msg byte "you got a coin , very great",0

;清除獲得錢語句
clear_coin_msg byte "                           ",0


;使用者輸入條件介紹
input1_width_msg byte "input first number in the range [3~7] : ",0
input2_width_msg byte "input first number in the range [3~7] : ",0
input1_open_msg byte "input second number in the range [18~30] : ",0
input2_open_msg byte "input second number in the range [18~30] : ",0


;現在的delay
current_delay_msg byte "current delay is : ",0

;最大分數
max_score_msg byte "you best score is : ",0

;等待語句
begin_animation_msg byte "press SPACE to start !!!",0


;視窗語句設定
caption_ask byte "play again ?",0
question_ask byte "thank you for playing this game",0dh,0ah,"do you want to play again ?",0


;輸出分數外框
fence byte "########################",0
fence1 byte "#####################",0
fence2 byte "##########################",0
one_fence byte "#",0


;輸入名字
input_name byte "please input you name : ",0

;歡迎語句
welcome_msg byte "welcome ",0

;創作者模式
infinity_msg byte "You are Infinity!!!",0


;鳥身體相關-------------------------------------------------------------------------------------------------

;bird body type
bird_body1 byte  "wVw",0
bird_body2 byte "{o,o}",0
bird_body3 byte "/)  )",0
bird_body4 byte  'b b',0

;small 鳥身體
small_bird_body byte "%",0


;鳥死亡動畫設定

;初始點
bird_dead_point byte "*",0

;第一層爆炸
bird_dead1 byte "  |  ",0
bird_dead2 byte " \ / ",0
bird_dead3 byte "-   -",0
bird_dead4 byte " / \ ",0
bird_dead5 byte "  |  ",0

;第二層爆炸
bird_dead_a1 byte "  *  ",0
bird_dead_a2 byte " * * ",0
bird_dead_a3 byte "*   *",0
bird_dead_a4 byte " * * ",0
bird_dead_a5 byte "  *  ",0

;初始化鳥的位置
bird_position_x byte 7
bird_position_y byte 7


;flag control-------------------------------------------------------------------------------------------------

;初始flag
bird_jump_flag byte 0

;small 設定
flag_bird_body byte 0

;是否要檢查鳥的位置，infinity模式使用
position_check_flag byte 0

;是否開啟infinity模式
infinity_flag byte 0

;是否開啟reverse模式
reverse_flag byte 0


;水管相關參數-------------------------------------------------------------------------------------------------

;水管每次更新時使用的字串
repl byte 20 dup(?),0


;使用者格式化輸入條件
rand_pipeBetween_range1 dword ?  
rand_pipeBetween_range2 dword ?
rand_pipe_wigth_range1 dword ?
rand_pipe_wigth_range2 dword ?


;用來記錄randrange產生的場景樣貌
rand_pipe_wigth sdword ?
rand_pipeBetween sdword ?
rand_open_width sdword ?
rand_open_position sdword ?

;錢的生成座標
rand_gen_score_x sdword -1
rand_gen_score_y sdword -1

;是否印完
check byte 0


;彩蛋相關參數-------------------------------------------------------------------------------------------------

player_name byte 100 dup(0)
byteCount dword ?

coin_chence byte 9


;記數用參數-------------------------------------------------------------------------------------------------

cnt dword ?
cnt2 dword ?
cnt3 dword 0

;分數最大值
max dword 0

;程式開始的時間
starttime dword ?

;控制目前的delay
delay_con dword 250


;資料宣告完畢，接下來是程式碼區
.code


;印出死亡場景-------------------------------------------------------------------------------------------------
print_dead_all proc
	call clrscr

	xor esi,esi
	mov ecx,22
	loop_print_dead_all:
		mov edx,v_dead_b[esi]
		call writeString
		call crlf
		add esi,4
	loop loop_print_dead_all

	ret
print_dead_all endp
;end



;印出歡迎場景-------------------------------------------------------------------------------------------------
print_wel_all proc
	call clrscr
	
	xor esi,esi
	mov ecx,13
	loop_print_wel_all:
		mov edx,v_wel_b[esi]
		call writeString
		call crlf
		add esi,4
	loop loop_print_wel_all

	ret
print_wel_all endp
;end



;印出easter場景-------------------------------------------------------------------------------------------------
print_easter_all proc
	call clrscr
	
	xor esi,esi
	mov ecx,21
	loop_print_easter_all:
		mov edx,v_easter_b[esi]
		call writeString
		call crlf
		add esi,4
	loop loop_print_easter_all

	ret
print_easter_all endp
;end



;印出win場景-------------------------------------------------------------------------------------------------
print_win_all proc
	call clrscr
	
	xor esi,esi
	mov ecx,30
	loop_print_win_all:
		mov edx,v_win_b[esi]
		call writeString
		call crlf
		add esi,4
	loop loop_print_win_all

	ret
print_win_all endp
;end



;印出設定場景-------------------------------------------------------------------------------------------------
print_set_all proc
	call clrscr
	
	xor esi,esi
	mov ecx,6
	loop_print_set_all:
		mov edx,v_set_b[esi]
		call writeString
		call crlf
		add esi,4
	loop loop_print_set_all

	ret
print_set_all endp
;end



; 印出遊戲時最上方的上界-------------------------------------------------------------------------------------------------
print_begin proc uses edx
	mov edx,offset vbegin
	call writeString
	call crlf
	ret
print_begin endp
; end



;印出遊戲時最下方的下界-------------------------------------------------------------------------------------------------
print_end proc uses edx
	mov edx,offset vend
	call writeString
	call crlf
	ret
print_end endp
; end



;取得一組隨機數字，用來隨機產生管子樣貌-------------------------------------------------------------------------------------------------
getRand proc uses eax ebx
	
;control the width of a pipe
mov ebx,rand_pipe_wigth_range2
sub ebx,rand_pipe_wigth_range1
mov eax,ebx
call randomRange 
add eax,rand_pipe_wigth_range1
inc eax
mov rand_pipe_wigth,eax
;end



;control the width of each pipe
mov ebx,rand_pipeBetween_range2
sub ebx,rand_pipeBetween_range1
mov eax,ebx
call randomRange 
add eax,rand_pipeBetween_range1
inc eax
mov rand_pipeBetween,eax
;end



;contol the size of pipe entry
mov eax,3
call randomRange
add eax,6
mov rand_open_width,eax
;end



;control the begin position of a pipe
mov eax,11
call randomRange 
mov rand_open_position,eax
;end

	ret
getRand endp
;end



;根據隨機數值來產生管子間的間隔或下一組管子-------------------------------------------------------------------------------------------------
creat_pipe proc
	cmp rand_pipeBetween,0 ;如果與下一個管子的間隔還沒印完
	jg creat_pipe_end
	je pipe_begin
	cmp rand_pipe_wigth,0 ;如果管子本身還沒印完
	jg draw_the_pipe
	je pipe_end
	jmp return_creat_pipe  ;如果都印完了就進入下一次迴圈，再產生一組隨機數

draw_the_pipe:
	dec rand_pipe_wigth ;將管子寬度-1
	call draw_pipe ;畫出管子的下一行
	jmp return_creat_pipe 

creat_pipe_end:
	dec rand_pipeBetween ;將管子之間的間隔-1
	call clear_repl ;清空管子的下一行
	jmp return_creat_pipe

	;水管的最開頭
pipe_begin:
	call begin_pipe
	mov rand_pipeBetween,-1
	jmp return_creat_pipe

	;水管的結尾
pipe_end:
	call begin_pipe
	mov rand_pipe_wigth,-1
	mov check,1
	jmp return_creat_pipe	

return_creat_pipe:	
	ret
creat_pipe endp
;end



;印出每個水管的開頭-------------------------------------------------------------------------------------------------
begin_pipe proc uses ecx esi
	mov cl,'*'
	xor esi,esi 

	call clear_repl ;清空管子

	;測試目前管子的數值
	mov esi,rand_open_position 
	.IF esi==0 ;如果開口為0表示上方沒有管子

		;把開口位置以下的2格變成管子的邊緣
		add esi,rand_open_width 
		mov repl[esi],cl
		mov repl[esi+1],cl
		jmp return_begin_pipe

	.ELSEIF esi==1 ;如果開口為1表示上方有一層管子

		;把該邊緣附上 * 
		mov repl[esi-1],cl 

		;把開口位置以下的2格變成管子的邊緣
		add esi,rand_open_width
		mov repl[esi],cl
		mov repl[esi+1],cl
		jmp return_begin_pipe

	.ENDIF


	;測試管子是否在最底下
	mov esi,rand_open_position
	add esi,rand_open_width


	;管子在最底下代表下方沒有管子
	.IF esi == 20

		;把開口上方的管子附上邊緣
		mov esi,rand_open_position 
		sub esi,2
		mov repl[esi],cl
		mov repl[esi+1],cl
		jmp return_begin_pipe

	;管子在最底下的前一格代表下方只有一層管子
	.ELSEIF esi == 19

		;把那一層管子附上邊緣
		mov repl[esi],cl

		;把開口上方的管子附上邊緣
		mov esi,rand_open_position
		sub esi,2
		mov repl[esi],cl
		mov repl[esi+1],cl
		jmp return_begin_pipe

	.ENDIF


	;如果不是在最底跟最上方就算一次

	;上方的管子
	mov esi,rand_open_position
	sub esi,2
	mov repl[esi],cl
	mov repl[esi+1],cl

	;下方的管子
	add esi,rand_open_width
	add esi,2
	mov repl[esi],cl
	mov repl[esi+1],cl

	return_begin_pipe:
	ret
begin_pipe endp
;end



;根據原本對管子的設定畫出下一行-------------------------------------------------------------------------------------------------
draw_pipe proc uses ecx eax esi ebx ebx
mov cnt,0 ;計算目前畫到第幾格
mov cnt2,0 ;計算開口是否已經結束
xor esi,esi ;代表替換字串
	
loop_string_map:
	cmp cnt,20 ;如果20格都畫完了就ret
	je return_draw_pipe
	mov eax,rand_open_position ;如果沒有畫完就判斷開口位置是否在這
	cmp cnt,eax
	jne if_star ;如果開口位置不是在這就畫 '*' 代表水管
	jmp if_space ;如果開口是在這邊就畫 ' ' 代表開口

	if_star:
		mov bl,'*'
		mov repl[esi],bl
		inc esi
		inc cnt
	jmp loop_string_map ;畫完 '*' 後進行下一次判斷

	if_space:
		mov bl,' '
		mov ecx,rand_open_width ;開口要開幾格
		loop_open_width:
			cmp cnt2,ecx
			je loop_string_map
			mov repl[esi],bl
			inc esi
			inc cnt
			inc cnt2
		jmp loop_open_width ;畫開口
		


return_draw_pipe:
	
	;生成分數位置
	cmp rand_gen_score_x,0
	jne return_draw_pipe_not_score
	mov bl,'$'
	mov esi,rand_gen_score_y
	mov repl[esi],bl
		 
return_draw_pipe_not_score:
	;如果不是-1就可以減到0
	dec rand_gen_score_x

	ret
draw_pipe endp
;end



; 初始化替換水管為 ' ' -------------------------------------------------------------------------------------------------
clear_repl proc uses ecx esi eax
	mov ecx,20
	xor esi,esi
	xor eax,eax
	mov al,' '
loop_init:
	mov repl[esi],al
	inc esi
	loop loop_init
ret
clear_repl endp
; end



;把所有場景印出來-------------------------------------------------------------------------------------------------
print_all_v proc uses esi edx ecx
	call print_begin
	mov esi,0
	mov ecx,20
	loop_print_all:
		;把每個向量分別呈現
		mov edx,vb[esi]
		call writeString
		call crlf ;換行
		add esi,4
	loop loop_print_all
	call print_end
	ret
print_all_v endp
;end



;把替換水管接到場景後面，並把場景往左移一格-------------------------------------------------------------------------------------------------
scene_move proc uses esi ecx edi ebx eax
	mov ecx,20
	xor esi,esi
	mov eax,offset repl
	
	loop_vb1_vb20:
		mov edi,vb[esi] ;第幾列場景
		push ecx ;巢狀迴圈
		mov ecx,110 ;每列共112格，最後一列不用替換，第1格不用換

		loop_vb_ve: ;把第n格替換成第n+1格
			inc edi
			mov bl,[edi+1]
			mov [edi],bl
		loop loop_vb_ve

		pop ecx ;巢狀迴圈結束
		mov bl,[eax]
		mov [edi+1],bl ;把替換水管的元素接到場景後方
		inc eax 
		add esi,4 ;下一列場景
	loop loop_vb1_vb20

	ret
scene_move endp
;end



;印出目前鳥的位置-------------------------------------------------------------------------------------------------
print_bird_position proc uses edx eax
	
	;設定顏色
	push eax
	mov eax,14+(0*16)
	call settextcolor
	pop eax

	;判斷鳥是否為small 模式
	.IF flag_bird_body==0
		mov dl,bird_position_x
		mov dh,bird_position_y
		call gotoxy

		mov edx,offset bird_body1
		call writestring

		mov dl,bird_position_x
		mov dh,bird_position_y
		sub dl,1 
		add dh,1
		call gotoxy

		mov edx,offset bird_body2
		call writestring


		mov dl,bird_position_x
		mov dh,bird_position_y
		sub dl,1 
		add dh,2
		call gotoxy

		mov edx,offset bird_body3
		call writestring

		;判斷鳥是否正在跳躍
		.IF bird_jump_flag==0
			mov dl,bird_position_x
			mov dh,bird_position_y
			add dh,3
			call gotoxy

			mov edx,offset bird_body4
			call writestring
		.ENDIF

	;鳥是small模式
	.ELSE
		mov dl,bird_position_x
		mov dh,bird_position_y
		inc dl
		inc dh
		call gotoxy
		mov edx,offset small_bird_body
		call writestring
	.ENDIF
	ret
print_bird_position endp
;end



;鳥是small模式，判斷位置是否合法-------------------------------------------------------------------------------------------------
check_bird_small_position proc uses edi esi ebx eax ecx
	cmp bird_position_y,0 ;跳到太上方
		jl break
	cmp bird_position_y,20 ;跳到太下方
		jge break

	mov al,'*'
	movzx ebx,bird_position_y 
	imul ebx,4 
	mov esi,ebx
	mov edi,vb[esi]
	movzx ecx,bird_position_x


	add edi,ecx
	add edi,1
	cmp [edi],al 
	je break


	mov al,'$'
	movzx ebx,bird_position_y 
	imul ebx,4 
	mov esi,ebx
	mov edi,vb[esi]
	movzx ecx,bird_position_x


	add edi,ecx
	add edi,1
	cmp [edi],al 
	je set_small_delay

	jmp clear_small_delay

set_small_delay:

	;有吃到錢，把鳥佔到的範圍清空
	mov al,' '
	

	movzx ebx,bird_position_y 
	imul ebx,4 
	mov esi,ebx
	mov edi,vb[esi]
	movzx ecx,bird_position_x


	add edi,ecx
	add edi,1
	mov [edi],al


	add delay_con,10
	call gen_get_coin
	jmp return_small_check

clear_small_delay:
	call clear_get_coin

return_small_check:
	ret 
check_bird_small_position endp



;判斷目前鳥的位置是否合法-------------------------------------------------------------------------------------------------
check_bird_position proc uses edi esi ebx eax ecx

	cmp bird_position_y,0 ;跳到太上方
		jbe break
	cmp bird_position_y,18 ;跳到太下方
		jae break

	movzx ebx,bird_position_y 
	sub ebx,1 
	imul ebx,4 
	mov esi,ebx
	mov edi,vb[esi]
	mov al,'*'
	movzx ecx,bird_position_x


	
	add edi,ecx
	add edi,1
	cmp [edi],al 
	je break

	cmp [edi-1],al
	je break

	cmp [edi+1],al
	je break




	add ebx,4
	mov esi,ebx
	mov edi,vb[esi]
	movzx ecx,bird_position_x


	
	add edi,ecx
	add edi,1
	cmp [edi],al 
	je break

	cmp [edi-1],al
	je break

	cmp [edi-2],al
	je break

	cmp [edi+1],al
	je break

	cmp [edi+2],al
	je break





	add ebx,4
	mov esi,ebx
	mov edi,vb[esi]
	movzx ecx,bird_position_x


	
	add edi,ecx
	add edi,1
	cmp [edi],al 
	je break

	cmp [edi-1],al
	je break

	cmp [edi-2],al
	je break

	cmp [edi+1],al
	je break

	cmp [edi+2],al
	je break




	add ebx,4
	mov esi,ebx
	mov edi,vb[esi]
	movzx ecx,bird_position_x

	;如果鳥是跳起來的狀態
	.IF bird_jump_flag==0

		
		add edi,ecx
		add edi,1
		cmp [edi],al 
		je break

		cmp [edi-1],al
		je break

		cmp [edi+1],al
		je break

	.ENDIF

	


	;如果有吃到錢
	mov al,'$'
	movzx ebx,bird_position_y 
	sub ebx,1 
	imul ebx,4 
	mov esi,ebx
	mov edi,vb[esi]
	movzx ecx,bird_position_x


	
	add edi,ecx
	add edi,1
	cmp [edi],al 
	je set_delay

	cmp [edi-1],al
	je set_delay

	cmp [edi+1],al
	je set_delay




	add ebx,4
	mov esi,ebx
	mov edi,vb[esi]
	movzx ecx,bird_position_x


	
	add edi,ecx
	add edi,1
	cmp [edi],al 
	je set_delay

	cmp [edi-1],al
	je set_delay

	cmp [edi-2],al
	je set_delay

	cmp [edi+1],al
	je set_delay

	cmp [edi+2],al
	je set_delay





	add ebx,4
	mov esi,ebx
	mov edi,vb[esi]
	movzx ecx,bird_position_x


	
	add edi,ecx
	add edi,1
	cmp [edi],al 
	je set_delay

	cmp [edi-1],al
	je set_delay

	cmp [edi-2],al
	je set_delay

	cmp [edi+1],al
	je set_delay

	cmp [edi+2],al
	je set_delay




	add ebx,4
	mov esi,ebx
	mov edi,vb[esi]
	movzx ecx,bird_position_x


	
	add edi,ecx
	add edi,1
	cmp [edi],al 
	je set_delay

	cmp [edi-1],al
	je set_delay

	cmp [edi+1],al
	je set_delay

	jmp clear_delay

set_delay:

	;有吃到錢，把鳥佔到的範圍清空
	mov al,' '

	
	movzx ebx,bird_position_y 
	sub ebx,1 
	imul ebx,4 
	mov esi,ebx
	mov edi,vb[esi]
	movzx ecx,bird_position_x

	
	add edi,ecx
	add edi,1
	mov [edi],al 

	mov [edi-1],al

	mov [edi+1],al


	add ebx,4
	mov esi,ebx
	mov edi,vb[esi]
	movzx ecx,bird_position_x


	
	add edi,ecx
	add edi,1
	mov [edi],al 

	mov [edi-1],al

	mov [edi-2],al

	mov [edi+1],al

	mov [edi+2],al




	add ebx,4
	mov esi,ebx
	mov edi,vb[esi]
	movzx ecx,bird_position_x


	
	add edi,ecx
	add edi,1
	mov [edi],al 

	mov [edi-1],al

	mov [edi-2],al

	mov [edi+1],al

	mov [edi+2],al




	add ebx,4
	mov esi,ebx
	mov edi,vb[esi]
	movzx ecx,bird_position_x


	
	add edi,ecx
	add edi,1
	mov [edi],al 

	mov [edi-1],al

	mov [edi+1],al


	;有吃到錢的話就++delay
	add delay_con,10
	call gen_get_coin
	jmp return_check_bird_position


clear_delay:
	call clear_get_coin

return_check_bird_position:
	ret
check_bird_position endp
;end



;設定分數-------------------------------------------------------------------------------------------------
set_score proc uses edx ecx eax

	;設定分數的顏色
	push eax
	mov eax,3+(0*16)
	call settextcolor
	pop eax

	;如果是infnity狀態
	.IF infinity_flag==0
		mov dl,1
		mov dh,25
		call gotoxy 

		;印出目前的delay
		mov edx,offset current_delay_msg
		call writestring
		mov eax,delay_con
		call writedec


		;看目前程式運行了幾毫秒
		call getmseconds
		sub eax,starttime

		;算出總共運行了幾秒
		xor	edx, edx
		mov ecx,1000
		div ecx

		.IF max<eax
			mov max,eax
		.ENDIF

		mov dl,31
		mov dh,25
		call gotoxy 
		;把分數印出來
		mov edx,offset score
		call writestring
		call writedec

		mov dl,58
		mov dh,25
		call gotoxy

		mov edx,offset max_score_msg
		call writeString

		mov eax,max
		call writedec
	.ENDIF

	ret
set_score endp
;end



;印出歡迎字串-------------------------------------------------------------------------------------------------
greet_msg proc uses edx eax

	mov edx,offset greeting
	call writeString
	call crlf 
	mov eax,2000
	call delay
	call clrscr

	;印出歡迎 welcome spring bird
	call print_wel_all
	call crlf

	;印出 ___
	mov edx,offset q1
	call writestring
	call crlf
	call crlf

	;印出解釋
	mov edx,offset questions
	call writeString
	call crlf


	;印出 ___
	mov edx,offset q1
	call writestring
	call crlf
	call crlf
	call crlf
	call crlf
	call crlf
	call crlf
	call crlf
	call crlf


	;等待畫面
	call waitMsg
	call clrscr


	;印出game set
	call print_set_all 
	call crlf


	;輸入名字
	mov edx,offset input_name
	call writeString

	;彩蛋
	call easter_egg
	call check_easter_egg

	;詢問遊玩模式
	mov edx,offset question_use_defalut
	call writeString
	call crlf
	call readChar


	;default模式設定
	cmp al,'d'
	je set_default_game_mode
	jmp set_user_mode

;default模式設定參數
set_default_game_mode:
	mov rand_pipe_wigth_range1,4
	mov rand_pipe_wigth_range2,6
	mov rand_pipeBetween_range1,20
	mov rand_pipeBetween_range2,24
	jmp set_done


;給使用者輸入想要的參數
set_user_mode::
	call clrscr
	;印出game set
	call print_set_all 
	call crlf

	mov edx,offset question_set_pipe_width
	call writeString
	call crlf


	mov edx,offset input1_width_msg
	call writestring
	call readint
	mov rand_pipe_wigth_range1,eax
	mov edx,offset input2_width_msg
	call writestring
	call readint
	mov rand_pipe_wigth_range2,eax

	mov edx,offset question_set_pipe_between
	call writeString
	call crlf 

	mov edx,offset input1_open_msg
	call writestring
	call readint
	mov rand_pipeBetween_range1,eax
	mov edx,offset input2_open_msg
	call writestring
	call readint
	mov rand_pipeBetween_range2,eax

	;確定輸入是否合法
	call check_invalid
	
	;資料設定結束
set_done::
	call clrscr
	ret
greet_msg endp
;end



;檢查是否有發生彩蛋-------------------------------------------------------------------------------------------------
check_easter_egg proc uses esi
	xor esi,esi

	.IF byteCount == 3
		.IF player_name[esi]=='i' && player_name[esi+1]=='n' && player_name[esi+2]=='a'
			call print_win_all
			mov eax,2000
			call delay
			invoke ExitProcess,0
		.ENDIF
	.ENDIF

	.IF byteCount == 5
		.IF player_name[esi]=='s' && player_name[esi+1]=='m' && player_name[esi+2]=='a' && player_name[esi+3]=='l' && player_name[esi+4]=='l'
			mov flag_bird_body,1
		.ENDIF

		.IF player_name[esi]=='a' && player_name[esi+1]=='b' && player_name[esi+2]=='o' && player_name[esi+3]=='u' && player_name[esi+4]=='t'
			call crlf
			call crlf
			mov edx,offset about_me
			call writeString
			mov eax,3000
			call crlf
			call crlf
			call delay
			invoke ExitProcess,0
		.ENDIF
	.ENDIF
	.IF byteCount == 7 
		.IF player_name[esi]=='r' && player_name[esi+1]=='e' && player_name[esi+2]=='v' && player_name[esi+3]=='e' && player_name[esi+4]=='r' && player_name[esi+5]=='s' && player_name[esi+6]=='e'
			mov reverse_flag,1
		.ENDIF
	.ENDIF
	.IF byteCount == 4
		.IF player_name[esi]=='c' && player_name[esi+1]=='o' && player_name[esi+2]=='i' && player_name[esi+3]=='n'
			mov coin_chence,1
		.ENDIF
	.ENDIF

	.IF byteCount == 8
		.IF player_name[esi]=='s' && player_name[esi+1]=='t' && player_name[esi+2]=='o' && player_name[esi+3]=='l' && player_name[esi+4]=='a' && player_name[esi+5]=='s' && player_name[esi+6]=='i' && player_name[esi+7]=='n'
			mov player_name[0],'g'
			mov player_name[1],'a'
			mov player_name[2],'m'
			mov player_name[3],'e'
			mov player_name[4],' '
			mov player_name[5],'m'
			mov player_name[6],'a'
			mov player_name[7],'k'
			mov player_name[8],'e'
			mov player_name[9],'r'
			mov player_name[10],0
			mov position_check_flag,1
			mov infinity_flag,1
		.ENDIF
	.ENDIF

	ret
check_easter_egg endp



;輸入名字，觸發彩蛋-------------------------------------------------------------------------------------------------
easter_egg proc uses edx ecx eax
	mov edx,offset player_name
	mov ecx,(sizeof player_name)-1
	call readstring
	mov byteCount,eax
	ret
easter_egg endp



;生成delay-------------------------------------------------------------------------------------------------
gen_delay_score proc uses eax
rand_gen:

	;隨機生成$分數
	movzx eax,coin_chence ;機率出現
	call randomrange
	cmp eax,0
	je gen
	jmp gen_init

gen:

	mov eax,rand_pipe_wigth
	call randomrange
	mov rand_gen_score_x,eax
	
	mov eax,rand_open_width
	;dec eax
	call randomrange
	;inc eax
	add eax,rand_open_position
	mov rand_gen_score_y,eax
	jmp gen_ret


;如果沒有生成成功，那就初始化參數
gen_init:
	mov rand_gen_score_x,-1
	mov rand_gen_score_y,-1

gen_ret:
	ret
gen_delay_score endp
;end



;吃到 $ -------------------------------------------------------------------------------------------------
gen_get_coin proc uses edx 

	;吃到$就印出訊息
	mov dl,87
	mov dh,25
	call gotoxy 
	mov edx,offset coin_msg
	call writestring

	ret
gen_get_coin endp
;end



;判斷使用者輸入是否合法-------------------------------------------------------------------------------------------------
check_invalid proc uses edx eax

	;檢查使用者的輸入是否介於3到9 ，且第一個數字比較小
	.IF rand_pipe_wigth_range2>7 || rand_pipe_wigth_range1<3
		call clrscr
		mov edx,offset invalid_input
		call writestring
		mov eax,2000
		call delay
		call clrscr
		jmp set_user_mode
	.ENDIF
	
	mov eax,rand_pipe_wigth_range2
	.IF eax <= rand_pipe_wigth_range1
		call clrscr
		mov edx,offset invalid_input
		call writestring
		mov eax,2000
		call delay
		call clrscr
		jmp set_user_mode
	.ENDIF


	;檢查使用者的輸入是否介於10到25 ，且第一個數字比較小
	.IF rand_pipeBetween_range1<18 || rand_pipeBetween_range2>30
		call clrscr
		mov edx,offset invalid_input
		call writestring
		mov eax,2000
		call delay
		call clrscr
		jmp set_user_mode
	.ENDIF


	mov eax,rand_pipeBetween_range2
	.IF rand_pipeBetween_range1 >= eax
		call clrscr
		mov edx,offset invalid_input
		call writestring
		mov eax,2000
		call delay
		call clrscr
		jmp set_user_mode
	.ENDIF

	;如果設定完成就結束
	jmp set_done
	ret
check_invalid endp
;end



;把得到分數的字串清空-------------------------------------------------------------------------------------------------
clear_get_coin proc uses edx
	
	;把知道金幣的提示訊息清掉
	mov dl,87
	mov dh,25

	;為了不要馬上把訊息清掉，設定不需要跑20次才清掉
	cmp cnt3,20
	jae clear 

	;否則就不要清掉
	jmp dont_clear

clear:

	call gotoxy
	mov edx,offset clear_coin_msg
	call writestring

	;把計數器歸0，準備進行下一次
	mov cnt3,0
	jmp return_draw_pipe_not_score1

dont_clear:
	;把計數器++，讓清掉的判斷式成立
	inc cnt3

return_draw_pipe_not_score1:
	ret
clear_get_coin endp
;end



;windows-------------------------------------------------------------------------------------------------
ask_box proc uses ebx edx 
	
	;設定詢問式窗問使用者要不要再玩一次
	mov ebx,offset caption_ask
	mov edx,offset question_ask
	call msgboxask

	ret
ask_box endp
;end



;重新設定場景以及某些數值-------------------------------------------------------------------------------------------------
view_init proc uses ecx edi esi eax ebx
	
	;初始化，如果使用者有要再玩一次
	mov ecx,20
	xor esi,esi
	xor edi,edi

	;把整個背景初始化
loop_view_init1:
	mov edi,vb[esi]
	mov eax,vb_ori[esi]
	push ecx
	mov ecx,lengthof v1_ori
		loop_view_init2:
			mov bl,[eax]
			mov [edi],bl
			inc eax
			inc edi
		loop loop_view_init2
	add esi,4
	pop ecx
	loop loop_view_init1


	;初始化鳥的位置跟delay的數值
	mov delay_con,250
	mov bird_position_x,7
	mov bird_position_y,7

	ret
view_init endp
;end



;死亡動畫-------------------------------------------------------------------------------------------------
dead_animation proc uses edx eax

	mov dh,bird_position_y
	mov dl,bird_position_x
	add dh,1
	add dl,1
	call gotoxy


	mov edx,offset bird_dead_point
	call writeString


	mov eax,500
	call delay


	mov dh,bird_position_y
	mov dl,bird_position_x
	dec dl
	sub dh,1
	call gotoxy

	mov edx,offset bird_dead1
	call writeString


	mov dh,bird_position_y
	mov dl,bird_position_x
	dec dl
	call gotoxy

	mov edx,offset bird_dead2
	call writeString



	mov dh,bird_position_y
	mov dl,bird_position_x
	dec dl
	add dh,1
	call gotoxy

	mov edx,offset bird_dead3
	call writeString



	mov dh,bird_position_y
	mov dl,bird_position_x
	dec dl
	add dh,2
	call gotoxy

	mov edx,offset bird_dead4
	call writeString



	mov dh,bird_position_y
	mov dl,bird_position_x
	dec dl
	add dh,3
	call gotoxy

	mov edx,offset bird_dead5
	call writeString

	mov eax,500
	call delay




	mov dh,bird_position_y
	mov dl,bird_position_x
	dec dl
	sub dh,1

	call gotoxy

	mov edx,offset bird_dead_a1
	call writeString


	mov dh,bird_position_y
	mov dl,bird_position_x
	dec dl
	call gotoxy

	mov edx,offset bird_dead_a2
	call writeString




	mov dh,bird_position_y
	mov dl,bird_position_x
	dec dl
	add dh,1
	call gotoxy

	mov edx,offset bird_dead_a3
	call writeString




	mov dh,bird_position_y
	mov dl,bird_position_x
	dec dl
	add dh,2
	call gotoxy

	mov edx,offset bird_dead_a4
	call writeString




	mov dh,bird_position_y
	mov dl,bird_position_x
	dec dl
	add dh,3
	call gotoxy

	mov edx,offset bird_dead_a5
	call writeString

	mov eax,500
	call delay

	ret
dead_animation endp




;開頭動畫-------------------------------------------------------------------------------------------------
begin_animation proc uses edx eax
	
	mov eax,9+(0*16)
	call settextcolor

	mov dl,35
	mov dh,25
	call gotoxy
	mov edx,offset begin_animation_msg
	call writestring

	mov dl,35
	mov dh,27
	call gotoxy
	mov edx,offset welcome_msg
	call writestring
	mov edx,offset player_name
	call writestring
	

loop_begin_animation:
	
	mov eax,14+(0*16)
	call settextcolor


	xor dl,dl
	xor dh,dh
	call gotoxy

	sub bird_position_y,1
	mov bird_jump_flag,1
	call print_all_v
	call print_bird_position
	mov eax,150
	call delay

	call readKey
	cmp al,' '
	je begin_animation_return




	xor dl,dl
	xor dh,dh
	call gotoxy

	sub bird_position_y,1
	call print_all_v
	call print_bird_position
	mov eax,150
	call delay

	call readKey
	cmp al,' '
	je begin_animation_return




	xor dl,dl
	xor dh,dh
	call gotoxy

	sub bird_position_y,1
	call print_all_v
	call print_bird_position
	mov eax,150
	call delay

	call readKey
	cmp al,' '
	je begin_animation_return



	xor dl,dl
	xor dh,dh
	call gotoxy

	add bird_position_y,1
	mov bird_jump_flag,0
	call print_all_v
	call print_bird_position
	mov eax,150
	call delay

	call readKey
	cmp al,' '
	je begin_animation_return




	xor dl,dl
	xor dh,dh
	call gotoxy


	add bird_position_y,1
	call print_all_v
	call print_bird_position
	mov eax,150
	call delay

	call readKey
	cmp al,' '
	je begin_animation_return




	xor dl,dl
	xor dh,dh
	call gotoxy

	add bird_position_y,1
	call print_all_v
	call print_bird_position
	mov eax,150
	call delay

	call readKey
	cmp al,' '
	je begin_animation_return





	;-------------------------------------------------------------------------------------------------




	xor dl,dl
	xor dh,dh
	call gotoxy

	add bird_position_y,1
	call print_all_v
	call print_bird_position
	mov eax,150
	call delay

	call readKey
	cmp al,' '
	je begin_animation_return




	xor dl,dl
	xor dh,dh
	call gotoxy

	add bird_position_y,1
	call print_all_v
	call print_bird_position
	mov eax,150
	call delay

	call readKey
	cmp al,' '
	je begin_animation_return




	xor dl,dl
	xor dh,dh
	call gotoxy

	add bird_position_y,1
	call print_all_v
	call print_bird_position
	mov eax,150
	call delay

	call readKey
	cmp al,' '
	je begin_animation_return




	xor dl,dl
	xor dh,dh
	call gotoxy

	sub bird_position_y,1
	mov bird_jump_flag,1
	call print_all_v
	call print_bird_position
	mov eax,150
	call delay

	call readKey
	cmp al,' '
	je begin_animation_return




	xor dl,dl
	xor dh,dh
	call gotoxy

	sub bird_position_y,1
	call print_all_v
	call print_bird_position
	mov eax,150
	call delay

	call readKey
	cmp al,' '
	je begin_animation_return



	xor dl,dl
	xor dh,dh
	call gotoxy

	sub bird_position_y,1
	call print_all_v
	call print_bird_position
	mov eax,150
	call delay

	call readKey
	cmp al,' '
	je begin_animation_return

	jmp loop_begin_animation

begin_animation_return:

	mov dl,35
	mov dh,25
	call gotoxy
	mov edx,offset clear_coin_msg
	call writestring

	mov dl,35
	mov dh,27
	call gotoxy
	mov edx,offset clear_coin_msg
	call writestring

	.IF infinity_flag==0
		;分數介面
		xor dl,dl
		mov dh,24
		call gotoxy

		mov edx,offset fence
		call writestring
		call crlf
		mov edx,offset one_fence
		call writestring
		mov dl,23
		mov dh,25
		call gotoxy
		mov edx,offset one_fence
		call writestring
		call crlf 
		mov edx,offset fence
		call writestring


		mov dl,30
		mov dh,24
		call gotoxy

		mov edx,offset fence1
		call writestring
		mov dl,30
		mov dh,25
		call gotoxy
		mov edx,offset one_fence
		call writestring
		mov dl,50
		mov dh,25
		call gotoxy
		mov edx,offset one_fence
		call writestring
		mov dl,30
		mov dh,26
		call gotoxy
		mov edx,offset fence1
		call writestring


		mov dl,57
		mov dh,24
		call gotoxy

		mov edx,offset fence2
		call writestring
		mov dl,57
		mov dh,25
		call gotoxy
		mov edx,offset one_fence
		call writestring
		mov dl,82
		mov dh,25
		call gotoxy
		mov edx,offset one_fence
		call writestring
		mov dl,57
		mov dh,26
		call gotoxy
		mov edx,offset fence2
		call writestring
	.ELSE
		;infinity 設定
		mov dl,1
		mov dh,23
		call gotoxy
		mov edx,offset inf1
		call writestring
		mov dl,1
		mov dh,24
		call gotoxy
		mov edx,offset inf2
		call writestring
		mov dl,1
		mov dh,25
		call gotoxy
		mov edx,offset inf3
		call writestring
		mov dl,1
		mov dh,26
		call gotoxy
		mov edx,offset inf4
		call writestring
		mov dl,1
		mov dh,27
		call gotoxy
		mov edx,offset inf5
		call writestring
		mov dl,1
		mov dh,28
		call gotoxy
		mov edx,offset inf6
		call writestring
		mov dl,1
		mov dh,29
		call gotoxy
		mov edx,offset inf7
		call writestring
	.ENDIF

	xor dl,dl
	xor dh,dh
	call gotoxy

	push eax
	mov eax,14+(0*16)
	call settextcolor
	pop eax


	call print_all_v
	mov bird_jump_flag,0
	call print_bird_position
	mov eax,150
	call delay 


	xor dl,dl
	xor dh,dh
	call gotoxy


	call print_all_v
	mov bird_jump_flag,1
	;向上跳躍一格
	sub bird_position_y,1
	call print_bird_position 
	mov eax,150
	call delay


	ret
begin_animation endp



;main function -------------------------------------------------------------------------------------------------
main proc
	;設定歡迎介面
	mov eax,14+(0*16)
	call settextcolor
	call greet_msg

	;建立隨機化種子
	call randomize

game_begin:
	call clrscr

	;初始化場景
	call view_init

	;遊戲起始動畫
	call begin_animation

	;遊戲開始時間
	call getmseconds
	mov starttime,eax

	rev:
		;取得一組隨機數字
		call getRand

		;美生成一組新的水管就讓delay減少 
		sub delay_con,5

		;隨機產生 $
		call gen_delay_score

	loop_infinity:

		;製造一個新的管子
		call creat_pipe 

		
		;判斷管子是否結束
		cmp rand_pipeBetween,-1
		jne loop_scene_move
		cmp rand_pipe_wigth,-1

		;管子還沒有結束就呼叫字串的串接
		jne loop_scene_move

		;如果管子結束了，卻還有最後一列沒印 
		cmp check,1
		je loop_scene_move

		;確定全部結束了，重新做一組新的數據
		jmp rev 

	;對遊戲版面的所有控制跟處理
	loop_scene_move:

		;不是印最後一列
		mov check,0

		;使用者遊玩的遊戲等待時間
		mov eax,delay_con
		call delay
		;為了簡化遊戲難度


		;在進行無窮迴圈時同時將cmd輸入讀到al
		call readKey

		cmp al,' ' 

		;如果輸入是空格，判斷鳥跳躍一格
		je bird_jump 

		;如果使用者輸入的是 q 跳出死亡動畫
		cmp al,'q'
		je break

		;如果使用者不是輸入空格
		jmp nature_fall 


	bird_jump: 
		xor dl,dl
		xor dh,dh
		call gotoxy


		push eax
		mov eax,10+(0*16)
		call settextcolor
		pop eax


		call print_all_v
		;向上跳躍一格

		.IF reverse_flag==0
			dec bird_position_y
			mov bird_jump_flag,1
		.ELSE
			inc bird_position_y
			mov bird_jump_flag,0
		.ENDIF

	.IF position_check_flag!=1
		.IF flag_bird_body==0
			call check_bird_position
		.ELSEIF
			call check_bird_small_position
		.ENDIF 
	.ENDIF
		call print_bird_position 

		;在進行無窮迴圈時同時將cmd輸入讀到al register	
		call readKey 
		cmp al,' ' 

		;如果輸入是空格，判斷鳥再跳躍一格
		je bird_jump

		cmp al,'q'
		je break

		;如果不是空格，那就結束 
		jmp next 


	nature_fall:
		xor dl,dl
		xor dh,dh
		call gotoxy


		push eax
		mov eax,10+(0*16)
		call settextcolor
		pop eax


		call print_all_v
		mov bird_jump_flag,0
		;自然掉落一格
		.IF reverse_flag==0
			inc bird_position_y
			mov bird_jump_flag,0
		.ELSE
			dec bird_position_y
			mov bird_jump_flag,1
		.ENDIF

		.IF position_check_flag!=1
			.IF flag_bird_body==0
				call check_bird_position
			.ELSEIF
				call check_bird_small_position
			.ENDIF 
		.ENDIF
		call print_bird_position 
		jmp next

	next:
	
	strc:

		;鳥每移動一格就重新計算分數
		call set_score	

		;把場景左移並接上新的一條字串
		call scene_move 

		;在最左上角印出
		jmp loop_infinity

break::
	

	;設定文字顏色
	push eax
	mov eax,12+(0*16)
	call settextcolor
	pop eax



	call dead_animation


	;使用者失敗，印出死亡場景
	call clrscr
	call print_dead_all
	mov eax,2000
	call delay


	push eax
	mov eax,3+(0*16)
	call settextcolor
	pop eax


	call clrscr

	;印出分數
	.IF infinity_flag==0
		mov eax,max
		mov edx,offset max_score_msg
		call writestring
		call writedec
	.ELSE
		call print_easter_all
	.ENDIF

	;印出重玩視窗
	call ask_box

	;如果使用者選擇重玩
	cmp eax,6
	je game_begin

	;否則程式真的結束
	jmp game_end

game_end:
	mov eax,15+(0*16)
	call settextcolor
	invoke ExitProcess,0

main endp
end main
