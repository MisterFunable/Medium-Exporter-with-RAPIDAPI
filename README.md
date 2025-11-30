# Medium Post Exporter <div align="right">![Medium](https://img.shields.io/badge/Medium-12100E?style=flat&logo=medium&logoColor=white) ![AI Generated](https://img.shields.io/badge/AI-Generated-blueviolet?style=flat)</div>

Export Medium posts to Markdown using the [RapidAPI Medium API](https://rapidapi.com/nishujain199719-vgIfuFHZxVZ/api/medium2). Downloads all articles from a user, with optional image mirroring.

Great for sharing your content on GitHub Pages or Gist without the paywall.

> The `exports/` folder contains sample exports for reference.

## Setup

**Requirements:** Python 3.7+ or Docker, plus a [RapidAPI key](#getting-your-api-key).

```bash
git clone https://github.com/yourusername/medium-exporter.git
cd medium-exporter
```

### With Docker (Recommended)

```bash
RAPIDAPI_KEY=your-key make export-images
```

### With Python

```bash
pip install -r requirements.txt
export RAPIDAPI_KEY=your-key
python fetch_medium_posts.py --download-images --prepend-order
```

## Commands

### Make Commands

| Command | What it does |
|---------|--------------|
| `make export` | Export markdown only |
| `make export-images` | Export with images |
| `make clean` | Remove Docker resources |

Set `USERNAME=someone` to export a different user (default: `mister.funable`).

### Python Options

| Option | Description | Default |
|--------|-------------|---------|
| `--username` | Medium username | `mister.funable` |
| `--download-images` | Download images locally | off |
| `--prepend-order` | Number files chronologically | off |
| `--out-dir` | Output directory | `exports/medium_posts` |
| `--images-dir` | Images directory | `<out-dir>/images` |

**Example:**
```bash
python fetch_medium_posts.py --username your-user --download-images --prepend-order
```

## Output

```
exports/medium_posts/
├── 01 - First Post.md
├── 02 - Second Post.md
└── images/
    ├── 01/
    │   └── img-01.png
    └── 02/
        └── img-01.png
```

Each file includes source URL and publish date as comments.

## Getting Your API Key

1. Sign up at [RapidAPI.com](https://rapidapi.com/)
2. Subscribe to the [Medium API](https://rapidapi.com/nishujain199719-vgIfuFHZxVZ/api/medium2) (free tier: 150 requests/month)
3. Copy your **X-RapidAPI-Key** from the API page
4. Set it:
   ```bash
   export RAPIDAPI_KEY="your-key"
   ```

For persistent setup, add to `~/.zshrc` or `~/.bashrc`.

## Rate Limits

- Free tier: 150 requests/month
- Each article = 1 request
- Image downloads don't count

The script skips already-exported posts automatically.

## Troubleshooting

| Error | Fix |
|-------|-----|
| `RAPIDAPI_KEY not found` | Set the environment variable |
| `medium-api is required` | Run `pip install -r requirements.txt` |
| No articles found | Check the username exists and has posts |

---

**Happy exporting!**
