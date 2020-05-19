-- Use WHERE clause to show the population of 'Germany'

SELECT population FROM world
  WHERE name = 'Germany';

-- Check a list with the word IN which allows us to check if an item is in a list

SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- BETWEEN allows range checking

SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000;
