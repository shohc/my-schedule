create table if not exists public.planner_data (
  user_id uuid primary key references auth.users(id) on delete cascade,
  events jsonb not null default '[]'::jsonb,
  revision text not null,
  updated_at timestamptz not null default now(),
  constraint events_is_array check (jsonb_typeof(events) = 'array')
);
alter table public.planner_data enable row level security;
create policy "read own planner" on public.planner_data for select to authenticated using ((select auth.uid()) = user_id);
create policy "insert own planner" on public.planner_data for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "update own planner" on public.planner_data for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
