# CV Forge

轻量简历优化 Skill：在**不虚构、不夸大事实**的前提下，优化简历的结构完整性、措辞准确性与岗位针对性，输出改进后的完整简历及结构化修改说明。

规则细节以 [SKILL.md](SKILL.md) 为准，本文件只做导航。

## 核心能力

- **输入**：已成稿的简历，或用户能提供的全部事实（形态不限：纯文本 / Markdown / 要点清单 / 结构化字段）；可选提供目标岗位 / JD、优化力度（轻度 / 标准 / 深度）、语言风格、目标市场、目标篇幅（默认一页）
- **流程**：结构解析与完整性检查 → 措辞优化 → 针对性诊断 → 输出自检 → 生成优化简历 + 结构化修改说明
- **输出**：完整优化简历（逐条编号）+ 修改说明（逐条「原文 → 改后」对照、为什么改、哪些未动及原因；必要时附一段内容瓶颈的「总体判断」）+ 末尾一行自检结论
- **迭代**：基于上一轮结果的多轮修订；补 JD 时按岗位定向（含等义换词、允许定向重排，不增事实），已认可的部分逐字不动
- **自检**：第 4 步内嵌执行——草稿成形后先过 4.1 的八条产出规则验收，再逐条过 4.2 的语义判断，结论随输出附上；不打分

## 不做的事

简历评分、岗位匹配打分、排版模板设计、多版本生成、行业深度研究、虚构或扩写内容。

## 安装

将本目录（`SKILL.md` 所在处）导入为 Skill 即可，无其他依赖。

## 发布与打包

本仓库根目录即技能目录，但**不要**直接对它运行官方 `package_skill.py`：该脚本用 `rglob('*')` 递归全部文件，会把 `.git/`（全量历史）和 `.workbuddy/` 一并压进 zip（实测 198 个条目里 185 个来自 `.git`）。先导出干净目录再打包：

```bash
mkdir -p /tmp/cv-forge-dist/cv-forge
tar -cf - --exclude=./.git --exclude=./.workbuddy . | tar -xf - -C /tmp/cv-forge-dist/cv-forge
python package_skill.py /tmp/cv-forge-dist/cv-forge
```

产出 5 个文件（`SKILL.md`、`README.md`、`LICENSE`、`.gitattributes`、`.gitignore`），约 12 KB。Windows 下若用 Git Bash，最后一条命令的路径需换成 `cygpath -w` 转换后的形式（Windows 版 Python 不认 `/tmp` 这类 POSIX 路径）。

## License

[MIT](LICENSE) © 2026 Lin Gan
