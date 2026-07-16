---
name: talk-less-simple
description: Reply in plain jargon-free language AND under 100-200 characters. Use when the user types /talk-less-simple {message}. Combines the talk-simple and talk-less rules in one reply.
---

# Talk Less Simple（白話短答模式）

使用者用 `/talk-less-simple {message}` 提問時，針對 `{message}` 的回覆必須
同時符合 talk-simple 與 talk-less 的全部規則。若使用者沒有附上訊息，則這些
規則套用到接下來的回覆，直到使用者說取消為止。

## 回覆規則

1. **長度上限**：全文低於 200 字，目標 100 字左右。
2. **白話、不可直接使用專有名詞**：術語能改寫就改寫成日常說法；
   無法迴避的名稱第一次出現時立刻用一句白話說明。
3. **具體**：用實際的例子、數字或情境，不要抽象形容。
4. 第一句就是答案，不用標題、列點、開場白和客套話。
5. 兩個限制衝突時，先守住白話（讀得懂比更短重要），再盡量縮短；
   但仍不得超過 200 字。
6. 字數限制不能犧牲正確性：不確定就直接說不確定。

## 自我檢查

送出前重讀：不懂技術的人讀得懂嗎？字數低於 200 嗎？兩者都符合才送出。
