# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a Jekyll-based blog hosted on GitHub Pages, focused on space industry and software engineering topics. The blog uses the `jekyll-theme-hacker` theme and includes automated comment functionality via utterances.

## Development Commands

### Local Development
```bash
# Install dependencies
bundle install

# Run local development server
bundle exec jekyll serve --baseurl="" --future

# Or use the convenience script
./scripts/run_local.sh
```

### Content Management
```bash
# Quick commit and publish workflow
./scripts/submit_post.sh
```

## Architecture

### Jekyll Structure
- `_config.yml`: Main Jekyll configuration with site metadata, theme settings, and build configuration
- `_layouts/post.html`: Template for individual blog posts with utterances comments integration
- `_posts/`: Markdown files for blog posts following Jekyll naming convention (YYYY-MM-DD-title.markdown)
- `blog.html`: Main blog listing page that displays all posts
- `index.html`: Redirects to blog.html

### Content Organization
- Blog posts are written in Markdown with Jekyll front matter
- Images stored in `/images/` directory
- Data files (PDFs, audio, JSON) in `/data/` directory
- Videos in `/videos/` directory

### GitHub Pages Integration
- Uses `github-pages` gem for compatibility
- Automatic deployment on push to master branch
- Custom domain configured via CNAME file

### Key Features
- Comments system via utterances (GitHub Issues integration)
- Future post preview with `--future` flag
- Jekyll feed plugin for RSS
- Custom 404 page

## Development Notes

- The repository uses thread_safe gem version 0.2.0 due to compatibility requirements
- No additional linting or testing frameworks configured
- Posts can include future dates and will be visible in local development with `--future` flag
- The site redirects root URL to `/blog.html` for better organization