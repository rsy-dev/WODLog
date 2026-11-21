# Issue 37 visual evidence

The pinned HTML reference is `design/mockups/wodlog.html` at 393 × 852 CSS px.
`home-ios-15pro.png` is a raw iPhone 15 Pro simulator capture at 1179 × 2556
physical pixels (393 × 852 logical points, 3×). `home-mock-393.png` is the
matching empty-state HTML mock capture at 393 × 852 px. The simulator capture
is from the Flutter debug build, so the status bar and DEBUG ribbon are present;
they are simulator chrome and excluded from visual comparison. No editor, other
tab, English, or accessibility-mode captures have been accepted yet.

| Flutter app | Approved HTML mock |
| --- | --- |
| ![iPhone 15 Pro home](home-ios-15pro.png) | ![HTML mock home](home-mock-393.png) |
