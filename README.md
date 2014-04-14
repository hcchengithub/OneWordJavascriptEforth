OneWordJavascriptEforth
=======================

One-Word Javascript eForth
\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ \
\			R E A D M E   F I R S T				\
\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ \
\ A 首先 code 指令 定義 immediate 及 反斜線符號 倆新指令, 反斜線符號 用作註解	\
\   注意! 反斜線符號 之後必須 空格 這樣 接下來的原碼字串 才會當作 註解 直到列尾	\
\ B code 之後是 新指令名稱, 接下來直到 end-code 為所對應的 javascript function	\
\   注意! 其間 必須依循 javascript 語法 並以 雙斜線之後 直到列尾的字串 作為註解	\
\ C 用 code 所定義的 是所謂 低階指令 均以 javascript function 描述所指定相關動作	\
\ D 注意! code 之後 如果是字串 function, 此 function 並不當作要定義的 指令名稱	\
\   這時 從 function 到 end-code 之前 是純粹用來 定義 javascript function 的	\
\   這 javascript function 的名稱在 字串 function 後 並且可在圓括號內宣告參數	\
\ E 在此之後用 code 所定義 冒號 : 及 分號 ; 倆指令 是特別用來定義所謂 高階指令 的	\
\   冒號指令 須接 空格 然後才是 新指令名稱, 之後 就可用所有已定義指令描述所要的動作	\
\   直到 分號指令為止, 其間包括用 反斜線符號 指令 接 空格 直到列尾的字串 當作註解	\
\ F 清空此 text area 選點 evalute 然後 按 F5 鍵 可從新恢復 text area 原始範例	\
\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ \