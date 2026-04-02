-- ============================================================
-- Habit Lab — Supabase SQL Schema + RLS Policies
-- Run this in the Supabase SQL Editor
-- ============================================================

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ============================================================
-- 1. HABITS LOG
-- ============================================================
CREATE TABLE IF NOT EXISTS habits_log (
  id           UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id      UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  date         DATE NOT NULL DEFAULT CURRENT_DATE,
  habit_name   TEXT NOT NULL,
  completed    BOOLEAN NOT NULL DEFAULT FALSE,
  mood         INT CHECK (mood BETWEEN 1 AND 10),
  energy       INT CHECK (energy BETWEEN 1 AND 10),
  sleep_hours  FLOAT CHECK (sleep_hours BETWEEN 0 AND 24),
  notes        TEXT,
  created_at   TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================
-- 2. SPENDING LOG
-- ============================================================
CREATE TABLE IF NOT EXISTS spending_log (
  id         UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id    UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  date       DATE NOT NULL DEFAULT CURRENT_DATE,
  amount     FLOAT NOT NULL CHECK (amount >= 0),
  category   TEXT NOT NULL,
  mood       INT CHECK (mood BETWEEN 1 AND 10),
  impulse    BOOLEAN NOT NULL DEFAULT FALSE,
  notes      TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================
-- 3. MATCHA LOG
-- ============================================================
CREATE TABLE IF NOT EXISTS matcha_log (
  id              UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id         UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  date            DATE NOT NULL DEFAULT CURRENT_DATE,
  cups            INT NOT NULL CHECK (cups >= 0),
  caffeine_level  TEXT CHECK (caffeine_level IN ('low', 'medium', 'high')),
  mood_before     INT CHECK (mood_before BETWEEN 1 AND 10),
  mood_after      INT CHECK (mood_after BETWEEN 1 AND 10),
  energy_after    INT CHECK (energy_after BETWEEN 1 AND 10),
  time_of_day     TIME,
  notes           TEXT,
  created_at      TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================
-- 4. CLOTHES LOG
-- ============================================================
CREATE TABLE IF NOT EXISTS clothes_log (
  id           UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id      UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  date         DATE NOT NULL DEFAULT CURRENT_DATE,
  outfit_tags  TEXT[] NOT NULL DEFAULT '{}',
  weather      TEXT,
  temperature  FLOAT,
  mood         INT CHECK (mood BETWEEN 1 AND 10),
  confidence   INT CHECK (confidence BETWEEN 1 AND 10),
  notes        TEXT,
  created_at   TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================
-- INDEXES for performance
-- ============================================================
CREATE INDEX IF NOT EXISTS idx_habits_log_user_date   ON habits_log(user_id, date DESC);
CREATE INDEX IF NOT EXISTS idx_spending_log_user_date ON spending_log(user_id, date DESC);
CREATE INDEX IF NOT EXISTS idx_matcha_log_user_date   ON matcha_log(user_id, date DESC);
CREATE INDEX IF NOT EXISTS idx_clothes_log_user_date  ON clothes_log(user_id, date DESC);

-- ============================================================
-- ROW LEVEL SECURITY (RLS)
-- ============================================================

ALTER TABLE habits_log  ENABLE ROW LEVEL SECURITY;
ALTER TABLE spending_log ENABLE ROW LEVEL SECURITY;
ALTER TABLE matcha_log  ENABLE ROW LEVEL SECURITY;
ALTER TABLE clothes_log ENABLE ROW LEVEL SECURITY;

-- -------- habits_log policies --------
CREATE POLICY "habits_select" ON habits_log
  FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "habits_insert" ON habits_log
  FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "habits_update" ON habits_log
  FOR UPDATE USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "habits_delete" ON habits_log
  FOR DELETE USING (auth.uid() = user_id);

-- -------- spending_log policies --------
CREATE POLICY "spending_select" ON spending_log
  FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "spending_insert" ON spending_log
  FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "spending_update" ON spending_log
  FOR UPDATE USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "spending_delete" ON spending_log
  FOR DELETE USING (auth.uid() = user_id);

-- -------- matcha_log policies --------
CREATE POLICY "matcha_select" ON matcha_log
  FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "matcha_insert" ON matcha_log
  FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "matcha_update" ON matcha_log
  FOR UPDATE USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "matcha_delete" ON matcha_log
  FOR DELETE USING (auth.uid() = user_id);

-- -------- clothes_log policies --------
CREATE POLICY "clothes_select" ON clothes_log
  FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "clothes_insert" ON clothes_log
  FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "clothes_update" ON clothes_log
  FOR UPDATE USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "clothes_delete" ON clothes_log
  FOR DELETE USING (auth.uid() = user_id);
