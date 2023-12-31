import sys, os
from gtts import gTTS
fo = open(sys.argv[1],'r')
ft = fo.readlines()
tts = gTTS(ft[0])
tts.save(sys.argv[2])
