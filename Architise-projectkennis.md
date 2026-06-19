# Architise — projectkennis

> Plak deze tekst in de projectkennis van het Architise-project (of upload dit bestand daar).

## Wat is Architise?
Architise is een browser-based modelleertool gebouwd op de ArchiMate 3-standaard, ontwikkeld
door Arnold Ruijter IT. Je modelleert er enterprise-architectuur mee over de Business-,
Application- en Technology-laag, visualiseert processtromen met een Swimlane-modus, en
exporteert naar Archi en draw.io. De tool draait volledig in de browser, zonder installatie.

Live: https://architise.arnoldruijterit.nl — gelinkt vanaf https://arnoldruijterit.nl/architise.html

**Oorspronkelijk doel:** ArchiMate eenvoudig en begrijpelijk maken, ook voor mensen die de
standaard normaal niet doorgronden (zelfs na training). Dit doel is volgens Arnold nog niet
bereikt — toegankelijkheid en UX zijn het belangrijkste openstaande vraagstuk, niet de
technische functionaliteit.

## Functionaliteit (van de live pagina)
- **Volledige ArchiMate 3-dekking**: Business-, Application- en Technology-laag, met Active
  Structure-, Behaviour- en Passive Structure-elementtypes en alle ArchiMate-relatietypes.
- **Swimlane-modus**: aparte editor voor procesdiagrammen, los van de ArchiMate-workspace,
  met een brug vanuit Business-laag-actoren naar swimlane-lanes in één klik.
- **Archi 5.x-export**: model als native `.archimate`-bestand (AMEFF-compatibel).
- **draw.io-export**: diagrammen naar draw.io XML.
- **Tweetalig**: EN/NL, inclusief tooltips, onboarding en handleiding.
- **Opslaan & laden**: model als JSON; Save As met de native bestandskiezer van de browser.
- **Begeleide start**: onboarding-wizard en kant-en-klare templates.

## Techniek & hosting (publiek bevestigd)
- Browser-app, gehost via **GitHub Pages**. Eigen subdomein architise.arnoldruijterit.nl (CNAME).
- Repo: **aruijter72/Architise** (publiek), GitHub Pages ingeschakeld. Laatste push: 2026-05-25.
- Deploy is daarmee push-to-deploy: een `git push` naar GitHub publiceert via Pages — dus
  locatie-onafhankelijk te deployen (anders dan Vinage's Mac-only deploy.sh).

## Nog te bevestigen (via Claude Code op ~/projects/architise)
- [ ] Exacte tech stack (vermoedelijk HTML/CSS/JS — bevestigen) en of er een build-step is.
- [ ] Deploy-mechaniek: Pages via een GitHub Actions-workflow of via een branch?
- [ ] Mappenstructuur en de belangrijkste bestanden.
- [ ] Of er nog een aparte `CLAUDE.md` in de repo staat (zo niet, kunnen we die maken).

## Productrichting (open vraagstuk)
De kernspanning: "volledige ArchiMate 3-dekking" versus "begrijpelijk zonder voorkennis".
Volledige trouw aan de standaard werkt complexiteit in de hand; begrijpelijkheid vraagt om
weglaten, begeleiding en vertaling. Mogelijke richtingen om te verkennen in dit project:
een vereenvoudigde/begeleide modus, betere defaults en templates, of een laag die
ArchiMate-concepten in gewone taal uitlegt tijdens het modelleren.
