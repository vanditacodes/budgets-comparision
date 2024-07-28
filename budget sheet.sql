CREATE DATABASE taxes_budgets;
USE taxes_budgets;

CREATE TABLE BudgetComparison (
    Category VARCHAR(255) PRIMARY KEY,
    Budget2023 DECIMAL(15, 2),
    Budget2024 DECIMAL(15, 2),
    KeyChanges TEXT
);


INSERT INTO BudgetComparison (Category, Budget2023, Budget2024, KeyChanges) VALUES
('Fiscal Deficit Target', NULL, NULL, 'Aggressive reduction target'),
('Tax Reforms', NULL, NULL, '- Removal of Angel Tax\n- Reduced corporate tax for foreign companies'),
('Healthcare', 83000, 86200, 'Increase of 3,200 crores'),
('Education', 89155, 93224, 'Increase of 4,069 crores'),
('Customs Duty Reductions', NULL, NULL, 'Specific reductions on mobile phone components, gold, silver, cancer drugs'),
('GST Reforms', NULL, NULL, 'Streamlined framework and new amendments'),
('Inclusivity Initiatives', NULL, NULL, 'Special programs for women, youth, and farmers'),
('Infrastructure', 105000, 100000, 'Decrease of 5,000 crores'),
('Agriculture', 145000, 150000, 'Increase of 5,000 crores'),
('Defense', 293000, 300000, 'Increase of 7,000 crores'),
('Social Welfare', 115000, 120000, 'Increase of 5,000 crores'),
('Energy and Environment', 75000, 80000, 'Increase of 5,000 crores'),
('Digitalization', 45000, 50000, 'Increase of 5,000 crores');


SELECT 
    Category,
    Budget2023,
    Budget2024,
    KeyChanges,
    (Budget2024 - Budget2023) AS ChangeAmount,
    CASE WHEN Budget2023 > 0 THEN ((Budget2024 - Budget2023) / Budget2023) * 100 ELSE NULL END AS ChangePercentage
FROM BudgetComparison;

CREATE INDEX idx_Budget2024 ON BudgetComparison (Budget2024);

DROP TABLE BudgetComparison;