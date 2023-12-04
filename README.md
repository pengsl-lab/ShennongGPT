# ShennongGPT: 基于ChatGLM模型微调的中文用药指导大模型

[![Code License](https://img.shields.io/badge/Code%20License-Apache_2.0-green.svg)](https://github.com/SCIR-HI/Med-ChatGLM/blob/main/LICENSE)
[![Python 3.9+](https://img.shields.io/badge/python-3.9+-blue.svg)](https://www.python.org/downloads/release/python-390/)


# ShennongGPT
本仓库基于 ChatGLM-6B 模型和 Med-ChatGLM 模型，使用构建的中文用药指导数据进行[P-Tuning v2](https://github.com/THUDM/P-tuning-v2) 微调。发布了ShennongGPT，提高了ChatGLM在医疗领域的问答效果。


## A Quick Start
Update: 由于chatglm更新很快，推荐使用chatglm官方的微调方案：https://github.com/THUDM/ChatGLM-6B/blob/main/ptuning/README.md

也可以参考：[ChatGLM-6B 部署与 P-Tuning 微调实战](https://cloud.tencent.com/developer/article/2280193?areaSource=106005.17)

首先安装依赖包，python环境建议3.9+

```
pip install -r requirements.txt
```


## 模型下载
训练好的模型参数可以通过如下方式下载：

| 模型名称              | 大小 |                                                                              模型下载地址                                                                              | 
| :----------------- | :------: |:----------------------------------------------------------------------------------------------------------------------------------------------------------------:| 
| ShennongGPT   |    -       | coming soon  | 

## 训练

### P-Tuning v2

运行以下指令进行训练：
```shell
bash train.sh
```
`train.sh` 中的 `PRE_SEQ_LEN` 和 `LR` 分别是 soft prompt 长度和训练的学习率，可以进行调节以取得最佳的效果。

如果你想要从本地加载模型，可以将 `train.sh` 中的 `--model_name_or_path` 改为你本地的模型路径。

### 使用自己的数据集
修改 `train.sh` 和 `evaluate.sh` 中的 `train_file`、`validation_file`和`test_file`为你自己的 JSON 格式数据集路径，并将 `prompt_column` 和 `response_column` 改为 JSON 文件中输入文本和输出文本对应的 KEY。可能还需要增大 `max_source_length` 和 `max_target_length` 来匹配你自己的数据集中的最大输入输出长度。

## Demo
```shell
bash web_demo.sh
```
可能需要修改 [web_demo.sh](./web_demo.sh) 的内容以符合你实际的 checkpoint 情况。


## 致谢

本项目参考了以下开源项目，在此对相关项目和研究开发人员表示感谢。

- ChatGLM: [https://github.com/THUDM/ChatGLM-6B](https://github.com/THUDM/ChatGLM-6B)
- ChatGLM-Instruct-Tuning: [https://github.com/thinksoso/ChatGLM-Instruct-Tuning/issues](https://github.com/thinksoso/ChatGLM-Instruct-Tuning/issues)
- ChatGLM-Med: [https://github.com/SCIR-HI/Med-ChatGLM](https://github.com/SCIR-HI/Med-ChatGLM)


## 免责声明
本项目相关资源仅供学术研究之用，严禁用于商业用途。使用涉及第三方代码的部分时，请严格遵循相应的开源协议。模型生成的内容受模型计算、随机性和量化精度损失等因素影响，本项目无法对其准确性作出保证。本项目数据集绝大部分由模型生成，即使符合某些医学事实，也不能被用作实际医学用药指导和诊断的依据。对于模型输出的任何内容，本项目不承担任何法律责任，亦不对因使用相关资源和输出结果而可能产生的任何损失承担责任。


## 引用
*ShennongGPT: A Tuning Chinese LLM for Medication Guidance. Yutao Dou, xiongjun Zhao, Haitao Zou, Jian Xiao, Peng Xi, Shaoliang Peng. MedAI 2023*


