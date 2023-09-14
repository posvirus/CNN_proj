### `conv_1st_ctrl`模块中的计数器时序：

`conv_1st_ctrl`模块中共有两个计数器，分别为`init_cnt`与`data_cnt`，`init_cnt`负责标定第一个权重矩阵载入时的时序，`data_cnt`则负责标定后续流水化卷积运算的时序。在计数行为上，`init_cnt`在`sta`使能后即由**0**开始计数，计数至**301**后停止计数，代表模块初始化已经完成；`data_cnt`在`init_cnt`计数停止后立即从**0**开始，以**576**(=32×18)为循环进行计数，每循环一次，代表一张30×11图像的第一层卷积运算完成，时序图如下：

![counter](https://raw.githubusercontent.com/posvirus/Image_storage/main/img/202309071845404.png)

### `conv_1st_ctrl`模块中的更新信号时序：

`conv_1st_ctrl`模块中共有两路更新信号，分别为控制`pixel_buffer`的`ud_pixel`，以及控制`weight_buffer`的`ud_weight`。在初始化中，这两路信号会在检测到`init_cnt`计数至**300**时使能一个周期，将预载入的权重与图像数据输入脉动阵列；在后续运算过程中，`ud_weight`会在检测到`data_cnt%18`计数至**16**时使能一个周期，`ud_pixel`则会在检测到`data_cnt`计数至**574**时使能一个周期，时序图如下：

![ud_weight](https://raw.githubusercontent.com/posvirus/Image_storage/main/img/202309071856894.png)

![ud_pixel](https://raw.githubusercontent.com/posvirus/Image_storage/main/img/202309071857785.png)

### `conv_1st_ctrl`模块中的`flush`信号时序：

`conv_1st_ctrl`模块中的`flush`信号仅在卷积运算开始后才有效，其会在检测到`data_cnt%9`计数至**8**时使能一个周期，时序图如下：

![flush](https://raw.githubusercontent.com/posvirus/Image_storage/main/img/202309071901566.png)

另外，`conv_1st_ctrl`模块中存在的有效输出信号`valid_o`与`flush`信号时序完全相同。

###`conv_1st_ctrl`模块中的使能信号时序：

`conv_1st_ctrl`模块中共有四路使能信号，其中控制脉动阵列的使能信号`en_array`与控制`buffer`中计数器的使能信号`en_cnt`时序完全相同，均仅在卷积运算开始后才有效，且仅在`data_cnt%9`循环计数的9个周期中的**前7个**周期有效，时序图如下：

![en_array_buffer](https://raw.githubusercontent.com/posvirus/Image_storage/main/img/202309071912167.png)

另外两路使能信号分别为控制`pixel_buffer`使能的`en_DFF_pixel`与控制`weight_buffer`使能的`en_DFF_weight`，以下将分别说明：

`en_DFF_pixel`在**`sta`使能后的下一个时钟上升沿时**被使能，并维持**300**周期，完成第一幅图像的预载入。卷积运算时，`en_DFF_pixel`在`data_cnt`**小于300**时的**300**个时钟周期内被使能，完成下一幅图像的载入，时序图如下：

![en_pixel](https://raw.githubusercontent.com/posvirus/Image_storage/main/img/202309071927157.png)

**`en_DFF_weight`代表对权重矩阵载入的使能，换言之，`en_DFF_weight`为1时，SRAM必须给出有效输入**。`en_DFF_weight`在**`sta`使能后的下一个时钟上升沿时**被使能，并维持**9**周期，完成第一个权重矩阵的预载入。卷积运算时，`en_DFF_pixel`在`data_cnt%18`**小于9**时的**9**个时钟周期内被使能，完成下一个权重矩阵的载入，时序图如下：

![en_weight](https://raw.githubusercontent.com/posvirus/Image_storage/main/img/202309071935677.png)