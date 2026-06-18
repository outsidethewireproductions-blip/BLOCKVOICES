-- BlockVoices Live Tracker — Supabase schema
-- Run this once in your Supabase dashboard: SQL Editor → New query → paste → Run

create table if not exists public.tracker (
  id          text primary key,
  status      text not null default 'todo',
  comments    text default '[]',
  updated_at  timestamptz not null default now()
);

alter table public.tracker enable row level security;

drop policy if exists "read all" on public.tracker;
drop policy if exists "write all" on public.tracker;

create policy "read all" on public.tracker for select using (true);
create policy "write all" on public.tracker for insert with check (true);
create policy "update all" on public.tracker for update using (true) with check (true);

alter publication supabase_realtime add table public.tracker;
