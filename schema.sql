-- BlockVoices Live Tracker — Supabase schema
-- Run this once in your Supabase project:  Dashboard → SQL Editor → New query → paste → Run

create table if not exists public.tracker (
  id          text primary key,
  status      text not null default 'todo',
  note        text default '',
  updated_at  timestamptz not null default now()
);

-- Turn on Row Level Security, then allow read + write with the public (anon) key.
-- This is appropriate for an internal/client tracker shared by link.
-- (Anyone who has your site URL can change status. That's the intended behavior here.)
alter table public.tracker enable row level security;

drop policy if exists "tracker read"  on public.tracker;
drop policy if exists "tracker write" on public.tracker;

create policy "tracker read"  on public.tracker for select using (true);
create policy "tracker write" on public.tracker for insert with check (true);
create policy "tracker update" on public.tracker for update using (true) with check (true);

-- Enable realtime so every open page updates instantly.
alter publication supabase_realtime add table public.tracker;
