function Anagram(targetWord) {
  this.targetWord = targetWord;
}

Anagram.prototype.matches = function (words) {
  args = Object.values(arguments);
  words = [].concat.apply([], args);

  var anagrams = [];
  const anagramLetters =
    this.targetWord.toLowerCase().split('').sort().toString();

  for (var word of words) {
    if (word.toLowerCase() === this.targetWord.toLowerCase())
      continue;

    const wordLetters = word.toLowerCase().split('').sort().toString();

    if (wordLetters === anagramLetters)
      anagrams.push(word);
  }

  return anagrams;
};

module.exports = Anagram;
