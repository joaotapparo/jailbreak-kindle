# jailbreak-kindle

Anotações do jailbreak do meu Kindle e da configuração para usar o
**KOReader** no lugar da interface da Amazon.

## Aparelho

| | |
|---|---|
| Modelo | Kindle básico 10ª geração (KOReader: `KindleBasic3`) |
| Tela | 600×800 |
| Firmware | 5.18.1 |
| Jailbreak | [SpiderCat](https://kindlemodding.org/jailbreaking/SpiderCat/) (jb.sh v2.5.0) |

## O que foi feito

1. **Jailbreak com SpiderCat** — jailbreak "moderno" (stack hdnext). Ele já
   bloqueia as atualizações OTA e instala o gerenciador de pacotes **KPM**.
   > O Hotfix e o KUAL/MRPI são do fluxo *legacy* e **não** são usados aqui.
2. **Jobman** (`;kpm install jobman`) — gerenciador do jailbreak.
   Confirma: *"OTA updates are currently disabled"*.
3. **KOReader** (`;kpm install koreader`) — leitor open source que substitui o
   da Amazon (lê EPUB, PDF, CBZ, DjVu…).
4. **[SimpleUI](https://github.com/doctorhetfield-cmd/simpleui.koplugin)** —
   plugin do KOReader com tela inicial customizável. Instalação: copiar
   `simpleui.koplugin/` (do release) para `koreader/plugins/` no Kindle.
5. **Screensavers personalizados** — imagens em `/screensavers` no Kindle,
   geradas com [`scripts/prepare-screensavers.sh`](scripts/prepare-screensavers.sh).
   No KOReader: ⚙️ → Tela → Sleep screen → Wallpaper → *Show random image
   from folder*. Para tirar o texto "Sleeping": Sleep screen message →
   desmarcar *Add message to sleep screen*.

## Comandos KPM

Digitados na barra de busca da tela inicial do Kindle:

```
;kpm update
;kpm install <pacote>
;kpm launch <pacote>
;kpm uninstall <pacote>
```

## Livros grátis (legais)

No KOReader: 🔍 → **OPDS catalog** — Project Gutenberg e
[Standard Ebooks](https://standardebooks.org/feeds/opds).

## Cuidados

- **Nunca** clicar em *Enable OTA Updates* no Jobman.
- **Nunca** fazer reset de fábrica sem orientação (Discord do KindleModding).
- Apagar qualquer `update*.bin` / `update.bin.tmp.partial` na raiz do Kindle.
- Com o KOReader aberto o Kindle não aparece como disco USB — sair dele antes.

## Referências

- [Kindle Modding Wiki](https://kindlemodding.org/)
- [Awesome-Kindle](https://github.com/KindleTweaks/Awesome-Kindle)
- [KOReader](https://koreader.rocks/)
