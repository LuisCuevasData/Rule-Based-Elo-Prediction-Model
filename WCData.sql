-- Recent form for each team (last 3 years = 2023-2025, most predictive window)
SELECT
    team,
    COUNT(*) AS matches,
    SUM(wins) AS wins,
    SUM(draws) AS draws,
    SUM(losses) AS losses,
    ROUND(AVG(goals_scored), 3) AS avg_goals_scored,
    ROUND(AVG(goals_conceded), 3) AS avg_goals_conceded,
    ROUND(1.0 * SUM(wins) / COUNT(*), 3) AS win_rate
FROM (
    SELECT
        home_team AS team,
        CASE WHEN TRY_CAST(home_score AS INT) > TRY_CAST(away_score AS INT) THEN 1 ELSE 0 END AS wins,
        CASE WHEN TRY_CAST(home_score AS INT) = TRY_CAST(away_score AS INT) THEN 1 ELSE 0 END AS draws,
        CASE WHEN TRY_CAST(home_score AS INT) < TRY_CAST(away_score AS INT) THEN 1 ELSE 0 END AS losses,
        TRY_CAST(home_score AS FLOAT) AS goals_scored,
        TRY_CAST(away_score AS FLOAT) AS goals_conceded
    FROM results
    WHERE TRY_CAST(home_score AS INT) IS NOT NULL
      AND date >= '2023-01-01'

    UNION ALL

    SELECT
        away_team AS team,
        CASE WHEN TRY_CAST(away_score AS INT) > TRY_CAST(home_score AS INT) THEN 1 ELSE 0 END AS wins,
        CASE WHEN TRY_CAST(home_score AS INT) = TRY_CAST(away_score AS INT) THEN 1 ELSE 0 END AS draws,
        CASE WHEN TRY_CAST(away_score AS INT) < TRY_CAST(home_score AS INT) THEN 1 ELSE 0 END AS losses,
        TRY_CAST(away_score AS FLOAT) AS goals_scored,
        TRY_CAST(home_score AS FLOAT) AS goals_conceded
    FROM results
    WHERE TRY_CAST(home_score AS INT) IS NOT NULL
      AND date >= '2023-01-01'
) AS combined
GROUP BY team
ORDER BY win_rate DESC;

-- World Cup specific performance (how teams historically perform in WC tournaments)
SELECT
    team,
    COUNT(*) AS wc_matches,
    SUM(wins) AS wc_wins,
    ROUND(AVG(goals_scored), 3) AS avg_wc_goals_scored,
    ROUND(AVG(goals_conceded), 3) AS avg_wc_goals_conceded,
    ROUND(1.0 * SUM(wins) / COUNT(*), 3) AS wc_win_rate
FROM (
    SELECT
        home_team AS team,
        CASE WHEN TRY_CAST(home_score AS INT) > TRY_CAST(away_score AS INT) THEN 1 ELSE 0 END AS wins,
        TRY_CAST(home_score AS FLOAT) AS goals_scored,
        TRY_CAST(away_score AS FLOAT) AS goals_conceded
    FROM results
    WHERE tournament LIKE '%World Cup%'
      AND TRY_CAST(home_score AS INT) IS NOT NULL

    UNION ALL

    SELECT
        away_team AS team,
        CASE WHEN TRY_CAST(away_score AS INT) > TRY_CAST(home_score AS INT) THEN 1 ELSE 0 END AS wins,
        TRY_CAST(away_score AS FLOAT) AS goals_scored,
        TRY_CAST(home_score AS FLOAT) AS goals_conceded
    FROM results
    WHERE tournament LIKE '%World Cup%'
      AND TRY_CAST(home_score AS INT) IS NOT NULL
) AS wc
GROUP BY team
HAVING COUNT(*) >= 5
ORDER BY wc_win_rate DESC;

-- Head to head records between all WC 2026 group stage matchups
WITH wc_teams AS (
    SELECT team FROM (VALUES
        ('Mexico'),('South Korea'),('South Africa'),('Czechia'),
        ('Canada'),('Bosnia and Herzegovina'),('Qatar'),('Switzerland'),
        ('Brazil'),('Morocco'),('Haiti'),('Scotland'),
        ('United States'),('Paraguay'),('Australia'),('Turkey'),
        ('Argentina'),('Spain'),('Uzbekistan'),('New Zealand'),
        ('France'),('Senegal'),('Norway'),('Colombia'),
        ('Germany'),('Portugal'),('Belgium'),('Algeria'),
        ('Netherlands'),('Iran'),('Cote d''Ivoire'),('Tunisia'),
        ('England'),('Croatia'),('Egypt'),('Ghana'),
        ('Japan'),('Uruguay'),('DR Congo'),('Cabo Verde'),
        ('Ecuador'),('Sweden'),('Saudi Arabia'),('Jordan'),
        ('Curacao'),('Panama'),('Austria'),('Cameroon')
    ) AS t(team)
)
SELECT
    r.home_team,
    r.away_team,
    COUNT(*) AS matches,
    SUM(CASE WHEN TRY_CAST(home_score AS INT) > TRY_CAST(away_score AS INT) THEN 1 ELSE 0 END) AS home_wins,
    SUM(CASE WHEN TRY_CAST(home_score AS INT) = TRY_CAST(away_score AS INT) THEN 1 ELSE 0 END) AS draws,
    SUM(CASE WHEN TRY_CAST(home_score AS INT) < TRY_CAST(away_score AS INT) THEN 1 ELSE 0 END) AS away_wins
FROM results r
WHERE r.home_team IN (SELECT team FROM wc_teams)
  AND r.away_team IN (SELECT team FROM wc_teams)
  AND TRY_CAST(home_score AS INT) IS NOT NULL
GROUP BY r.home_team, r.away_team
HAVING COUNT(*) >= 1
ORDER BY home_team, away_team;