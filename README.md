# vnoteTransformer

<!-- badges: start -->
<!-- badges: end -->

`vnoteTransformer` 用来将 VNoteX 3.x 版本的笔记本，转换为 VNote 2.x 版本的笔记本。

> VNote 2.10 是目前功能最完善的 VNote，如果还没有升级为 VNoteX 3.x 的话，别升级！！！

## Installation

请从 GitHub 安装。

``` r
devtools::install_github("gaospecial/vnoteTransformer")
# or
remotes::install_github("gaospecial/vnoteTransformer")
```

## Example

整个包只有一个命令，使用起来非常简单。

```r
library(vnoteTransformer)
vnote32(from = "E:/VNoteBook/", to = "E:/VNotebook2/")
```

为确保安全，会首先将原有的笔记本复制到新的文件夹中，然后再进行转换。
如果想要在原有的笔记本中直接转换，可使用 `to = NULL`。

另外，由于 VNoteX 3.x 使用的 JSON 文件为 `"vx.json"`，VNote 2.x 使用的 JSON 文件为 `"_vnote.json"`，
所以理论上两个版本的文件是可以共存的。`vnote32()` 有一个参数 `mode = "coexist"` 会同时保留两种 JSON 文件。

```r
vnote32(from = "E:/VNoteBook/", to = "E:/VNotebook2/", mode = "coexist")
```

**注意**：共存仅适用于存量笔记，新建笔记在不同版本间不会被自动识别。

----

如果觉得有用，请点个 Star 或者打赏 5 毛。

![5毛钱交个朋友](https://vnote-1251564393.cos.ap-chengdu.myqcloud.com/typora-img/image-20210208212557360.png)


顺便说一句，下载 VNote 2.10 版本，请移步到 [这里](https://github.com/vnotex/vnote/releases/tag/v2.10) 。
