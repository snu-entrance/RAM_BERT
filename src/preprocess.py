import re
from khaiii import KhaiiiApi

khai_tokenizer = KhaiiiApi()

class noJosa:
	def __init__(self):
		self.bracket = re.compile('\\(.+\\)')
		self.number = re.compile('[0-9]+')
		self.khai_tokenizer = KhaiiApi()

	def run(sentence):
    	sentence = self.bracket.sub('', sentence)
		sentence = self.number.sub('number', sentence)
	    words = []
	    for i in self.khai_tokenizer.analyze(c):
	        j_len = 0
	        for j in i.morphs:
	            if j.tag[0] == 'J':
	                j_len = len(j.lex)
   	             break
	        if j_len == 0:
	            words.append(i.lex)
	        else:
	            words.append(i.lex[:-j_len])
		return ' '.join(words)
