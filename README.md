# Readme

## How to install

This will need the last version of git as we need the `sparse-checkout` git command. Here's how to update :

```bash
sudo add-apt-repository -y ppa:git-core/ppa
sudo apt-get update
sudo apt-get install git -y
```

Follow those steps to install

```bash
# clone the repo without getting any files history except root files
git clone --filter=blob:none --no-checkout --depth 1 --sparse https://github.com/roboracingleague/donkeycar-models

# Get only the 'hooks/' & 'onnx/' folders
cd donkeycar-models
git config core.sparsecheckout true
git sparse-checkout add hooks onnx
git checkout

# Launch first convertion
./hooks/src/post-merge init

# install the git hooks
cd hooks
./install_hooks.sh
```

## How to use

Whenever a new onnx is created and should be deployed on the cars, it must be commited and pushed on the remote in the `onnx` folder. The file should be named either `behavior*.onnx` or `detector*.onnx`, depending on the type of model it is.

To retrieve the new model on the car, connect to the car, cd to the models directory, and pull the repository.

```bash
cd donkeycar-models
git pull
```

The pull command will trigger the `post-merge` hook who in turn will convert the new `onnx` file to a `trt` file.

## Models Reference

### Model Type

* L : Left
* C : Center
* R : Right
* S : Speed
* O : Obstacle

### Model list

| Model | Model Type | Steering Ref. | Kernels | In                     | Out                 | Learning Type                  | Val. Dataset | # Images | img Type | Val. Loss | Epoch | Angle Accuracy | Throttle Accuracy | Val. Angle Accuracy | Val. Throttle Accuracy | Max. dist. | Note                                                                             |
|------:|------------|:-------------:|--------:|------------------------|---------------------|:-------------------------------|:-------------|---------:|----------|----------:|------:|---------------:|------------------:|--------------------:|-----------------------:|-----------:|--------------------------------------------------------------------------------- |
|   050 | LCR        |   0.4 / 0.6   |      12 | img & Desired behavior | Steering + Throttle | -                              | Shuffle      |     60 K | Raw      |   0.12036 |    39 |              - |                 - |                   - |                      - |          - |                                                                                  |
|   051 | LCR        |   0.4 / 0.6   |      12 | img & Desired behavior | Steering + Throttle | -                              | Shuffle      |     72 K | Raw      |   0.18487 |    33 |              - |                 - |                   - |                      - |          - |                                                                                  |
|   052 | LCR        |   0.4 / 0.6   |      12 | img & Desired behavior | Steering + Throttle | Transfer from 50               | Shuffle      |     72 K | Raw      |   0.18065 |    46 |              - |                 - |                   - |                      - |          - |                                                                                  |
|   053 | LCR        |  0.35 / 0.65  |      12 | img & Desired behavior | Steering + Throttle | -                              | Shuffle      |     72 K | Raw      |   0.19021 |    35 |              - |                 - |                   - |                      - |          - |                                                                                  |
|   054 | LCR        |  0.35 / 0.65  |      12 | img & Desired behavior | Steering + Throttle | Transfer from 52               | Shuffle      |     72 K | Raw      |   0.13072 |    21 |              - |                 - |                   - |                      - |          - |                                                                                  |
|   055 | LCRS       |  0.35 / 0.65  |      12 | img & Desired behavior | Steering + Throttle | -                              | Shuffle      |     72 K | Raw      |   0.13679 |    26 |         0.9063 |            0.9885 |              0.9024 |                 0.9918 |          - |                                                                                  |
|   056 | LCRS       |  0.35 / 0.65  |      24 | img & Desired behavior | Steering + Throttle | Transfer from 52               | Shuffle      |     72 K | Raw      |   0.11870 |    18 |         0.9255 |            0.9899 |              0.9146 |                 0.9943 |          - |                                                                                  |
|   057 | LCRS       |   0.3 / 0.7   |      12 | img & Desired behavior | Steering + Throttle | -                              | Shuffle      |     72 K | Raw      |   0.13842 |    26 |         0.9180 |            0.9899 |              0.8993 |                 0.9925 |          - |                                                                                  |
|   058 | LCRS       |  0.25 / 0.75  |      12 | img & Desired behavior | Steering + Throttle | -                              | Shuffle      |     45 K | Raw      |   0.14651 |    17 |              - |                 - |                   - |                      - |          - |                                                                                  |
|   060 | LCRS       |   0.3 / 0.7   |      24 | img & Desired behavior | Steering + Throttle | Alpine                         | Shuffle      |     45 K | Raw      |   0.13537 |    34 |              - |                 - |                   - |                      - |          - |                                                                                  |
|   064 | LCRS       |  0.25 / 0.75  |      12 | img & Desired behavior | Steering + Throttle | Alpine                         | Shuffle      |     45 K | Raw      |   0.05494 |    36 |              - |                 - |                   - |                      - |          - |                                                                                  |
|   065 | LCRS       |  0.25 / 0.75  |      12 | img & Desired behavior | Steering + Throttle | 20240126 Alpine                | Shuffle      |     45 K | Raw      |   0.11178 |    18 |              - |                 - |                   - |                      - |          - |                                                                                  |
|   066 | LCRS       |  0.25 / 0.75  |      12 | img & Desired behavior | Steering + Throttle | 20240126 Megane                | Shuffle      |     45 K | Raw      |   0.10231 |    28 |              - |                 - |                   - |                      - |          - |                                                                                  |
|   067 | LCRS       |  0.25 / 0.75  |      12 | img & Desired behavior | Steering + Throttle | 20240126 Sandero               | Shuffle      |     45 K | Raw      |   0.10181 |    15 |              - |                 - |                   - |                      - |          - |                                                                                  |
|   068 | LCRS       |  0.25 / 0.75  |      12 | img & Desired behavior | Steering + Throttle | 20240126 Megane+Sandero        | Shuffle      |     90 K | Raw      |   0.10163 |    19 |              - |                 - |                   - |                      - |          - |                                                                                  |
|   069 | LCRS       |  0.25 / 0.75  |      12 | img & Desired behavior | Steering + Throttle | 20240126 Alpine+Megane+Sandero | Shuffle      |    135 K | Raw      |   0.10854 |    24 |              - |                 - |                   - |                      - |          - |                                                                                  |
|   070 | LCRS       |  0.25 / 0.75  |      12 | img & Desired behavior | Steering + Throttle | 20240126 Alpine                | Shuffle      |     83 K | Raw      |   0.05773 |    19 |              - |                 - |                   - |                      - |          - |                                                                                  |
|   071 | LCRS       |  0.25 / 0.75  |      12 | img & Desired behavior | Steering + Throttle | 20240126 Megane                | Shuffle      |     90 K | Raw      |   0.05369 |    17 |              - |                 - |                   - |                      - |          - |                                                                                  |
|   072 | LCRS       |  0.25 / 0.75  |      12 | img & Desired behavior | Steering + Throttle | 20240126 Sandero               | Shuffle      |     90 K | Raw      |   0.06030 |    25 |              - |                 - |                   - |                      - |          - |                                                                                  |
|   073 | LCRS       |  0.25 / 0.75  |      12 | img & Desired behavior | Steering + Throttle | Alpine                         | Shuffle      |     90 K | Raw      |   0.06155 |    24 |              - |                 - |                   - |                      - |          - | Correction angle caméra +3Rpx. Le modèle tire trop à droite                      |
|   074 | LCRS       |  0.25 / 0.75  |      12 | img & Desired behavior | Steering + Throttle | Alpine                         | Shuffle      |     90 K | Raw      |         ? |     ? |              - |                 - |                   - |                      - |          - | Correction angle caméra +2Rpx. Le modèle tire trop à droite                      |
|   075 | LCRS       |  0.25 / 0.75  |      12 | img & Desired behavior | Steering + Throttle | Alpine                         | Shuffle      |     45 K | Raw      |         ? |     ? |              - |                 - |                   - |                      - |          - | Correction angle caméra +1Rpx. Le modèle tire trop à droite                      |
|   076 | LCRS       |  0.25 / 0.75  |      12 | img & Desired behavior | Steering + Throttle | Megane                         | Shuffle      |     45 K | Raw      |         ? |     ? |              - |                 - |                   - |                      - |          - | Correction angle caméra +2Rpx. Le modèle tire trop à droite                      |
|  078E | LCRS       |  0.25 / 0.75  |      12 | img & Desired behavior | Steering + Throttle | Alpine                         | Shuffle      |     45 K | Raw      |   0.11750 |    24 |              - |                 - |                   - |                      - |          - |                                                                                  |
|  078F | LCRS       |  0.25 / 0.75  |      24 | img & Desired behavior | Steering + Throttle | Alpine                         | Shuffle      |     45 K | Raw      |   0.11511 |    19 |              - |                 - |                   - |                      - |          - |                                                                                  |
|   079 | LCRS       |  0.25 / 0.75  |      12 | img & Desired behavior | Steering + Throttle | Alpine                         | Shuffle      |     90 K | Raw      |   0.06247 |    19 |              - |                 - |                   - |                      - |          - | Avec comportement retour en piste                                                |
|  079A | LCRS       |  0.25 / 0.75  |      24 | img & Desired behavior | Steering + Throttle | Alpine                         | Shuffle      |     90 K | Raw      |   0.06482 |    22 |              - |                 - |                   - |                      - |          - | Avec comportement retour en piste                                                |
|   080 | LCRS       |  0.25 / 0.75  |      12 | img & Desired behavior | Steering + Throttle | Alpine                         | Shuffle      |     90 K | Raw      |   0.12416 |    22 |              - |                 - |                   - |                      - |          - | Avec comportement retour en piste. Compensation latence 2 img.                   |
|   083 | LCRS       |  0.25 / 0.75  |      12 | img & Desired behavior | Steering + Throttle | Alpine                         | Shuffle      |    195 K | Raw      |   0.13814 |    37 |              - |                 - |                   - |                      - |          - | Avec comportement retour en piste. Compensation latence 2 img. train split 80/20 |
|   084 | LCRS       |  0.25 / 0.75  |      12 | img & Desired behavior | Steering + Throttle | Alpine                         | Shuffle      |    195 K | Raw      |   0.13458 |    32 |              - |                 - |                   - |                      - |          - | Avec comportement retour en piste. Compensation latence 2 img. train split 80/20 |
|  A001 | LRO        |      n/a      |      24 | img                    | Obstacle position   | -                              | Shuffle      |     17 K | Raw      |   0.21497 |    14 |              - |                 - |                   - |                      - |        1.2 |                                                                                  |
|  A020 | LRO        |      n/a      |      12 | img                    | Obstacle position   | -                              | Shuffle      |     17 K | Raw      |   0.09710 |    16 |              - |                 - |                   - |                      - |        1.5 |                                                                                  |
|  A021 | LRO        |      n/a      |      12 | img                    | Obstacle position   | -                              | Shuffle      |     17 K | Raw      |   0.10870 |    15 |              - |                 - |                   - |                      - |        1.2 |                                                                                  |
|  A022 | LRO        |      n/a      |      12 | img                    | Obstacle position   | -                              | Shuffle      |     17 K | Raw      |   0.08259 |    17 |              - |                 - |                   - |                      - |        2.0 |                                                                                  |
