#!/usr/bin/perl
#
# Name:  ProcessHexFile.pl 
#
# Purpose  :  The purpose of this file is to parse an Intel hex file and
#             turn it into an XML file that can be parsed with an XML
#             parser. 
#
# Algorithm:  
#     
# Author:     Jim Bomkamp
#
#####################################################################        

use strict;
#use warnings;
use File::Slurp;
use File::Basename;


# Get the command line arguments (script name not included), and their number here
my $numArgs = $#ARGV + 1; 
print "Thanks, you gave me $numArgs command-line arguments:\n"; 
my $num = 1;
my @expectedParameters;
$expectedParameters[0] = "input path/filename";
$expectedParameters[1] = "output path";
my $outputPathName = "";
my $fileNameString = "";
my $directoryPath = "";
my $suffix = "";
my $outputFileName = "";
my $inputFileName = "";


foreach my $argnum (0 .. $#ARGV) 
{ 
   print "# $num : Commandline parameter $expectedParameters[$num-1] is: $ARGV[$num-1]\n"; 
   $num += 1;
}

if ($num < 2)
{
   print "Not enough parameters were entered, as a minimum the input path/filename must be supplied.\n";
   print "And, an optional second parameter is the path for the output xml file to be created.\n";
   exit 0;
}
elsif (!(($num > 1) && (-f $ARGV[0])))
{
   print "ERROR:  The first parameter received is not a regular filename.\n";
   exit 0;
}
elsif ($num == 2)
{
   if (-f $ARGV[0])
   {
      print "Since only the path/filename for the input is provided, the output will be created in the same directory";
      if ($ARGV[0] =~ /\//)
      {
         ($fileNameString, $directoryPath, $suffix) = fileparse($ARGV[0]);
         print "Input file name:$fileNameString  Input file path:$directoryPath  suffix:$suffix\n";
         $outputPathName = $directoryPath;
         $outputFileName = $outputPathName . $fileNameString . $suffix . ".xml";
         print "Output file is named:$outputFileName \n";
      }
      else
      {
         $fileNameString = $ARGV[0];
         $outputPathName = "";
         $outputFileName = $outputPathName . $fileNameString . ".xml";
         print "Output file is named:$outputFileName \n";
      }
      
   }
}
elsif ($num == 3)
{
   if (!(-d $ARGV[1]))
   {
      print "ERROR:  The second parameter, $ARGV[1], is not an accessible directory.\n";
      exit 0;
   }
   else
   {
      $outputPathName = $ARGV[1];
      ($fileNameString, $directoryPath, $suffix) = fileparse($ARGV[0]);
      print "Input file name:$fileNameString  Input file path:$directoryPath  suffix:$suffix\n";
      $outputFileName = $outputPathName . $fileNameString . $suffix . ".xml";
      print "Output file is named:$outputFileName \n";
   }
}
elsif ($num > 3)
{
   print "WARNING:  unrecognizable parameter(s) received, but will proceed creating XML file...\n";
   print "TIP:  Run script without any parameters to find out what parameters are expected...\n";
   $outputPathName = $ARGV[1];
   ($fileNameString, $directoryPath, $suffix) = fileparse($ARGV[0]);
   print "Input file name:$fileNameString  Input file path:$directoryPath  suffix:$suffix\n";
   $outputFileName = $outputPathName . $fileNameString . $suffix . ".xml";
   print "Output file is named:$outputFileName \n";
}


# Open the received file for parsing
$inputFileName = $ARGV[0];


# Slurp in the entire file to a string (very fast read of entire file into a string)
my $textArray = read_file($inputFileName);

my @hexFileRowDataRead = split(':', $textArray);
    
open(OUTPUT, ">$outputFileName");
print OUTPUT '<?xml version="1.0" encoding="utf-8"?>';
print OUTPUT "\n";
print OUTPUT "<IntelHex>\n";

my $val;

my $rowCounterValue = 1;
my $firstTimeThrough = 0;
foreach $val (@hexFileRowDataRead) 
{
   if ($firstTimeThrough > 0)
   {
      chomp($val);
      print OUTPUT "<N>$rowCounterValue</N>";
      print OUTPUT "<H>$val</H>\n";
      $rowCounterValue++;
   }
   else
   {
      $firstTimeThrough++;
   }
}
print OUTPUT "<EOF>EOF</EOF></IntelHex>\n";

close(OUTPUT);
close($inputFileName);


exit 0;


