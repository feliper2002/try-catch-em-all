String capsLock(String word, [int index = 0]) {
  late String newWord;
  if (index <= word.length && index >= 0) {
    String _pos = word[index];
    _pos = _pos.toUpperCase();
    String separated = (index < word.length)
        ? word.replaceRange(index, index + 1, _pos)
        : word.replaceRange(index, index, _pos);
    newWord = separated;
    return newWord;
  }
  return word;
}

// void main() {
//   String palavra = 'kotori';

//   print(capsLock(palavra));
// }
