VERSION=$(cat metadata.yaml | grep version | cut -d ":" -f 2 | tr -d "[:blank:]")
OUTPUT="JournalOfMatthewCocking-${VERSION}.epub"
pandoc --output "${OUTPUT}" \
       --epub-chapter-level=2 \
  metadata.yaml \
  README.md \
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
  13-june-1773.md \
  00-notes.md
echo Built "${OUTPUT}"
