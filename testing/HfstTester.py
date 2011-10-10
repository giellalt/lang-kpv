#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Usage:
# -x flag demands the command (with py):
# py HfstTester.py ...

# HfstTester.py 1.4 - Copyright (c) 2011
# Brendan Molloy <brendan@bbqsrc.net>
# Børre Gaup <boerre@skolelinux.no>
# Licensed under Creative Commons Zero (CC0)

# Taken from:
# http://apertium.svn.sourceforge.net/svnroot/apertium/incubator/apertium-tgl-ceb/dev/verbs/HfstTester.py@28665
# Copied into the GT svn instead of just referenced, since file externals don't work for
# foreign repositories.

# TODO:
# - create Rules: {} for JSON, to make parsing more dynamic
# - make WHY it failed much more clear.

import sys
try:
	import argparse
except:
	print "Looks like you're on an older Python version."
	print "Please do `sudo easy_install argparse`."
	sys.exit(255)

try:
	from collections import OrderedDict
except:
	try:
		from ordereddict import OrderedDict
	except:
		print "Looks like you're on an older Python version."
		print "Please do `sudo easy_install ordereddict`."
		
try:
	import yaml
except:
	print "Looks like you're missing the YAML parser."
	print "Please do `sudo easy_install pyyaml`."
	sys.exit(255)

try:
	import json
except:
	print "Looks like you're on an older Python version and missing the JSON parser."
	print "Please do `sudo easy_install simplejson`."
	sys.exit(255)

from subprocess import *
import os, traceback

def s2l(thing):
	if type(thing) in (str, unicode):
		return [thing]
	elif type(thing) in (list, tuple):
		return thing
	else:
		return None

def l2s(thing):
	if type(thing) in (str, unicode):
		return thing
	elif type(thing) in (list, tuple):
		if len(thing) > 1:
			return 'Either ' + ' or '.join(thing)
		else:
			return thing[0]
	else:
		return None

def colourise(string, opt=None):
	def red(s="", r="\033[m"):
		return "\033[1;31m%s%s" % (s, r) 
	def green(s="", r="\033[m"):
		return "\033[0;32m%s%s" % (s, r) 
	def orange(s="", r="\033[m"):
		return "\033[0;33m%s%s" % (s, r) 
	def yellow(s="", r="\033[m"):
		return "\033[1;33m%s%s" % (s, r) 
	def blue(s="", r="\033[m"):
		return "\033[0;34m%s%s" % (s, r) 
	def light_blue(s="", r="\033[m"):
		return "\033[0;36m%s%s" % (s, r) 
	def reset(s=""):
		return "\033[m%s" % s

	if not opt:
		x = string
		x = x.replace("=>", blue("=>"))
		x = x.replace("<=", blue("<="))
		x = x.replace(":", blue(":"))
		x = x.replace("[PASS]", green("[PASS]"))
		x = x.replace("[FAIL]", red("[FAIL]"))
		return x
	
	elif opt == 1:
		return yellow(string)

	elif opt == 2:
		x = string.replace('Passes: ', 'Passes: %s' % green(r=""))
		x = x.replace('Fails: ', 'Fails: %s' % red(r=""))
		x = x.replace(', ', reset(', '))
		x = x.replace('Total: ', 'Total: %s' % yellow(r=""))
		return "%s%s" % (x, reset())

def whereis(program):
    for path in os.environ.get('PATH', '').split(':'):
        if os.path.exists(os.path.join(path, program)) and \
           not os.path.isdir(os.path.join(path, program)):
            return os.path.join(path, program)
    return None

# Courtesy of https://gist.github.com/844388. Thanks!
class OrderedDictYAMLLoader(yaml.Loader):
    """A YAML loader that loads mappings into ordered dictionaries."""

    def __init__(self, *args, **kwargs):
        yaml.Loader.__init__(self, *args, **kwargs)

        self.add_constructor(u'tag:yaml.org,2002:map', type(self).construct_yaml_map)
        self.add_constructor(u'tag:yaml.org,2002:omap', type(self).construct_yaml_map)

    def construct_yaml_map(self, node):
        data = OrderedDict()
        yield data
        value = self.construct_mapping(node)
        data.update(value)

    def construct_mapping(self, node, deep=False):
        if isinstance(node, yaml.MappingNode):
            self.flatten_mapping(node)
        else:
            raise yaml.constructor.ConstructorError(None, None,
                'expected a mapping node, but found %s' % node.id, node.start_mark)

        mapping = OrderedDict()
        for key_node, value_node in node.value:
            key = self.construct_object(key_node, deep=deep)
            try:
                hash(key)
            except TypeError, exc:
                raise yaml.constructor.ConstructorError('while constructing a mapping',
                    node.start_mark, 'found unacceptable key (%s)' % exc, key_node.start_mark)
            value = self.construct_object(value_node, deep=deep)
            mapping[key] = value
        return mapping

class HfstTester:
	def __init__(self):
		self.fails = 0
		self.passes = 0
		self.ignores = 0

		self.count = []

		argparser = argparse.ArgumentParser(
			description="""Test morphological transducers for consistency. 
			`hfst-lookup` (or Xerox' `lookup` with argument -x) must be
			available on the PATH.""",
			epilog="Will run all tests in the test_file by default."
			)
		argparser.add_argument("-c", "--colour",
			dest="colour", action="store_true",
			help="Colours the output")
		argparser.add_argument("-C", "--compact",
			dest="compact", action="store_true",
			help="Makes output more compact")
		argparser.add_argument("-i", "--ignore-extra-analyses",
			dest="ignore_extra_analyses", action="store_true",
			help="""Ignore extra analyses when there are more than expected,
			will PASS if the expected one is found.""")
		argparser.add_argument("-s", "--surface",
			dest="surface", action="store_true",
			help="Surface input/analysis tests only")
		argparser.add_argument("-l", "--lexical",
			dest="lexical", action="store_true",
			help="Lexical input/generation tests only")
		argparser.add_argument("-f", "--no-pass",
			dest="hide_pass", action="store_true",
			help="Suppresses passes to make finding failures easier")
		argparser.add_argument("-p", "--no-fail",
			dest="hide_fail", action="store_true",
			help="Suppresses failures to make finding passes easier")
		argparser.add_argument("-x", "--xerox",
			dest="xerox", action="store_true",
			required=False, help="""Use the Xerox `lookup` tool (default is
			`hfst_lookup`)""")
		argparser.add_argument("-t", "--test",
			dest="test", nargs=1, required=False,
			help="""Which test to run (Default: all). TEST = test ID, e.g.
			'Noun - gåetie' (remember quotes if the ID contains spaces)""")
		argparser.add_argument("test_file", nargs=1,
			help="YAML/JSON file with test rules")
		self.args = argparser.parse_args()	

		try:
			f = yaml.load(open(self.args.test_file[0]), OrderedDictYAMLLoader)
		except:
			try:
				f = json.load(open(self.args.test_file[0]))
			except Exception, e:
				traceback.print_exc()
				print "File not valid YAML or JSON. Bailing out."
				print "Check your YAML for spurious hidden tabs."
				sys.exit(255)
		
		if self.args.xerox:
			print "Testing Xerox FST dictionaries"
			configkey = "xerox"
			self.program = "lookup"
		else:
			print "Testing Helsinki FST dictionaries"
			configkey = "hfst"
			self.program = "hfst-lookup"

		if not whereis(self.program):
			print "Cannot find %s. Check $PATH." % self.program
			sys.exit(255)

		self.gen = f["Config"][configkey]["Gen"]
		self.morph = f["Config"][configkey]["Morph"]
		for i in (self.gen, self.morph):
			if not os.path.isfile(i):
				print "File %s does not exist." % i
				sys.exit(255)	
		self.tests = f["Tests"]

		if self.args.test:
			# Assume that the command line input is utf-8, convert it to unicode
			self.args.test[0] = self.args.test[0].decode('utf-8')
		self.run_tests(self.args.test)
	
	def c(self, s, o=None):
		if self.args.colour:
			return colourise(s, o)
		return s

	def run_tests(self, input=None):
		if self.args.surface == self.args.lexical == False:
			self.args.surface = self.args.lexical = True
		
		if(input != None):
			if self.args.lexical: self.run_lexical_test(input[0])
			if self.args.surface: self.run_surface_test(input[0])
		
		else:
			for t in self.tests.keys():
				if self.args.lexical: self.run_lexical_test(t)
				if self.args.surface: self.run_surface_test(t)

	def run_surface_test(self, input):
		c = len(self.count)
		self.count.append([0, 0])
		
		title = "Test %d: %s (Surface/Analysis)" % (c, input)
		if not self.args.compact:
			print self.c("-"*len(title), 1).encode('utf-8')
			print self.c(title, 1).encode('utf-8')
			print self.c("-"*len(title), 1).encode('utf-8')

		for l in self.tests[input].keys():
			sforms = s2l(self.tests[input][l])
			lexors = []
			for s in sforms:
				for i in self.tests[input].keys():
					if s in s2l(self.tests[input][i]):
						lexors.append(i)

			app = Popen([self.program, self.morph], stdin=PIPE, stdout=PIPE, stderr=PIPE)
			args = ""
			for sform in sforms:
				args += sform + '\n'
			app.stdin.write(args.encode('utf-8'))
			res = app.communicate()[0].split('\n\n')
			#for i in res: print i, 

			for num, sform in enumerate(sforms):
				lexes = self.parse_fst_output(res[num].decode('utf-8'))
				#print "Lexes: ", lexes
				#print "\nl: ", l, "sform", sform, "res", res[num]
				#print "Lexors: ", lexors
				
				passed = False
				for lexor in lexors: # for each "facit" analysis
					if lexor in lexes: # We have a positive hit
						if not self.args.hide_pass and not self.args.compact:
							print self.c("[PASS] %s => %s" % (sform, lexor)).encode('utf-8')
						self.count[c][0] += 1
						lexes.remove(lexor) # remove the hit from the lookup results
						passed = True
				
				# If we have passed the test above AND ignore_extra_analyses is set,
				# don't print the fails
				if self.args.ignore_extra_analyses == False or passed == False:
					for lex in lexes:
						if not self.args.hide_fail and not self.args.compact:
							print self.c("[FAIL] %s => Expected: %s, Got: %s" % (sform, l, lex)).encode('utf-8')
						self.count[c][1] += 1
				else:
					self.ignores += len(lexes)
		
		if not self.args.compact:
			print self.c("Test %d - Passes: %d, Fails: %d, Total: %d\n" % (c, self.count[c][0],
				self.count[c][1], self.count[c][0] + self.count[c][1]), 2).encode('utf-8')
		else:
			if self.count[c][1] > 0:
				print self.c("[FAIL] - %s" % title)
			else:
				print self.c("[PASS] - %s" % title)
		
		self.passes += self.count[c][0]
		self.fails += self.count[c][1]

	def run_lexical_test(self, input):
		c = len(self.count)
		self.count.append([0, 0])
		title = "Test %d: %s (Lexical/Generation)" % (c, input)
		if not self.args.compact:	
			print self.c("-"*len(title), 1).encode('utf-8')
			print self.c(title, 1).encode('utf-8')
			print self.c("-"*len(title), 1).encode('utf-8')
		
		app = Popen([self.program, self.gen], stdin=PIPE, stdout=PIPE, stderr=PIPE)
		args = ""
		for k in self.tests[input].keys():
			args += k + '\n'
		app.stdin.write(args.encode('utf-8'))
		res = app.communicate()[0].split('\n\n')
		#for i in res: print i, 
		for num, l in enumerate(self.tests[input].keys()):
			sforms = s2l(self.tests[input][l])
			lexes = self.parse_fst_output(res[num].decode('utf-8'))
			for r in lexes:
				if (r in sforms):
					if not self.args.hide_pass and not self.args.compact:
						print self.c("[PASS] %s => %s" % (l, r) ).encode('utf-8')
					self.count[c][0] += 1
				else:
					if not self.args.hide_fail and not self.args.compact:
						print self.c("[FAIL] %s => Expected: %s, Got: %s" % (l, l2s(sforms), r)).encode('utf-8')
					self.count[c][1] += 1
		
		if not self.args.compact:
			print self.c("Test %d - Passes: %d, Fails: %d, Total: %d\n" % (c, self.count[c][0], 
				self.count[c][1], self.count[c][0] + self.count[c][1]), 2).encode('utf-8')
		else:
			if self.count[c][1] > 0:
				print self.c("[FAIL] - %s" % title)
			else:
				print self.c("[PASS] - %s" % title)
		
		self.passes += self.count[c][0]
		self.fails += self.count[c][1]

	def parse_fst_output(self, res):
		"Receive a unicode string"
		return_lex = []
		if type(res) == unicode:
			for i in res.replace('\r\n', '\n').replace('\r', '\n').split('\n'):
				if i.strip() != '':
					lexes = i.split('\t')
					
					# This test is needed because xfst's lookup
					# sometimes output strings like
					# bearkoe\tbearkoe\t+N+Sg+Nom, instead of the expected
					# bearkoe\tbearkoe+N+Sg+Nom
					if len(lexes) > 2 and lexes[2][0] == '+':
						lex = lexes[1].strip() + lexes[2].strip()
					else:
						lex = lexes[1].strip()
					return_lex.append(lex)
		return return_lex

if __name__ == "__main__":
	hfst = HfstTester()
	print "Total passes:", hfst.passes, 'of', hfst.fails + hfst.passes + hfst.ignores
	print "Total fails:", hfst.fails, 'of', hfst.fails + hfst.passes + hfst.ignores
	if hfst.args.ignore_extra_analyses:
		print "Total ignores:", hfst.ignores, 'of', hfst.fails + hfst.passes + hfst.ignores
	sys.exit(hfst.fails)
