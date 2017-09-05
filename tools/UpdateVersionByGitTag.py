#!/usr/bin/env python3
import datetime
import fileinput
import sys
import re, subprocess, sys, getopt

def main(argv):
   inputfile = ''
   try:
      opts, args = getopt.getopt(argv,"hi:o:",["ifile="])
   except getopt.GetoptError:
      print ('UpdateVersionByGitTag.py -i <inputfile>')
      sys.exit(2)
   for opt, arg in opts:
      if opt == '-h':
         print ('UpdateVersionByGitTag.py -i <inputfile>')
         sys.exit()
      elif opt in ("-i", "--ifile"):
         inputfile = arg

# get latest git tag
   tag = subprocess.check_output(["git", "describe", "--abbrev=0", "--tags"])
   version = re.sub('^v', r'', tag).rstrip()
   version_split = version.split(".")
   now = datetime.datetime.now()
   date = now.strftime("%Y %b %d")

   for line in fileinput.input(inputfile, inplace=1):
      line = re.sub('(VIM_VERSION_MAJOR\t\t).*', r'\g<1>'+version_split[0], line)
      line = re.sub('(VIM_VERSION_MAJOR_STR\t\t).*', r'\g<1>"'+version_split[0]+'"', line)
      line = re.sub('(VIM_VERSION_MINOR\t\t).*', r'\g<1>'+version_split[1], line)
      line = re.sub('(VIM_VERSION_MINOR_STR\t\t).*', r'\g<1>"'+version_split[1]+'"', line)
      line = re.sub('(VIM_VERSION_BUILD\t\t).*', r'\g<1>'+version_split[2], line)
      line = re.sub('(VIM_VERSION_BUILD_STR\t\t).*', r'\g<1>"'+version_split[2]+'"', line)
      line = re.sub('(VIM_VERSION_NODOT\t).*', r'\g<1>"vim'+version_split[0]+version_split[1]+'"', line)
      line = re.sub('(VIM_VERSION_SHORT\t).*', r'\g<1>"'+version+'"', line)
      line = re.sub('(VIM_VERSION_MEDIUM\t).*', r'\g<1>"'+version+'"', line)
      line = re.sub('(VIM_VERSION_LONG\t).*', r'\g<1>"VIM - Vi IMproved '+version+' ('+date+')"', line)
      line = re.sub('(VIM_VERSION_LONG_DATE\t).*', r'\g<1>"VIM - Vi IMproved '+version+' ('+date+', compiled "', line)
      sys.stdout.write(line)

if __name__ == "__main__":
   main(sys.argv[1:])

