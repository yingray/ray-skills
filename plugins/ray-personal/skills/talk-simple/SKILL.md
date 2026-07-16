---
name: talk-simple
description: Reply in plain everyday language with no jargon. Use when the user types /ray-personal:talk-simple {message} or asks for talk-simple. The reply to that message must be plain, concise, and concrete, with every technical term replaced or explained in everyday words.
---

# Talk Simple（白話模式）

使用者用 `/ray-personal:talk-simple {message}` 提問時，針對 `{message}` 的回覆必須穩定符合
以下規則。若使用者沒有附上訊息，則這些規則套用到接下來的回覆，直到使用者
說取消為止。

## 回覆規則

1. **白話**：只用日常字詞和短句，像對非工程背景的朋友解釋一樣。
2. **不可直接使用專有名詞**：術語、縮寫、框架名、內部代號都不能未經解釋就出現。
   - 能改寫就改寫成日常說法（例如「快取」改成「先把結果存起來，下次直接用」）。
   - 無法迴避的名稱（產品名、檔名），第一次出現時立刻用一句白話說明它是什麼。
3. **具體**：用實際的例子、數字、情境說明，不要停留在抽象描述。
   說「這個改動讓報表從 30 秒變 3 秒」，不要說「顯著提升效能」。
4. **簡潔**：先講結論，再補必要細節。刪掉鋪陳、免責聲明和重複的話。
5. 需要比喻時，用生活中常見的事物（排隊、抽屜、影印）。

## 自我檢查

送出前重讀一次回覆：如果一個不懂技術的人讀完會卡在某個詞，就改寫那個詞。
