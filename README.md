# BlockVoices — Live Project Tracker

A branded, real-time project tracker. The whole team and the client open **one URL**; anyone sets a phase to To Do / In Progress / Done / Blocked, and **everyone's screen updates instantly**. No downloads.

How it works: a static page (`index.html`) hosted on **Vercel**, with shared state in a free **Supabase** database. Realtime is what makes everyone see the same status live.

---

## What you'll need (all free)
- A **GitHub** account — github.com
- A **Vercel** account — vercel.com (sign in with GitHub)
- A **Supabase** account — supabase.com

> I can't create accounts or sign in for you, but every step below is just clicking through. ~20 minutes.

---

## Step 1 — Create the database (Supabase)
1. Go to supabase.com → **New project**. Pick any name, set a database password, choose a region, create it (takes ~1 min to spin up).
2. Left sidebar → **SQL Editor** → **New query**. Open `schema.sql` from this repo, copy everything, paste it in, click **Run**. You should see "Success."
3. Left sidebar → **Project Settings** (gear) → **API**. Copy two values:
   - **Project URL** (looks like `https://abcd1234.supabase.co`)
   - **anon public** key (a long string under "Project API keys")

## Step 2 — Paste your keys into the page
1. Open `index.html`. Near the top of the `<script>` block find:
   ```js
   var SUPABASE_URL = "YOUR_SUPABASE_URL";
   var SUPABASE_ANON_KEY = "YOUR_SUPABASE_ANON_KEY";
   ```
2. Replace the two placeholder strings with the Project URL and anon key from Step 1. Save.
   - Until you do this, the page runs in **local mode** (works, but not shared) and shows a notice. Once keys are in, the dot turns teal: **"Live — synced across everyone."**

## Step 3 — Put it on GitHub
1. On github.com → **New repository** → name it e.g. `blockvoices-tracker` → **Create**.
2. Easiest upload: on the new repo page click **uploading an existing file**, then drag in `index.html`, `schema.sql`, and `README.md`. Commit.
   - (Or with git installed: `git init && git add . && git commit -m "tracker" && git branch -M main && git remote add origin <your-repo-url> && git push -u origin main`)

## Step 4 — Deploy on Vercel
1. vercel.com → **Add New… → Project** → **Import** your `blockvoices-tracker` repo.
2. No build settings to change (it's a plain static site). Click **Deploy**.
3. After ~30 seconds you get a public URL like `https://blockvoices-tracker.vercel.app`. **That's the link you share with the team and client.**

## Step 5 — Share
- Send the Vercel URL to the team and the client. Everyone bookmarks it.
- Anyone changes a status → it saves to Supabase → every open page updates within a second.

---

## Notes
- **Who can edit:** anyone with the URL can change status (that's the point of a shared tracker). If you later want view-only for the client, tell me and I'll add a simple editor passcode.
- **Updating the design or phases:** edit `index.html`, push to GitHub — Vercel redeploys automatically.
- **Cost:** Supabase free tier and Vercel hobby tier are free and far exceed what this needs.
- **The logo** is embedded in `index.html`, so the repo is fully self-contained — nothing else to host.
