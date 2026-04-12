# FIFA World Cup 2026 — Composite Elo Prediction Model

> A rule-based Elo rating system built on 49,000+ rows of international football data to simulate the 2026 FIFA World Cup bracket — from group stage through to the final.

---

## Project Overview

With the 2026 FIFA World Cup groups officially drawn, this project uses historical international football data to answer one question:

> *What does the data say about who lifts the trophy on July 19, 2026?*

Using a **Composite Elo Rating System** built entirely from match results, recent form, and World Cup performance history, this model simulates all 12 groups, applies the new 2026 format rules (best 8 third-place teams advance), and runs a full knockout bracket to crown a predicted champion.

---

## Methodology

This is a **rule-based Elo prediction model** — not a machine learning model. The distinction matters: no weights were learned from data. Instead, three components are combined using manually assigned weights grounded in sports analytics literature:

| Component | Weight | Description |
|---|---|---|
| Elo Rating | 40% | Head-to-head historical win/loss record, updated iteratively |
| Recent Form | 35% | Win rate, goals scored/conceded from 2023–2025 matches |
| WC History | 25% | All-time World Cup win rate and goal averages |

### Elo System
All 48 teams start at a baseline rating of **1500**. Ratings are updated after every historical head-to-head match using the standard Elo formula with K=30. Teams that have consistently beaten strong opponents accumulate higher ratings over time.

### Outcome Thresholds
A match is predicted as a **win** for the stronger team when their composite win probability exceeds the opponent's by more than **12 percentage points**. Within that margin, the match is called a **draw**. In knockout rounds, drawn matches are decided in favor of the marginally stronger side (simulating extra time/penalties).

### 2026 Format
- 12 groups of 4 teams
- Top 2 from each group advance automatically (24 teams)
- Best 8 third-place teams advance by points, then goal difference, then goals scored (8 teams)
- Total: **32 teams** in the Round of 32

---

## Final Elo Power Rankings (Top 20)

Before a ball is kicked, the model produces a global power ranking based purely on historical head-to-head performance:

| Rank | Team | Elo Rating |
|---|---|---|
| 1 | Argentina | 1797.0 |
| 2 | Spain | 1726.7 |
| 3 | Germany | 1708.6 |
| 4 | Brazil | 1698.6 |
| 5 | England | 1693.6 |
| 6 | Belgium | 1631.4 |
| 7 | France | 1627.4 |
| 8 | Uruguay | 1617.0 |
| 9 | Croatia | 1600.0 |
| 10 | Colombia | 1587.7 |
| 11 | Mexico | 1586.9 |
| 12 | Turkey | 1577.2 |
| 13 | Netherlands | 1565.9 |
| 14 | Norway | 1546.7 |
| 15 | Morocco | 1545.1 |
| 16 | Paraguay | 1540.1 |
| 17 | Scotland | 1535.6 |
| 18 | Switzerland | 1534.8 |
| 19 | United States | 1530.5 |
| 20 | Iran | 1520.8 |

**Notable absence:** Portugal does not crack the top 20 despite being a world-class side. This reflects their historical record against their most frequent opponents — Spain (7W 12D 5L) and France (3W 2D 6L) — which drags their Elo rating down. It is a known limitation of Elo systems: dominance is measured relative to opponent quality and frequency, not absolute skill.

---

## Group Stage Results

### Group A — Mexico | South Korea | South Africa | Czechia
🥇 Mexico &nbsp;&nbsp; 🥈 South Korea &nbsp;&nbsp; Czechia ✅ (advances as best third)

### Group B — Canada | Bosnia and Herzegovina | Qatar | Switzerland
🥇 Switzerland &nbsp;&nbsp; 🥈 Canada &nbsp;&nbsp; Qatar ✅

### Group C — Brazil | Morocco | Haiti | Scotland
🥇 Brazil &nbsp;&nbsp; 🥈 Morocco &nbsp;&nbsp; Scotland ✅

### Group D — United States | Paraguay | Australia | Turkey
🥇 Australia &nbsp;&nbsp; 🥈 United States &nbsp;&nbsp; Turkey ✅

### Group E — Spain | Uzbekistan | New Zealand | Jordan
🥇 Spain &nbsp;&nbsp; 🥈 Uzbekistan &nbsp;&nbsp; New Zealand ❌

### Group F — Portugal | Algeria | Egypt | Ivory Coast
🥇 Portugal &nbsp;&nbsp; 🥈 Algeria &nbsp;&nbsp; Ivory Coast ✅

### Group G — Argentina | Curacao | Panama | Ecuador
🥇 Argentina &nbsp;&nbsp; 🥈 Curacao &nbsp;&nbsp; Panama ❌

### Group H — France | Senegal | Norway | Colombia
🥇 France &nbsp;&nbsp; 🥈 Norway &nbsp;&nbsp; Colombia ✅

### Group I — Germany | Netherlands | Saudi Arabia | Cabo Verde
🥇 Germany &nbsp;&nbsp; 🥈 Netherlands &nbsp;&nbsp; Saudi Arabia ❌

### Group J — England | Croatia | DR Congo | Ghana
🥇 England &nbsp;&nbsp; 🥈 Croatia &nbsp;&nbsp; DR Congo ❌

### Group K — Japan | Belgium | Austria | Sweden
🥇 Belgium &nbsp;&nbsp; 🥈 Japan &nbsp;&nbsp; Austria ✅

### Group L — Uruguay | Iran | South Korea | Tunisia
🥇 Iran &nbsp;&nbsp; 🥈 South Korea &nbsp;&nbsp; Tunisia ✅

---

## The Storylines

### Uruguay — Last in Group L
The model's most shocking group stage result. Uruguay, ranked 8th in the global Elo standings, finishes **dead last** in Group L. Iran's exceptional recent form (67.6% win rate, 2023–2025) pushes them to first, and South Korea's dominant historical head-to-head record against Uruguay seals the Celeste's fate. A brutal group for a nation that has lifted the World Cup twice.

### 🇳🇴 Norway — The Dark Horse Reaches the Quarter Finals
Nobody's pick to make a deep run, Norway advances as Group H runner-up ahead of Colombia, then eliminates South Korea in the Round of 16 before reaching the Quarter Finals. Their recent form (59.4% win rate, 2.594 avg goals scored) is quietly elite — the model rewards it. A genuine data-driven surprise.

### 🇧🇷 Brazil — Bouncing Back for Bronze
Brazil enters the tournament in arguably their worst recent form among the traditional powers (42.9% win rate, 2023–2025) — a red flag that shows up in their group stage performance and eventual semifinal exit. Yet their Elo rating (1698.6) and World Cup pedigree (64.1% all-time WC win rate) carries them deep. They fall to Argentina in the semis but recover to beat the Netherlands for the bronze medal — a redemption arc the data supports.

### Brazil vs Argentina — Classic Rivalry on the World Stage
The model produces a Brazil vs Argentina semifinal — one of football's most storied rivalries, and historically one of the most anticipated fixtures in the sport. Argentina edges their rivals 54.5% to 36.4%, a margin that reflects both their superior recent form and their historical head-to-head dominance (62 wins to Brazil's 28 in 110 meetings).

### Germany vs Argentina — A Final for the History Books
The model predicts a **Germany vs Argentina final** — the fourth time in World Cup history these nations have met in the final, following 1986 (Argentina won), 1990 (Germany won), and 2014 (Germany won). Argentina leads the all-time final series 2–1 and the model gives them the edge at 46.7% to 36.9%, predicting a **back-to-back World Cup title** for La Albiceleste — and a chance to level the greatest rivalry in the sport's biggest moment.

### 🇪🇸 Spain — The Biggest Upset of the Tournament
The model's most counterintuitive result: Spain, ranked **2nd in the global Elo standings** at 1726.7 and the tournament's strongest favorite on paper, are knocked out in the **Round of 16** by Argentina. Despite winning Group E convincingly, Spain run into the defending champions at the worst possible time — Argentina's 42.1% to 36.9% edge reflects their head-to-head dominance and superior recent form, but this is precisely where the model's limitations are most visible. Spain's 74.4% recent win rate, elite goal-scoring average (2.667 per game), and status as FIFA's top-ranked team suggest they are undervalued here. In reality, a Spain vs Argentina knockout clash would be one of the most evenly contested matches imaginable — the model calls it for Argentina, but any honest analyst would flag this as a coin flip.

---

## Model Limitations & Where to Be Skeptical

This model produces compelling narratives, but it has real limitations that any honest analyst should flag.

### Argentina's Schedule Strength
Argentina tops the Elo rankings and leads in recent form at 81.1% — but **who have they been beating?** Their 2023–2025 opponents in the data skew toward CONMEBOL sides and international friendlies against teams that are not among the world's elite. A model that weights recent results without adjusting for opponent quality will overrate teams that consistently beat weaker competition. Argentina may genuinely be the world's best — but the data alone cannot confirm it.

### Germany and Brazil: Form vs Pedigree
Two of the tournament's most decorated nations arrive in 2026 in poor recent form:
- **Germany:** 55.3% recent win rate — functional but far from dominant
- **Brazil:** 42.9% recent win rate — their worst stretch in modern football

Yet the model sends both to the final four. Why? Their Elo ratings (built from decades of results) and World Cup historical performance (Germany 70.3%, Brazil 64.1% all-time WC win rate) are so strong that they compensate for the recent form dip. Whether that pedigree translates to 2026 or whether these teams are genuinely in decline is something **the model cannot distinguish**. A human scout watching film would have more signal here than the numbers do.

### The 36.9% Floor
Observant readers will notice that losing teams frequently register a 36.9% win probability regardless of the matchup. This is a known artifact of the composite scoring system — when a team's aggregate score falls below a certain threshold relative to the opponent, the probability calculation floors out. It does not mean every losing team had identical chances; it means the model's discrimination at the lower end of the distribution is limited.

### No Injury, Form, or Squad Data
The model knows nothing about:
- Current injuries 
- Player form heading into the tournament
- Tactical setups or managerial changes
- Home continent advantage (CONCACAF teams playing in North America)

These are meaningful factors that pure historical data cannot capture.

---

## Predicted Results Summary

### Round of 32
| Match | Winner |
|---|---|
| Mexico vs Scotland | Mexico |
| Brazil vs United States | Brazil |
| Austria vs Switzerland | Austria |
| Morocco vs Australia | Morocco |
| Spain vs Colombia | Spain |
| Argentina vs Algeria | Argentina |
| Portugal vs Turkey | Portugal |
| France vs Curacao | France |
| Germany vs Tunisia | Germany |
| Belgium vs Croatia | Belgium |
| England vs Czechia | England |
| Iran vs Japan | Iran |
| South Korea vs Qatar | South Korea |
| Norway vs Uzbekistan | Norway |
| Ivory Coast vs Canada | Ivory Coast |
| Netherlands vs South Korea | Netherlands |

### Round of 16
| Match | Winner |
|---|---|
| Mexico vs Brazil | Brazil |
| Austria vs Morocco | Morocco |
| Spain vs Argentina | Argentina |
| Portugal vs France | France |
| Germany vs Belgium | Germany |
| England vs Iran | England |
| South Korea vs Norway | Norway |
| Ivory Coast vs Netherlands | Netherlands |

### Quarter Finals
| Match | Winner |
|---|---|
| Brazil vs Morocco | Brazil |
| Argentina vs France | Argentina |
| Germany vs England | Germany |
| Norway vs Netherlands | Netherlands |

### Semi Finals
| Match | Winner |
|---|---|
| Brazil vs Argentina | Argentina |
| Germany vs Netherlands | Germany |

### Third Place
**Brazil** def. Netherlands

### Final
**Argentina** def. Germany

---

## Tools & Techniques

- **Python** — Elo rating computation, composite scoring, bracket simulation
- **Google Colab** — development environment
- **SQL Server** — feature extraction from 49,287 international match records
- **Elo Algorithm** — iterative head-to-head rating system (K=30)
- **Weighted Composite Scoring** — 40% Elo / 35% recent form / 25% WC history
- **2026 FIFA Format** — 12 groups, best-8 third-place rule, 32-team knockout bracket

---

## Related Project

This predictor is the second part of a two-project series. The first project — **El Fútbol de La Isla** — uses the same dataset to analyze Puerto Rico's international football history across eight decades, tracing the island's remarkable transformation from historic 14-goal defeats in the 1940s to their best-ever decade in the 2020s.
