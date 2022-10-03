# Build the ebook. Requires git and pandoc.

# Pre-process foreward template version.
if [[ -n $(git status -s) ]]; then
    COMMIT="#######"
    EPOCH=$(date +%s)
else
    COMMIT=$(git log -1 --format=%h)
    EPOCH=$(git log -1 --format=%ct)
    TAG=$(git describe --tags --candidates=0 $COMMIT 2>/dev/null)
    if [[ -n $TAG ]]; then
        COMMIT=$TAG
    fi
fi
DATE="@$EPOCH"
VERSION="Commit $COMMIT, $(date -d $DATE +'%B %d, %Y')."
sed "s/{{ version }}/$VERSION/g" foreward.tpl.md > foreward.md
echo "${VERSION}"

OUTPUT="JournalOfMatthewCocking-${COMMIT}.epub"
pandoc \
    --output "${OUTPUT}" \
    --epub-chapter-level=2 \
    --toc \
    --css style.css \
  meta.yaml \
  foreward.md \
  00-notes.md \
  00-title.md \
  01-june-1772.md \
  02-july-1772.md \
  03-august-1772.md \
  04-september-1772.md \
  05-october-1772.md \
  06-november-1772.md \
  07-december-1772.md \
  08-january-1773.md \
  09-february-1773.md \
  10-march-1773.md \
  11-april-1773.md \
  12-may-1773.md \
  13-june-1773.md
echo Built "${OUTPUT}"
