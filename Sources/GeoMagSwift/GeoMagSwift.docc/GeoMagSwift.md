# ``GeoMagSwift``

*Looking for Chinese? → <doc:GeoMagSwift-zh>*

GeoMagSwift provides fast, offline geomagnetic field computation based on spherical harmonic coefficient (SHC) models such as IGRF and WMM.

## Overview

- Compute magnetic field components (north/east/down), declination, inclination, and intensity.
- Support multiple model generations (IGRF/WMM/WMMHR).
- Deterministic and suitable for navigation, mapping, and scientific analysis.
- Designed to run without network access once model data is embedded.

## SHCModel Explained

`SHCModel` is a spherical harmonic coefficient model of the Earth's magnetic field. The model contains:

- `epochs`: discrete decimal years for which coefficients are defined.
- `coefficients`: Gauss coefficients `g(n,m)` and `h(n,m)` for each epoch.
- `nmax`: maximum degree/order of the model.
- `validFrom` / `validTo`: recommended validity range for the model.

The model represents the geomagnetic potential as a truncated spherical harmonic expansion. In geocentric coordinates, the magnetic potential `V` is:

```
V(r, θ, λ) = a * Σ(n=1..N) (a/r)^(n+1) Σ(m=0..n)
            [ g(n,m) cos(mλ) + h(n,m) sin(mλ) ] P(n,m)(cos θ)
```

Where:
- `a` is the reference Earth radius.
- `r` is the geocentric radius.
- `θ` is colatitude, `λ` is longitude.
- `P(n,m)` are Schmidt semi-normalized associated Legendre functions.

The magnetic field vector is derived from the potential:

```
B = -∇V
```

## Step-by-step Computation

1. **Decimal year**
   Convert the input `Date` to decimal year `t`.

2. **Epoch interpolation**
   Find surrounding epochs `t0` and `t1`, compute the interpolation fraction:
   
   ```
   f = (t - t0) / (t1 - t0)
   g(t) = g(t0) + (g(t1) - g(t0)) * f
   h(t) = h(t0) + (h(t1) - h(t0)) * f
   ```

3. **Spherical harmonic synthesis**
   Evaluate associated Legendre functions and compute magnetic field components in geocentric coordinates from the coefficients.

4. **Convert to local components**
   Transform to north (`X`), east (`Y`), down (`Z`) components.

5. **Derived quantities**
   
   ```
   H = sqrt(X^2 + Y^2)          // horizontal intensity
   F = sqrt(H^2 + Z^2)          // total intensity
   D = atan2(Y, X)              // declination
   I = atan2(Z, H)              // inclination
   ```

6. **Secular variation**
   Compute derivatives (using linear differences between epochs) and propagate to derived values.

## Topics

### Models

- ``SHCModel``

### Results

- ``MagneticFieldSolution``
- ``MagneticFieldResult``
- ``MagneticFieldSecularVariation``
