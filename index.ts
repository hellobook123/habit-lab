// types/index.ts

export interface HabitLog {
  id: string;
  user_id: string;
  date: string;
  habit_name: string;
  completed: boolean;
  mood: number | null;
  energy: number | null;
  sleep_hours: number | null;
  notes: string | null;
  created_at: string;
}

export interface SpendingLog {
  id: string;
  user_id: string;
  date: string;
  amount: number;
  category: string;
  mood: number | null;
  impulse: boolean;
  notes: string | null;
  created_at: string;
}

export interface MatchaLog {
  id: string;
  user_id: string;
  date: string;
  cups: number;
  caffeine_level: 'low' | 'medium' | 'high' | null;
  mood_before: number | null;
  mood_after: number | null;
  energy_after: number | null;
  time_of_day: string | null;
  notes: string | null;
  created_at: string;
}

export interface ClothesLog {
  id: string;
  user_id: string;
  date: string;
  outfit_tags: string[];
  weather: string | null;
  temperature: number | null;
  mood: number | null;
  confidence: number | null;
  notes: string | null;
  created_at: string;
}

export interface Insight {
  id: string;
  title: string;
  description: string;
  category: 'habits' | 'spending' | 'matcha' | 'clothes' | 'general';
  icon: string;
  trend?: 'positive' | 'negative' | 'neutral';
  value?: string;
}

export interface DashboardStats {
  habitCompletionRate: number;
  currentStreak: number;
  longestStreak: number;
  totalSpendingThisMonth: number;
  avgSleepOnSuccessfulDays: number;
  bestDayOfWeek: string;
  totalMatchaCups: number;
  avgConfidence: number;
}
