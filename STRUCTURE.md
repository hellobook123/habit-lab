# Habit Lab — Project Structure

```
habit-lab/
├── app/
│   ├── (auth)/
│   │   ├── login/
│   │   │   └── page.tsx
│   │   └── signup/
│   │       └── page.tsx
│   ├── (protected)/
│   │   ├── layout.tsx          ← checks session, renders sidebar
│   │   ├── dashboard/
│   │   │   └── page.tsx
│   │   ├── log/
│   │   │   └── page.tsx
│   │   └── insights/
│   │       └── page.tsx
│   ├── api/
│   │   └── auth/
│   │       └── callback/
│   │           └── route.ts
│   ├── globals.css
│   ├── layout.tsx              ← root layout
│   └── page.tsx                ← redirects to /dashboard or /login
│
├── components/
│   ├── ui/
│   │   ├── Button.tsx
│   │   ├── Card.tsx
│   │   ├── Input.tsx
│   │   ├── Select.tsx
│   │   ├── Tabs.tsx
│   │   ├── FormWrapper.tsx
│   │   └── PageLayout.tsx
│   ├── charts/
│   │   ├── HabitCompletionChart.tsx
│   │   ├── SpendingChart.tsx
│   │   ├── MatchaIntakeChart.tsx
│   │   └── OutfitMoodChart.tsx
│   ├── forms/
│   │   ├── HabitForm.tsx
│   │   ├── SpendingForm.tsx
│   │   ├── MatchaForm.tsx
│   │   └── ClothesForm.tsx
│   ├── dashboard/
│   │   ├── StatCard.tsx
│   │   └── StreakDisplay.tsx
│   ├── insights/
│   │   └── InsightCard.tsx
│   ├── Sidebar.tsx
│   └── LogoutButton.tsx
│
├── lib/
│   ├── supabaseClient.ts       ← browser client
│   ├── supabaseServer.ts       ← server client
│   ├── insights.ts             ← insight computation functions
│   └── utils.ts                ← date helpers, formatters
│
├── types/
│   └── index.ts                ← shared TypeScript types
│
├── middleware.ts                ← protects routes
│
├── supabase/
│   └── schema.sql              ← full SQL schema + RLS
│
├── notebooks/
│   ├── 01_eda.ipynb
│   ├── 02_correlations.ipynb
│   ├── 03_matcha_effects.ipynb
│   ├── 04_spending_patterns.ipynb
│   ├── 05_outfit_mood.ipynb
│   └── 06_habit_prediction.ipynb
│
├── .env.local.example
├── next.config.ts
├── tailwind.config.ts
├── tsconfig.json
└── package.json
```
