import win32com.client

word = win32com.client.Dispatch("Word.Application")
word.Visible = True