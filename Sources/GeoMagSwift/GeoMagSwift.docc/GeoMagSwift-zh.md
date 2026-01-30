# ``GeoMagSwift``

*Looking for English? → <doc:GeoMagSwift>*

GeoMagSwift 提供基于球谐系数（SHC）模型（如 IGRF、WMM）的快速离线地磁场计算。

## 概述

- 计算地磁场分量（北/东/下）、磁偏角、磁倾角与场强。
- 支持多代模型（IGRF/WMM/WMMHR）。
- 结果确定、适用于导航、制图与科研。
- 模型内置后可完全离线运行。

## SHCModel 说明

`SHCModel` 是地球磁场的球谐系数模型。它包含：

- `epochs`：系数定义的十进制年份序列。
- `coefficients`：各历元的高斯系数 `g(n,m)` 与 `h(n,m)`。
- `nmax`：最大阶/次数。
- `validFrom` / `validTo`：模型推荐有效期。

该模型将地磁势函数表示为截断的球谐展开。在地心坐标下，磁势 `V` 为：

```
V(r, θ, λ) = a * Σ(n=1..N) (a/r)^(n+1) Σ(m=0..n)
            [ g(n,m) cos(mλ) + h(n,m) sin(mλ) ] P(n,m)(cos θ)
```

其中：
- `a` 为地球参考半径。
- `r` 为地心距离。
- `θ` 为余纬，`λ` 为经度。
- `P(n,m)` 为 Schmidt 半正规化的缔合勒让德函数。

磁场向量由磁势梯度得到：

```
B = -∇V
```

## 计算步骤

1. **十进制年份**
   将输入 `Date` 转换为十进制年份 `t`。

2. **历元插值**
   找到相邻历元 `t0`、`t1`，计算插值比例：
   
   ```
   f = (t - t0) / (t1 - t0)
   g(t) = g(t0) + (g(t1) - g(t0)) * f
   h(t) = h(t0) + (h(t1) - h(t0)) * f
   ```

3. **球谐合成**
   计算缔合勒让德函数，并由系数合成地心坐标下的磁场分量。

4. **转换到局部坐标**
   得到北 (`X`)、东 (`Y`)、下 (`Z`) 三个分量。

5. **派生量**
   
   ```
   H = sqrt(X^2 + Y^2)          // 水平强度
   F = sqrt(H^2 + Z^2)          // 总强度
   D = atan2(Y, X)              // 磁偏角
   I = atan2(Z, H)              // 磁倾角
   ```

6. **长期变化（SV）**
   使用历元差分计算导数，并传播到派生量。

## Topics

### Models

- ``SHCModel``

### Results

- ``MagneticFieldSolution``
- ``MagneticFieldResult``
- ``MagneticFieldSecularVariation``
