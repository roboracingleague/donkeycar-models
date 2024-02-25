# Models Reference

| Model | Model Type | Steering Ref. | Kernels | Learning Field | Learning Type | Validation Dataset | # Images | Image Type | Val. Loss | Epoch | Angle Accuracy | Throttle Accuracy | Val. Angle Accuracy | Val. Throttle Accuracy | Max. dist. |
| - | - | :-: | - | - | :-: | -: | -: | - | -: | -: | -: | -: | -: | -: | -: |
| 050 | LCR  |  0.4 / 0.6  | 12 | AI Angle |         -        | Shuffle | 60 K | Raw | 0.12036 | 39 | - | - | - | - | - |
| 051 | LCR  |  0.4 / 0.6  | 12 | AI Angle |         -        | Shuffle | 72 K | Raw | 0.18487 | 33 | - | - | - | - | - |
| 052 | LCR  |  0.4 / 0.6  | 12 | AI Angle | Transfer from 50 | Shuffle | 72 K | Raw | 0.18065 | 46 | - | - | - | - | - |
| 053 | LCR  | 0.35 / 0.65 | 12 | AI Angle |         -        | Shuffle | 72 K | Raw | 0.19021 | 35 | - | - | - | - | - |
| 054 | LCR  | 0.35 / 0.65 | 12 | AI Angle | Transfer from 52 | Shuffle | 72 K | Raw | 0.13072 | 21 | - | - | - | - | - |
| 055 | LCRS | 0.35 / 0.65 | 12 | AI Angle |         -        | Shuffle | 72 K | Raw | 0.13679 | 26 | 0.9063 | 0.9885 | 0.9024 | 0.9918 | - |
| 056 | LCRS | 0.35 / 0.65 | 24 | AI Angle | Transfer from 52 | Shuffle | 72 K | Raw | 0.11870 | 18 | 0.9255 | 0.9899 | 0.9146 | 0.9943 | - |
| 057 | LCRS | 0.3 / 0.7   | 12 | AI Angle | - | Shuffle | 72 K | Raw | 0.13842 | 26 | 0.9180 | 0.9899 | 0.8993 | 0.9925 | - |
| 065 | LCRS | 0.25 / 0.75 | 12 | AI Angle | 20240126 Alpine | Shuffle | 45 K | Raw | 0.11178 | 18 | - | - | - | - | - |
| 066 | LCRS | 0.25 / 0.75 | 12 | AI Angle | 20240126 Megane | Shuffle | 45 K | Raw | 0.10231 | 28 | - | - | - | - | - |
| 067 | LCRS | 0.25 / 0.75 | 12 | AI Angle | 20240126 Sandero | Shuffle | 45 K | Raw | 0.10181 | 15 | - | - | - | - | - |
| 068 | LCRS | 0.25 / 0.75 | 12 | AI Angle | 20240126 Megane+Sandero | Shuffle | 90 K | Raw | 0.10163 | 19 | - | - | - | - | - |
| 069 | LCRS | 0.25 / 0.75 | 12 | AI Angle | 20240126 Alpine+Megane+Sandero | Shuffle | 135 K | Raw | 0.10854 | 24 | - | - | - | - | - |
| A001 | LRO | n/a | 24 | Labeled_indexes | - | Shuffle | 17 K | Raw | 0.21497 | 14 | - | - | - | - | 1.2 |
| A020 | LRO | n/a | 12 | Labeled_indexes | - | Shuffle | 17 K | Raw | 0.09710 | 16 | - | - | - | - | 1.5 |
| A021 | LRO | n/a | 12 | Labeled_indexes | - | Shuffle | 17 K | Raw | 0.10870 | 15 | - | - | - | - | 1.2 |
| A022 | LRO | n/a | 12 | Labeled_indexes | - | Shuffle | 17 K | Raw | 0.08259 | 17 | - | - | - | - | 2.0 |



__Model Type__

* L : Left
* C : Center
* R : Right
* S : Speed
* O : Obstacle
