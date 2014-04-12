code immediate	 function () {
		 words[words.length-1]	// 最後定義的 指令
		 .immediate=1		// 設為 immediate (在編譯狀態 也能執行)
}		 end-code
code \		 function () {
		 iTib=tib.length	// 忽略原碼字串到 列尾
}		 end-code immediate  \ 宣告 反斜線符號 指令 在編譯狀態 也能執行
\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \
\ 前述 code 指令 定義了 immediate 及 反斜線符號 倆新指令, 反斜線符號 用作註解	\ 
\ 注意! 反斜線符號 之後必須 空格 這樣 接下來的原碼字串 才會當作 註解 直到列尾	\
\ code 之後是所定義 新指令的名稱, 接下來直到 end-code 為 javascript function	\
\ 注意! 其間 必須依循 javascript 語法 並以 雙斜線之後 直到列尾的字串 作為註解	\
\ 用 code 所定義的 是所謂 低階指令 都是以 javascript 來描述所要執行的相關動作	\
\ 在此之後用 code 所定義 冒號 : 及 分號 ; 倆指令 則是特別用苡定義所謂 高階指令 的	\
\ 冒號指令 須接 空格 然後才是 新指令名稱, 接下來 可用所有已定義的指令描述所要的動作	\
\ 直到 分號指令為止, 其間包括用 反斜線符號 指令 之後直到列尾的字串 當作註解用	\
\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \
code :		 function () {
		 hSrc=iTib 		// 以 hSrc 記住 原碼字串 位置 
		 hName=nextToken()	// 以 hName 記住要定義的 高階指令 名稱
		 hXt=compiledCode.length		// 以 hXt 記住 高階指令 內碼起點
		 compiling=1		// 進入 高階指令 編譯狀態
}		 end-code
code compileOnly function () {
		 words[words.length-1]	// 最後定義的 指令
		 .compileOnly=1		// 設為 compileOnly (編譯狀態 才能編碼)
}		 end-code
code ret	 function () {
		 ip=rStk.pop()		// 結束被呼叫的 高階指令 回上一層 繼續跑
}		 end-code compileOnly	\  宣告 ret 在編譯狀態 才能編碼
code doLit	 function () {
		 dStk.push(compiledCode[ip++])	// 將 ip 所指 內碼 放上堆疊
}		 end-code compileOnly	\  宣告 ret 在編譯狀態 才能編碼
code ;		 function () {
		 compileCode("ret")	// 編譯 ret 作為 高階指令 內碼
		 compiling=0		// 結束 高階指令 編譯狀態
		 var s=tib.substring(hSrc,iTib)	// 高階指令 的 原碼字串
		 newWord(hName,hXt,s)	// 以 名稱 內碼起點 原碼字串 完成高階定義
}		 end-code
		 compileOnly immediate	\  宣告 ; 在編譯狀態 才能編碼 也能執行
code +		 function () {
		 var x=dStk.pop()	// 從堆疊取出 堆頂數值 n
		 dStk[dStk.length-1]+=x	// 堆頂數值=堆頂數值+n
}		 end-code
code -		 function () {
		 var x=dStk.pop()	// 從堆疊取出 堆頂數值 n
		 dStk[dStk.length-1]-=x	// 堆頂數值=堆頂數值-n
}		 end-code
code *		 function () {
		 var x=dStk.pop()	// 從堆疊取出 堆頂數值 n
		 dStk[dStk.length-1]*=x	// 堆頂數值=堆頂數值*n
}		 end-code
code /		 function () {
		 var x=dStk.pop()	// 從堆疊取出 堆頂數值 n
		 dStk[dStk.length-1]/=x	// 堆頂數值=堆頂數值/n
}		 end-code
code .		 function () {
		 print(" "+dStk.pop())	// 從堆疊取出 堆頂數值 列印
}		 end-code
code dup	 function () {
		 var x=dStk[dStk.length-1]// 取 堆頂數值 top
		 dStk.push(x)		// 將 top 放上堆疊
}		 end-code
code .s		 function () {
		 var s=dStk.join(' ')	// 以空格區隔 之 堆疊數值字串
		 s=s||'empty'		// 若 空字串 則用 'empty'
		 print(' '+s)		// 列印 字串
}		 end-code
code words	 function () {
		 var s=words.map(	// 從 words 陣列 產生字串 s
		   function(w){		// 針對每個 指令 w
		     return w.name	// 取其 名稱
		   }
		 ).join(' ')		// 以空格區隔
		 print(' '+s)		// 列印 所產生字串
}		 end-code
words
code uniqueWords function () {
		 var t=''
  for(var w in dictionary)t+=' '+w; print(t)
}		 end-code
uniqueWords
: sq dup * ; 5 sq .
: 2sq sq 2 * ; 3 2sq .
code char function () {
		 var c=nextToken().substr(0,1)
  if(compiling) compileCode('doLit',c)
  else dStk.push(c)
}		 end-code immediate
char a .
: a char a . ; a