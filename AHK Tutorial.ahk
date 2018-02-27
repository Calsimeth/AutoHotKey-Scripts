
/*Home Quick links Forums Members IRC Channel Commands Tutorial Download - 1.1.26.01 FAQ LoginRegister
Search Login Register

Search…
SearchAdvanced search
Board indexAutoHotkeyTutorials
AHK Basics (Small Start)
Post Reply

Search this topic…
SearchAdvanced search
3 posts • Page 1 of 1
User avatarDelta Pythagorean
Posts: 129
Joined: 13 Feb 2017
Location: Somewhere in the 8th Dimension I think...
19 Aug 2017, 19:14
Need help with AutoHotkey?
Don't know where to start?
Well, I've gone through the troubles of making a simple script to help you begin your journey on how to use AHK.

For now, this is just the beginning, but I will add more to this tutorial and I will make a new topic for advanced help and other things that you might need help with.
If you have any questions that weren't answered in the following tutorial, then tell me in a reply, or simply send me a message!
Code: [Select all] [Expand] [Download] (AHK Basics.ahk)GeSHi © Codebox Plus*/
/*
	==============================================================================================
	Hello!
	Welcome to AutoHotkey.
	One of the most simple languages you can learn today.
	My name is Delta, and I will be your guide.
	All of the information you need to know about what commands are for and the syntax for them
	will be posted with a link above them.
	So if you don't know how I know what I know, then go to the link and you'll be fine!
	==============================================================================================

	Before we begin we have to know the basics of programming.

	First, "What is programming?"
		Well, programming is simply writing into a text document or more
		to create something that works and does what the user would like to accomplish.
	Second, "Why do we need programming?"
		We need programming to automate, entertain, and fix problems
		that might come up in everyday life.
		We may not know *everything* about programming.
		We just need to know how to create the things we need.
	Third, "How do I get started?"
		To get started, we need a language to use.
		Since your here, we'll be learning AutoHotkey, otherwise known as AHK.

	Alright, we know a little bit more about programming, so... what now?
	We need to know the basics of AHK.

	First of all, let's get to know what a "comment" is.
	A comment, is text that is NOT read by the AHK application.
	A comment can be enclosed in an asterisk (*)
	and a backslash (/)
	like this comment that this entire text is enclosed in.
	And a "single-line" comment can just have a semi-colon (;)
	before the text:
	; This is a comment for just a phrase, sentence, or even disabling code temporarily.

	Alright, that's out of the way, let's now know what a variable is and what it's for.
	A variable is used to hold information to be used for later.
	So if I want to have a Message Box say a certain sentence, I can do this:
*/

; https://autohotkey.com/docs/Variables.htm
Sentence = Hello World!

; https://autohotkey.com/docs/commands/MsgBox.htm
MsgBox, %Sentence%

Sentence = I am the new text for this variable!

/*
	As you continue you your journey to using AHK, you'll use a lot of variables.
	And I mean A LOT of variables!

	Great, we now know how to use variables, we must know why we use variables...
	First, you can have as many variables as you WANT.
	You can have so many variables that it won't even matter what your program is, it'll still run fine... Kinda
	There is a limit to how many but I can't remember what it is... Oh well.

	Alright, now that we know more about variables, we need to know what a command is and why it's important.
	A command is the most used item in the AHK programming language.
	A command needs to do something, and in order to do something, we need to know what that command is for.
	Most commands, if not all, are self-explanatory.
	The names litterally tell you what they're for.
	For example:
	MsgBox
		(https://autohotkey.com/docs/commands/MsgBox.htm)
	Makes a Message Box for the user to tell another user, or the same user, information that is needed to be known,
	or for showing information that isn't obvious to know.
*/

MsgBox, I am a Message Box!

/*
	If you want to know how to use a command, I'll let you in a little secret...
	Anything enclosed in brackets like these: []
	is NOT needed in the command and that parameter can be left blank.
		========
		DO NOT ADD THE BRACKETS TO YOUR CODE.
		========
	For example, the syntax for MsgBox is:
		MsgBox [, Options, Title, Text, Timeout]
	In MsgBox,
		Options is not needed,
		Title is not needed,
		Text is not needed.
		and Timeout is not needed.
*/

MsgBox

/*
	Another example could be InputBox.
	Said syntax could be:
		InputBox, OutputVar [, Title, Prompt, HIDE, Width, Height, X, Y, Font, Timeout, Default]
			(https://autohotkey.com/docs/commands/InputBox.htm)
*/

; https://autohotkey.com/docs/commands/InputBox.htm
InputBox, OutputVar, This is a title., What is your name?,,,,,,,, Dave
; As you can see, the parameters for, HIDE, Width, Height, X, Y, Font, and Timeout were left blank.


/*
	So, we got commands out of the way, you've probably seen a function or two.
	A function allows the user to automate something instead of using the same commands every time
	filling up your code, or a function can be used to return information that you need to save to.
	A function can be put anywhere in your code, as long as it does NOT interfere with your code.
*/

; This is wrong:
	; Some code
	A_New_Function() {
		; Some code.
		Return
	}
	; Rest of code
; This is correct:
	; Some code.

	Another_Funtion() {
		; You know the drill.
		Return
	}
	; No other code left to execute or be used.

/*
	To define a function, you need to write it like this:
*/

; https://autohotkey.com/docs/Functions.htm
MyFunction(Info) {
	; Some code to do something.
	; https://autohotkey.com/docs/Return.htm
	Return Info
}

/*
	Return will, litterally, return information that you write down to the variable or text you want.
	For example:
*/

; For doing an expression, use a colon AND an equal sign.
; This variable will store the information you gave in the InputBox.
MyVariable := MyFunction(OutputVar)
; Once you have defined a function, it will not need to be re-defined.
MsgBox, %MyVariable%

/*
	Let's learn about some if commands, shall we?
	First off, an if command is used to find information that you provide,
	and tell whether it's true or false.
	For example:
*/

; https://autohotkey.com/docs/commands/IfExpression.htm
If (100 > 10) {
	MsgBox, It's true!, I saw it with my own eyes!
}

/*
	Now, there are many of ways to use the if command,
	but I'll tell you that an if command is the most useful thing in AHK besides variables.
*/


/*
	=================================================================================
	I don't think I need to say anything else,
	so if you need to know more, check out my advanced information tutorial.
		(Coming soon!)
	=================================================================================
*/


Advanced Tutorial coming soon...
Gui tutorial coming soon...
Class tutorial coming soon...
Advanced function tutorial coming soon...
Code: [Select all]GeSHi © Codebox Plus
vDelPy := RegExReplace("Delta Pythagorean", "^(\w{3})\w*\s+\b(\w{2})\w*$", "v$1 $2")
Need help with anything? Send me a message! It's likely I've ran into your problem before.
Top
Guest45
20 Aug 2017, 14:22
Useful, thanks.
If possible, could you please consider making a detailed tutorial about classes?
Top
User avatarDelta Pythagorean
Posts: 129
Joined: 13 Feb 2017
Location: Somewhere in the 8th Dimension I think...
21 Aug 2017, 06:55
Guest45 wrote:
[...]
If possible, could you please consider making a detailed tutorial about classes?


Sure! Let me get a few things done with the Functions tutorial and I'll get right on it!
Code: [Select all]GeSHi © Codebox Plus
vDelPy := RegExReplace("Delta Pythagorean", "^(\w{3})\w*\s+\b(\w{2})\w*$", "v$1 $2")
Need help with anything? Send me a message! It's likely I've ran into your problem before.
Top
Display posts from previous:  Sort by   Go
Post Reply 3 posts • Page 1 of 1
Return to “Tutorials”

Jump to
Who is online
Users browsing this forum: No registered users and 3 guests

HomeBoard indexAll times are UTC-05:00Delete all board cookiesThe teamContact us
Powered by phpBB® Forum Software © phpBB Limited 
Style by Arty