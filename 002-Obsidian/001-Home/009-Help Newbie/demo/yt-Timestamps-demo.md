---
url: https://www.youtube.com/watch?v=shoVsQhou-8
---

Ví dụ bạn có 1 youtube tutorial video dài 6h, bạn vừa xem tutorial vừa viết ghi chú lại. bạn chỉ cần ghi lại timestamp theo syntax `YT=mm:ss`.
Chú ý Script này chỉ áp dụng cho video không dài hơn 99m59s.( cần update script cho thời gian lâu hơn)

Điều kiện cho script hoạt động là bạn phải có: 
- link YT như trên đầu và
- Syntax `YT=mm:ss`

Run scritp `Ctrl +Alt +T` chọn `YT-Timestamps`. Script sẽ tự động update link YT cho bạn. Xem hướng dẫn sau:

![[YT-timestamps.gif]]


## 6 Hours Mozart for Studying, Concentration, Relaxation

- [17:46](https://www.youtube.com/watch?v=shoVsQhou-8&t=17m46s) - Le nozze di Figaro, K. 492: "Voi che sapete" - National Moldavian Symphony Orchestra,
- [28:59](https://www.youtube.com/watch?v=shoVsQhou-8&t=28m59s) - Le nozze di Figaro, K. 492, Act I: "Non più andrai" - National Moldavian Symphony Orchestra, Silvano Frontalini
     - where dueDate >= date(today) AND dueDate <= date(today) + dur(45 days)
