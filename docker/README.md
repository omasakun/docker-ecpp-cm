# Docker Image for CM software

[The CM software](https://www.multiprecision.org/cm/index.html) provides a fast [ECPP](https://en.wikipedia.org/wiki/Elliptic_curve_primality) implementation, which can be used to test the primality of large numbers.

This repository contains Docker images with the CM software and its dependencies.

## Features

- Lightweight Alpine Linux base
- MPFRCX and CM libraries are built from source (because precompiled binaries are not available for Alpine)
- MPI-enabled CM build for parallel computation scenarios

## Included Libraries

This image bundles several libraries used in computational mathematics:

- [GMP](https://gmplib.org/): Arbitrary-precision arithmetic for signed integers, rational numbers, and floating-point numbers.
- [MPFR](https://www.mpfr.org/): Multiple-precision floating-point computations with correct rounding.
- [MPC](http://www.multiprecision.org/): Arbitrary-precision complex number arithmetic with correct rounding.
- [MPFRCX](https://www.multiprecision.org/mpfrcx/index.html): Univariate polynomial arithmetic over arbitrary-precision real or complex numbers, without rounding control.
- [CM](https://www.multiprecision.org/cm/index.html): Constructs ring class fields of imaginary quadratic fields and elliptic curves with complex multiplication using floating-point approximations.
- [PARI/GP](https://pari.math.u-bordeaux.fr/): A computer algebra system optimized for number theory.
- [FLINT](https://www.flintlib.org/): A fast Library for number theory

## Example Usage

Check the [cm-0.4.3 documentation](https://www.multiprecision.org/downloads/cm-0.4.3.pdf) for detailed usage instructions.

```bash
# Start a PARI/GP shell
docker run --rm -it o137/cm gp

# Prove the primality of a number using ECPP
docker run --rm -it o137/cm ecpp -n "11^11+22^22+33^33+149" -c -p
```

## Repository

https://github.com/omasakun/docker-cm
