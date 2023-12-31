from smtplib import SMTP

server = SMTP('smtp.gmail.com:587')
server.ehlo()
server.starttls()
server.login('manvendra.jhala@gmail.com',pass)
From="manvendra.jhala@gmail.com"
To="manvendra.jhala@gmail.com"
msg="HELLO PALOMA WHAT ARE YOU DOING. ARE YOU PLAYING PRODIGY"
server.sendmail(From, To, msg)
server.close()


