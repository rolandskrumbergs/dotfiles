---
name: brand-due-diligence
description: Conducts comprehensive brand due diligence research. Use when evaluating a brand name for availability, legal risks, and market viability. Covers domain availability, trademarks, patents, social media, business registrations, cultural/linguistic checks, and competitive landscape analysis. Produces a structured report with findings and sources.
---

# Brand Due Diligence

## Overview

Brand due diligence is the systematic process of evaluating a brand name (or an acquisition target's brand portfolio) for legal availability, market viability, cultural appropriateness, and digital presence. A thorough investigation prevents costly rebrandings, trademark disputes, domain squatting situations, and cultural missteps.

This skill guides you through **every major research dimension**, lists the **authoritative sources** to check, and produces a **structured output report** with all findings.

## When to Use

- Evaluating a new brand name before launch
- Acquiring a company and assessing its brand portfolio
- Expanding a brand into new markets or geographies
- Rebranding an existing product or company
- Validating a brand name a client has proposed
- Checking if a brand name is legally safe before investing in design/marketing

## Research Process

When the user provides a brand name, conduct research across ALL of the following dimensions. For each dimension, note the status as one of: ✅ CLEAR, ⚠️ WARNING, ❌ CONFLICT, or 🔍 NEEDS MANUAL REVIEW.

---

## 1. Domain Name Availability

Check whether the brand's domain is available across all relevant TLDs, and investigate history of any registered domains.

### What to Check

- **Primary TLDs**: `.com`, `.net`, `.org`, `.io`, `.co`, `.ai`, `.app`, `.dev`
- **Country-code TLDs** (based on target markets): `.co.uk`, `.de`, `.fr`, `.eu`, `.ca`, `.com.au`, `.jp`, `.in`, `.se`, `.lv`, `.lt`, `.ee`, `.no`, `.dk`, `.fi`
- **Industry-specific TLDs**: `.tech`, `.store`, `.agency`, `.design`, `.health`, `.finance`, `.legal`, `.studio`, `.shop`
- **Domain variations**: with/without hyphens, common misspellings, plural/singular forms
- **WHOIS information**: current registrant, registration date, expiration date, registrar
- **Domain history**: past ownership, historical content (for reputation risks)
- **Domain parking/squatting**: is the domain parked, for sale, or being squatted?
- **Domain pricing**: if for sale, what is the asking price?
- **DNS records**: any active MX, A, CNAME records indicating live use

### Sources to Check

| Source | URL | What It Provides |
|--------|-----|-----------------|
| **ICANN WHOIS** | https://lookup.icann.org | Official WHOIS lookup |
| **Namecheap** | https://www.namecheap.com/domains/registration/results/?domain={brand} | Domain availability + pricing |
| **GoDaddy** | https://www.godaddy.com/domainsearch/find?domainToCheck={brand} | Domain availability + pricing |
| **Google Domains** | https://domains.google.com | Domain search |
| **Domainr** | https://domainr.com | Quick multi-TLD availability |
| **Wayback Machine** | https://web.archive.org/web/*/{brand}.com | Historical domain content |
| **WHOIS History** | https://whois-history.whoisxmlapi.com | Historical WHOIS records |
| **SecurityTrails** | https://securitytrails.com | DNS history and records |
| **Expired Domains** | https://www.expireddomains.net | Check if domain recently expired |
| **Afternic / Sedo** | https://www.afternic.com / https://sedo.com | Domain aftermarket / for-sale pricing |
| **Dan.com** | https://dan.com | Domain marketplace |
| **Porkbun** | https://porkbun.com | Budget domain availability |

### Output Fields

```
Domain: {brand}.com
  Status: Available / Registered / For Sale
  WHOIS Registrant: [name/org if registered]
  Registration Date: [date]
  Expiration Date: [date]
  Historical Use: [clean / previously used for X]
  Asking Price: [if for sale]
  Risk Level: ✅ / ⚠️ / ❌
  Notes: [any relevant observations]
```

---

## 2. Trademark Research

This is the MOST CRITICAL section. Trademark conflicts can result in lawsuits, forced rebrandings, and significant financial loss.

### What to Check

- **Exact match**: identical name in same or related classes
- **Phonetic similarity**: names that sound alike (e.g., "Coke" vs "Koke")
- **Visual similarity**: names that look alike in writing
- **Conceptual similarity**: names with similar meaning (e.g., "Swift" vs "Rapid")
- **Trademark classes**: all relevant Nice Classification classes for the brand's industry
- **Pending applications**: marks currently under examination
- **Dead/abandoned marks**: previously registered marks that could be revived
- **Common law rights**: unregistered marks that may have established rights through use
- **Opposition proceedings**: any ongoing disputes
- **Geographic scope**: marks registered in target markets

### Nice Classification — Key Classes to Check

| Class | Category | Examples |
|-------|----------|---------|
| 9 | Software, electronics | Apps, SaaS, hardware |
| 16 | Paper goods, printed matter | Books, magazines, stationery |
| 25 | Clothing | Apparel, footwear, headgear |
| 35 | Advertising, business management | Marketing, retail services |
| 36 | Financial services | Insurance, banking, investment |
| 38 | Telecommunications | Broadcasting, internet services |
| 41 | Education, entertainment | Training, publishing, sports |
| 42 | Scientific/tech services | Software development, IT consulting, SaaS |
| 43 | Food/drink services | Restaurants, catering, hospitality |
| 44 | Medical services | Healthcare, pharmacy, beauty |
| 45 | Legal and security services | Legal, security, personal services |

### Sources to Check

| Source | URL | Jurisdiction | What It Provides |
|--------|-----|-------------|-----------------|
| **USPTO TESS** | https://tmsearch.uspto.gov | 🇺🇸 United States | US trademark database (free) |
| **USPTO TSDR** | https://tsdr.uspto.gov | 🇺🇸 United States | Trademark status and document retrieval |
| **EUIPO eSearch** | https://euipo.europa.eu/eSearch/ | 🇪🇺 European Union | EU trademark search |
| **TMView** | https://www.tmdn.org/tmview/ | 🌍 Global (70+ offices) | Multi-jurisdiction trademark search |
| **WIPO Global Brand Database** | https://branddb.wipo.int | 🌍 Global | International trademark search (Madrid System) |
| **UK IPO** | https://www.gov.uk/search-for-trademark | 🇬🇧 United Kingdom | UK trademarks |
| **CIPO (Canada)** | https://ised-isde.canada.ca/cipo/trademark-search | 🇨🇦 Canada | Canadian trademarks |
| **IP Australia** | https://search.ipaustralia.gov.au/trademarks/search | 🇦🇺 Australia | Australian trademarks |
| **DPMA (Germany)** | https://register.dpma.de/DPMAregister/marke/einsteiger | 🇩🇪 Germany | German trademarks |
| **INPI (France)** | https://data.inpi.fr | 🇫🇷 France | French trademarks |
| **JPO (Japan)** | https://www.j-platpat.inpit.go.jp | 🇯🇵 Japan | Japanese trademarks |
| **CNIPA (China)** | https://english.cnipa.gov.cn | 🇨🇳 China | Chinese trademarks |
| **Indian TMR** | https://ipindiaonline.gov.in/tmrpublicsearch | 🇮🇳 India | Indian trademarks |
| **Trademarkia** | https://www.trademarkia.com | 🌍 Aggregator | Multi-country trademark search |
| **TrademarkNow / Corsearch** | https://www.corsearch.com | 🌍 Aggregator | Professional trademark clearance |
| **Justia Trademarks** | https://trademarks.justia.com | 🇺🇸 United States | Free US trademark search |
| **PRV (Sweden)** | https://was.prv.se/spd/search | 🇸🇪 Sweden | Swedish trademarks |
| **Latvian Patent Office** | https://databases.lrpv.gov.lv | 🇱🇻 Latvia | Latvian trademarks |

### Output Fields

```
Trademark Search: "{brand}"
  Jurisdiction: [country/region]
  Exact Matches: [count] — [list with class, status, owner]
  Similar Marks: [count] — [list with similarity type]
  Pending Applications: [count]
  Dead/Abandoned: [count]
  Risk Level: ✅ / ⚠️ / ❌
  Recommended Action: [proceed / legal review needed / avoid]
```

---

## 3. Patent Research

Check for patents that reference the brand name or that may be associated with the brand's core technology.

### What to Check

- **Utility patents**: inventions and processes using or referencing the brand
- **Design patents**: ornamental designs associated with the brand
- **Patent applications**: pending patents that may reference the brand
- **Patent holder**: who owns patents associated with or similar to the brand
- **Patent families**: related international patents
- **Patent status**: active, expired, abandoned, or pending
- **Freedom to operate**: ensure the brand's products don't infringe existing patents

### Sources to Check

| Source | URL | Jurisdiction | What It Provides |
|--------|-----|-------------|-----------------|
| **USPTO Patent Full-Text** | https://patft.uspto.gov | 🇺🇸 US | US granted patents |
| **USPTO Patent Application** | https://appft.uspto.gov | 🇺🇸 US | US patent applications |
| **Google Patents** | https://patents.google.com | 🌍 Global | Worldwide patent search (free, excellent) |
| **Espacenet** | https://worldwide.espacenet.com | 🌍 Global (EPO) | 140M+ patent documents worldwide |
| **WIPO PATENTSCOPE** | https://patentscope.wipo.int | 🌍 Global (PCT) | International PCT applications |
| **Lens.org** | https://www.lens.org | 🌍 Global | Open patent and scholarly search |
| **DPMA (Germany)** | https://register.dpma.de | 🇩🇪 Germany | German patents |
| **J-PlatPat (Japan)** | https://www.j-platpat.inpit.go.jp | 🇯🇵 Japan | Japanese patents |
| **CNIPA (China)** | https://english.cnipa.gov.cn | 🇨🇳 China | Chinese patents |
| **Patent Inspiration** | https://app.patentinspiration.com | 🌍 Global | Patent analytics and visualization |
| **FPO (Free Patents Online)** | https://www.freepatentsonline.com | 🌍 Global | Patent search and PDF download |

### Output Fields

```
Patent Search: "{brand}"
  Related Patents Found: [count]
  Active Patents: [list with patent number, title, holder, jurisdiction]
  Pending Applications: [list]
  Design Patents: [list]
  Freedom-to-Operate Risk: ✅ / ⚠️ / ❌
  Notes: [relevant observations]
```

---

## 4. Social Media & Username Availability

### What to Check

- **Handle/username availability** on all major platforms
- **Variations**: exact match, with underscores, with "official" suffix, abbreviated
- **Existing accounts**: are they active? Inactive (potential claim)? Impersonation risk?
- **Account squatting**: is someone sitting on the handle without active use?
- **Verified accounts**: does someone already have a verified brand account?

### Platforms to Check

| Platform | Check URL Pattern | Notes |
|----------|------------------|-------|
| **X (Twitter)** | https://x.com/{brand} | Check if handle exists |
| **Instagram** | https://instagram.com/{brand} | Check if handle exists |
| **Facebook Page** | https://facebook.com/{brand} | Check page and username |
| **LinkedIn Company** | https://linkedin.com/company/{brand} | Company page availability |
| **TikTok** | https://tiktok.com/@{brand} | Check handle |
| **YouTube** | https://youtube.com/@{brand} | Channel handle |
| **Pinterest** | https://pinterest.com/{brand} | Check profile |
| **Reddit** | https://reddit.com/r/{brand} and /u/{brand} | Subreddit and user |
| **GitHub** | https://github.com/{brand} | Organization/user handle |
| **Threads** | https://threads.net/@{brand} | Meta's Threads platform |
| **Bluesky** | https://bsky.app/profile/{brand}.bsky.social | Bluesky handle |
| **Mastodon** | Search across instances | Federated, check major instances |
| **Snapchat** | https://snapchat.com/add/{brand} | Username check |
| **Discord** | Server name search | Server name availability |
| **Twitch** | https://twitch.tv/{brand} | Channel name |
| **Medium** | https://medium.com/@{brand} | Publication/profile |
| **Substack** | https://{brand}.substack.com | Publication name |
| **Telegram** | https://t.me/{brand} | Channel/group name |
| **WhatsApp Business** | N/A | Business account naming |

### Aggregator Tools

| Tool | URL | What It Does |
|------|-----|-------------|
| **Namechk** | https://namechk.com | Check username across 100+ platforms |
| **KnowEm** | https://knowem.com | Username search across 500+ sites |
| **Namecheckr** | https://www.namecheckr.com | Social media + domain availability |
| **InstantUsername** | https://instantusername.com | Real-time username availability |
| **CheckUserNames** | https://checkusernames.com | Multi-platform username check |

### Output Fields

```
Social Media: "{brand}"
  Platform: [name]
    Handle Checked: @{brand}
    Status: Available / Taken (Active) / Taken (Inactive) / Squatted
    Current Owner: [if taken]
    Followers: [if taken and public]
    Last Activity: [date if visible]
  Overall Social Availability: [X of Y platforms available]
  Risk Level: ✅ / ⚠️ / ❌
```

---

## 5. Business Name & Entity Registration

### What to Check

- **Business name registration** in target jurisdictions
- **Company/corporation name** in state/country registries
- **DBA (Doing Business As)** / trade name filings
- **LLC / Corporation** name conflicts
- **Non-profit organization** name conflicts

### Sources to Check

| Source | URL | Jurisdiction |
|--------|-----|-------------|
| **SEC EDGAR** | https://www.sec.gov/cgi-bin/browse-edgar?company={brand}&CIK=&type=&dateb=&owner=include&count=40&search_text=&action=getcompany | 🇺🇸 US (public companies) |
| **OpenCorporates** | https://opencorporates.com | 🌍 Global (200M+ companies) |
| **US State SOS databases** | Varies by state (e.g., https://businesssearch.sos.ca.gov for CA) | 🇺🇸 US (state level) |
| **Companies House** | https://find-and-update.company-information.service.gov.uk | 🇬🇧 UK |
| **Canadian Business Registry** | https://www.ic.gc.ca/app/scr/cc/CorporationsCanada/fdrlCrpSrch.html | 🇨🇦 Canada |
| **ABN Lookup (Australia)** | https://abr.business.gov.au | 🇦🇺 Australia |
| **EU Business Register** | https://e-justice.europa.eu/content_find_a_company-489-en.do | 🇪🇺 European Union |
| **Handelsregister (Germany)** | https://www.handelsregister.de | 🇩🇪 Germany |
| **Bolagsverket (Sweden)** | https://www.bolagsverket.se | 🇸🇪 Sweden |
| **Lursoft (Latvia)** | https://www.lursoft.lv | 🇱🇻 Latvia |
| **Creditsafe** | https://www.creditsafe.com | 🌍 Global |
| **Dun & Bradstreet** | https://www.dnb.com | 🌍 Global |
| **Crunchbase** | https://www.crunchbase.com | 🌍 Global (startups/tech) |

### Output Fields

```
Business Registry: "{brand}"
  Jurisdiction: [state/country]
  Exact Matches: [count with entity type, status]
  Similar Names: [count]
  Active Entities: [list with name, type, jurisdiction, registration date]
  Risk Level: ✅ / ⚠️ / ❌
```

---

## 6. App Store & Marketplace Presence

### What to Check

- **App name conflicts** in major app stores
- **Published apps** using the brand name
- **Developer accounts** using the brand name
- **Marketplace listings** (e.g., Shopify apps, WordPress plugins)

### Sources to Check

| Source | URL | What It Covers |
|--------|-----|---------------|
| **Apple App Store** | https://apps.apple.com/search?term={brand} | iOS/macOS apps |
| **Google Play Store** | https://play.google.com/store/search?q={brand} | Android apps |
| **Microsoft Store** | https://apps.microsoft.com/search?query={brand} | Windows apps |
| **Chrome Web Store** | https://chromewebstore.google.com/search/{brand} | Browser extensions |
| **Firefox Add-ons** | https://addons.mozilla.org/search/?q={brand} | Browser extensions |
| **npm** | https://www.npmjs.com/search?q={brand} | Node.js packages |
| **PyPI** | https://pypi.org/search/?q={brand} | Python packages |
| **NuGet** | https://www.nuget.org/packages?q={brand} | .NET packages |
| **RubyGems** | https://rubygems.org/search?query={brand} | Ruby packages |
| **Docker Hub** | https://hub.docker.com/search?q={brand} | Container images |
| **Shopify App Store** | https://apps.shopify.com/search?q={brand} | Shopify apps |
| **WordPress Plugins** | https://wordpress.org/plugins/search/{brand}/ | WordPress plugins |
| **Product Hunt** | https://www.producthunt.com/search?q={brand} | Product launches |
| **AWS Marketplace** | https://aws.amazon.com/marketplace/search/results?searchTerms={brand} | Cloud services |
| **Azure Marketplace** | https://azuremarketplace.microsoft.com/en-us/marketplace/apps?search={brand} | Cloud services |

### Output Fields

```
App/Marketplace: "{brand}"
  Store: [name]
  Matches Found: [count]
  Notable Conflicts: [app name, developer, category, downloads]
  Risk Level: ✅ / ⚠️ / ❌
```

---

## 7. Copyright Research

### What to Check

- **Registered copyrights** using the brand name
- **Published works** (books, music, films) with the same name
- **Creative works** that could cause brand confusion

### Sources to Check

| Source | URL | What It Covers |
|--------|-----|---------------|
| **US Copyright Office** | https://www.copyright.gov/search | US registered copyrights |
| **Google Books** | https://books.google.com/books?q={brand} | Published books |
| **Amazon** | https://www.amazon.com/s?k={brand} | Books, products, brands |
| **IMDb** | https://www.imdb.com/find/?q={brand} | Movies, TV shows |
| **Spotify** | Search within app | Music artists, albums, podcasts |
| **Apple Music** | Search within app | Music artists, albums |
| **ASCAP/BMI/SESAC** | https://www.ascap.com / https://www.bmi.com | Music rights organizations |
| **ISBN Search** | https://isbnsearch.org | Books by title |
| **WorldCat** | https://search.worldcat.org | Global library catalog |

### Output Fields

```
Copyright: "{brand}"
  Registered Copyrights: [count with title, type, owner]
  Books/Publications: [count]
  Media (Film/TV/Music): [count]
  Risk Level: ✅ / ⚠️ / ❌
```

---

## 8. Online Presence & Reputation

### What to Check

- **Search engine results**: what currently appears when you Google the name?
- **Search volume**: is the term already associated with something?
- **Negative associations**: news, controversies, scandals
- **Competitor analysis**: is a competitor using a similar name?
- **Review sites**: any existing business reviews under this name?

### Sources to Check

| Source | URL | What It Provides |
|--------|-----|-----------------|
| **Google Search** | https://www.google.com/search?q={brand} | General web presence |
| **Google Trends** | https://trends.google.com/trends/explore?q={brand} | Search interest over time |
| **Google News** | https://news.google.com/search?q={brand} | News coverage |
| **Bing Search** | https://www.bing.com/search?q={brand} | Alternative search results |
| **Trustpilot** | https://www.trustpilot.com/search?query={brand} | Business reviews |
| **BBB** | https://www.bbb.org/search?find_text={brand} | Better Business Bureau |
| **Glassdoor** | https://www.glassdoor.com/Search/results.htm?keyword={brand} | Employer reviews |
| **Yelp** | https://www.yelp.com/search?find_desc={brand} | Business reviews |
| **G2** | https://www.g2.com/search?query={brand} | Software reviews |
| **Capterra** | https://www.capterra.com/search/?query={brand} | Software reviews |
| **SimilarWeb** | https://www.similarweb.com/website/{brand}.com | Website traffic analysis |
| **BuiltWith** | https://builtwith.com/{brand}.com | Technology stack |
| **Archive.org** | https://web.archive.org/web/*/{brand}.com | Historical web content |

### Output Fields

```
Online Presence: "{brand}"
  Google Results (page 1): [summary of top results]
  Google Trends: [trending / stable / declining / no data]
  News Sentiment: [positive / neutral / negative / none]
  Existing Businesses Using Name: [count]
  Review Site Presence: [any existing listings?]
  Risk Level: ✅ / ⚠️ / ❌
```

---

## 9. Linguistic & Cultural Analysis

### What to Check

- **Meaning in other languages**: does the brand accidentally mean something offensive, inappropriate, or undesirable?
- **Pronunciation**: can it be easily pronounced in target markets?
- **Spelling**: is it easy to spell? Will people misspell it?
- **Cultural sensitivity**: does it conflict with cultural norms, religious terms, or protected cultural expressions?
- **Slang and colloquialisms**: does it have unintended slang meanings?
- **Acronym conflicts**: does the abbreviation spell something problematic?
- **Emotional connotation**: what feeling does the name evoke?

### Languages to Check (minimum)

English, Spanish, French, German, Italian, Portuguese, Chinese (Mandarin), Japanese, Korean, Arabic, Hindi, Russian, Swedish, Dutch, Polish, Turkish

### Sources to Check

| Source | URL | What It Provides |
|--------|-----|-----------------|
| **Google Translate** | https://translate.google.com | Quick multi-language translation |
| **DeepL** | https://www.deepl.com/translator | High-quality translation |
| **Wiktionary** | https://en.wiktionary.org/wiki/{brand} | Word meanings in many languages |
| **Urban Dictionary** | https://www.urbandictionary.com/define.php?term={brand} | Slang meanings |
| **WordReference** | https://www.wordreference.com | Dictionary and forums |
| **Ethnologue** | https://www.ethnologue.com | Language data |
| **Native speaker review** | Manual | Essential for final validation |

### Output Fields

```
Linguistic Analysis: "{brand}"
  Language: [language]
    Meaning: [translation/meaning if any]
    Connotation: [positive / neutral / negative / none]
    Pronunciation Issue: [yes/no — describe]
  Slang/Informal Meanings: [list any found]
  Cultural Sensitivities: [list any found]
  Overall Linguistic Risk: ✅ / ⚠️ / ❌
```

---

## 10. Visual Identity & Design Conflicts

### What to Check

- **Existing logos** similar to proposed brand visual identity
- **Design trademark conflicts**: registered logos and visual marks
- **Color scheme conflicts** with established brands in same industry

### Sources to Check

| Source | URL | What It Provides |
|--------|-----|-----------------|
| **Google Images** | https://images.google.com/search?q={brand}+logo | Existing logos |
| **USPTO Design Search** | https://tmsearch.uspto.gov (design search codes) | Registered design marks |
| **Brandmark** | https://brandmark.io | AI logo generation (to check similarity) |
| **Logo.com** | https://logo.com | Logo search |
| **Dribbble** | https://dribbble.com/search/{brand} | Design community |
| **Behance** | https://www.behance.net/search/projects?search={brand} | Design portfolios |

---

## 11. Legal & Litigation History

### What to Check

- **Existing lawsuits** involving the brand name
- **UDRP (domain disputes)**: past domain name dispute decisions
- **TTAB proceedings**: Trademark Trial and Appeal Board cases
- **Court records**: any litigation involving the brand

### Sources to Check

| Source | URL | What It Provides |
|--------|-----|-----------------|
| **PACER** | https://pacer.uscourts.gov | US federal court records |
| **Google Scholar (Case Law)** | https://scholar.google.com (select "Case law") | Court decisions |
| **WIPO UDRP Decisions** | https://www.wipo.int/amc/en/domains/search/ | Domain dispute decisions |
| **USPTO TTAB** | https://ttabvue.uspto.gov/ttabvue/ | Trademark opposition/cancellation proceedings |
| **CourtListener** | https://www.courtlistener.com | Free US court records |
| **Justia Dockets** | https://dockets.justia.com | US court dockets |
| **BAILII** | https://www.bailii.org | UK & Ireland case law |
| **EUR-Lex** | https://eur-lex.europa.eu | EU law and case law |
| **Casetext** | https://casetext.com | Legal research |

### Output Fields

```
Legal History: "{brand}"
  Active Lawsuits: [count with summary]
  Domain Disputes (UDRP): [count with outcomes]
  Trademark Proceedings (TTAB): [count with status]
  Historical Litigation: [count with summary]
  Risk Level: ✅ / ⚠️ / ❌
```

---

## 12. Industry-Specific Registrations

### What to Check (varies by industry)

- **FDA product names** (food, drugs, medical devices): https://www.fda.gov
- **SEC registered entities** (financial): https://www.sec.gov/cgi-bin/browse-edgar
- **FCC callsigns** (broadcasting): https://www.fcc.gov/media/radio/callsign-search
- **FAA registrations** (aviation): https://registry.faa.gov
- **Pharmaceutical drug names**: https://www.drugs.com and WHO INN database
- **Wine/spirits brands**: TTB COLA database (https://www.ttb.gov)
- **Crypto/blockchain**: CoinMarketCap, CoinGecko for token names
- **Gaming**: Steam, Epic Games Store, major publishers

---

## 13. Email & Communication Platform Availability

### What to Check

- **Email provider availability**: can you get `brand@gmail.com`, `brand@outlook.com`?
- **Google Workspace**: is `brand.com` available for Workspace setup?
- **Slack workspace**: is `brand.slack.com` available?
- **Microsoft Teams**: organization name availability

### Sources

| Source | URL |
|--------|-----|
| **Gmail** | Try creating at https://accounts.google.com |
| **Google Workspace** | https://workspace.google.com |
| **Slack** | https://{brand}.slack.com |
| **Zoom** | https://{brand}.zoom.us |

---

## Structured Output Report Template

When presenting findings, use this comprehensive structure:

```markdown
# Brand Due Diligence Report: "{BRAND NAME}"

**Date:** {date}
**Analyst:** Copilot AI
**Scope:** [markets/jurisdictions covered]

---

## Executive Summary

| Dimension | Status | Risk Level | Action Required |
|-----------|--------|-----------|-----------------|
| Domain Availability | [summary] | ✅⚠️❌ | [action] |
| Trademarks | [summary] | ✅⚠️❌ | [action] |
| Patents | [summary] | ✅⚠️❌ | [action] |
| Social Media | [summary] | ✅⚠️❌ | [action] |
| Business Registration | [summary] | ✅⚠️❌ | [action] |
| App Stores | [summary] | ✅⚠️❌ | [action] |
| Copyright | [summary] | ✅⚠️❌ | [action] |
| Online Presence | [summary] | ✅⚠️❌ | [action] |
| Linguistic/Cultural | [summary] | ✅⚠️❌ | [action] |
| Visual Identity | [summary] | ✅⚠️❌ | [action] |
| Legal History | [summary] | ✅⚠️❌ | [action] |
| Industry-Specific | [summary] | ✅⚠️❌ | [action] |

**Overall Assessment:** [PROCEED / PROCEED WITH CAUTION / DO NOT PROCEED]
**Overall Risk Score:** [1-10, where 1 = very low risk, 10 = very high risk]

---

## Detailed Findings

### 1. Domain Availability
[Detailed findings per TLD...]

### 2. Trademark Search
[Detailed findings per jurisdiction...]

### 3. Patent Search
[Detailed findings...]

### 4. Social Media Availability
[Detailed findings per platform...]

### 5. Business Registration
[Detailed findings per jurisdiction...]

### 6. App Store & Marketplace
[Detailed findings per store...]

### 7. Copyright
[Detailed findings...]

### 8. Online Presence & Reputation
[Detailed findings...]

### 9. Linguistic & Cultural Analysis
[Detailed findings per language...]

### 10. Visual Identity
[Detailed findings...]

### 11. Legal & Litigation History
[Detailed findings...]

### 12. Industry-Specific
[Detailed findings if applicable...]

---

## Recommendations

1. **Immediate Actions:** [what to do now]
2. **Legal Counsel:** [when to engage an IP attorney]
3. **Domain Strategy:** [which domains to acquire]
4. **Social Media Strategy:** [which handles to secure]
5. **Monitoring:** [ongoing brand monitoring recommendations]

---

## Sources Checked

[Full list of sources consulted with URLs and dates checked]

---

## Disclaimers

- This report is for informational purposes only and does not constitute legal advice.
- Trademark and patent searches should be validated by a qualified intellectual property attorney.
- Online availability can change rapidly; results are accurate as of the report date.
- Common law trademark rights (unregistered) are difficult to discover through database searches alone.
- This report covers publicly available information only.
```

---

## Automated Research Approach

When performing this due diligence, follow this workflow:

1. **Gather Input**: Ask for the brand name, target industry/Nice classes, target markets/geographies, and any known brand variations.
2. **Web Research**: Use the `web_search` and `web_fetch` tools to check as many of the listed sources as possible.
3. **Structured Documentation**: Fill in the report template section by section.
4. **Risk Assessment**: Assign risk levels based on findings.
5. **Recommendations**: Provide actionable next steps.

### Priority Order (if time-constrained)

1. 🔴 **Trademarks** — highest legal risk
2. 🔴 **Domain .com** — most critical digital asset
3. 🟠 **Business registrations** — entity name conflicts
4. 🟠 **Social media handles** — brand consistency
5. 🟡 **Patents** — technology-related brands
6. 🟡 **Linguistic/cultural** — international brands
7. 🟢 **App stores** — tech/software brands
8. 🟢 **Copyright** — creative/media brands
9. 🟢 **Legal history** — deeper due diligence
10. 🟢 **Visual identity** — when logo exists

## Red Flags — Stop and Warn Immediately

- ❌ Active registered trademark in same class and jurisdiction
- ❌ Domain owned by a large, litigious company
- ❌ Ongoing trademark opposition or litigation
- ❌ Brand name means something offensive in a major target market language
- ❌ Identical business name registered in same industry and jurisdiction
- ❌ UDRP decisions against previous users of this brand name
- ❌ Well-known brand with similar name (even in different class — dilution risk)

## Verification Checklist

After completing the report:

- [ ] All 12 research dimensions have been addressed
- [ ] Each dimension has a clear risk rating
- [ ] Sources are documented with URLs
- [ ] Executive summary accurately reflects detailed findings
- [ ] Recommendations are actionable and prioritized
- [ ] Disclaimers are included
- [ ] Report date is noted (availability changes rapidly)
