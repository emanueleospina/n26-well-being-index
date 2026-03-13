# Financial Well-being Index — N26 Bank

Academic project developed in collaboration with N26 Bank. The goal was to design and implement a **Financial Well-being Index** for N26's client base, built on a hierarchical fuzzy inference system in MATLAB. The final report was presented at N26's headquarters and covered by major national media.

---

## Model Architecture

The index aggregates **14 financial variables** through a 4-level hierarchical fuzzy inference tree, where each level combines outputs from the previous one until converging into a single index score — the **Client Profile**.

```
Level 1 (Inputs → Intermediate FIS)
├── SATISFACTION   ← NetIncome, FinancialSatisfaction
├── BUDGETING      ← FinancialDeficit, FinancialDebtCommitment
├── MANAGEMENT     ← PersonalFinancialManagement, SecurityNet
├── SECURITY       ← SalaryVariation, FinancialSecurity
├── HEXPENSES      ← FixedFinancialCosts, VariationFFC
├── SAVINGS        ← Savings, RetirementSavings
└── RESILIENCE     ← LiquidityRisk, LiquiditySecurityNet

Level 2 (Intermediate → Composite FIS)
├── CONTENTMENT      ← SATISFACTION
├── PLANNING         ← BUDGETING + MANAGEMENT
├── SHELTERSTABILITY ← SECURITY + HEXPENSES
└── FUTURE           ← SAVINGS + RESILIENCE

Level 3 (Composite → Pillar FIS)
├── HARMONY     ← CONTENTMENT + PLANNING
└── PERSPECTIVE ← SHELTERSTABILITY + FUTURE

Level 4 (Final Index)
└── PROFILE ← HARMONY + PERSPECTIVE
```

---

## Repository Structure

```
n26-wellbeing-index/
├── README.md
├── fuzzy1treecopy.m       ← Main MATLAB script — builds and evaluates the full FIS tree
├── fis/                   ← Fuzzy Inference System definition files (human-readable)
│   ├── V2_F1_SATISFACTION.fis
│   ├── V2_F1_BUDGETING.fis
│   ├── V2_F1_MANAGEMENT.fis
│   ├── V2_F1_SECURITY.fis
│   ├── V2_F1_HEXPENSES.fis
│   ├── V2_F1_SAVINGS.fis
│   ├── V2_F1_RESILIENCE.fis
│   ├── V2_F2_CONTENTMENT.fis
│   ├── V2_F2_PLANNING.fis
│   ├── V2_F2_SHELTERSTABILITY.fis
│   ├── V2_F2_FUTURE.fis
│   ├── V2_F3_HARMONY.fis
│   ├── V2_F3_PERSPECTIVE.fis
│   └── V2_F4_PROFILE.fis
└── mat/                   ← Pre-built MATLAB model files (load directly into MATLAB)
    ├── V2_F1_SATISFACTION.mat
    ├── V2_F1_BUDGETING.mat
    ├── V2_F1_MANAGEMENT.mat
    ├── V2_F1_SECURITY.mat
    ├── V2_F1_HEXPENSES.mat
    ├── V2_F1_SAVINGS.mat
    ├── V2_F1_RESILIENCE.mat
    ├── V2_F2_CONTENTMENT.mat
    ├── V2_F2_PLANNING.mat
    ├── V2_F2_SHELTERSTABILITY.mat
    ├── V2_F2_FUTURE.mat
    ├── V2_F3_HARMONY.mat
    ├── V2_F3_PERSPECTIVE.mat
    ├── V2_F4_PROFILE.mat
    ├── V2_TREE_CONTENTMENT.mat
    ├── V2_TREE_PLANNING.mat
    ├── V2_TREE_SHELTERSTABILITY.mat
    ├── V2_TREE_FUTURE.mat
    ├── V2_TREE_HARMONY.mat
    ├── V2_TREE_PERSPECTIVE.mat
    └── V2_TRUNK_PROFILE.mat
```

---

## Requirements

- MATLAB with the **Fuzzy Logic Toolbox**

---

## Usage

1. Clone the repository and open MATLAB
2. Set the working directory to the repo root
3. Make sure all `.mat` files from `mat/` are on the MATLAB path
4. Prepare your input data matrix following the variable order below
5. Run the main script:

```matlab
run('fuzzy1treecopy.m')
```

### Input variable order

| # | Variable | Description |
|---|----------|-------------|
| 1 | NetIncome | Monthly net income |
| 2 | FinancialSatisfaction | Self-reported financial satisfaction |
| 3 | FinancialDeficit | Monthly budget deficit |
| 4 | FinancialDebtCommitment | Debt-to-income ratio |
| 5 | PersonalFinancialManagement | Self-reported financial management ability |
| 6 | SecurityNet | Availability of a financial safety net |
| 7 | SalaryVariation | Month-to-month salary variation |
| 8 | FinancialSecurity | Self-reported financial security |
| 9 | FixedFinancialCosts | Fixed housing/living costs |
| 10 | VariationFFC | Variation in fixed financial costs |
| 11 | Savings | Current savings level |
| 12 | RetirementSavings | Retirement savings level |
| 13 | LiquidityRisk | Exposure to liquidity risk |
| 14 | LiquiditySecurityNet | Liquidity safety net availability |

---

## Output

The model returns a **Client Profile score** between 0 and 10, representing the overall financial well-being of a client. Intermediate outputs (Harmony, Perspective, and all sub-dimensions) are also available for granular analysis.

---

## Data

Survey data used to validate the model was collected across two cohorts (2022–2023) and is not included in this repository due to privacy constraints.
