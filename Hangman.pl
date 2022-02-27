#!/usr/bin/perl
@wordlist = ("computer", "radio", "calculator", "teacher", "bureau", "police", "geometry", "president", "subject", "country", "enviroment", "classroom", "animals", "province", "month", "politics", "puzzle", "instrument", "kitchen", "language", "vampire", "ghost", "solution", "service", "software", "virus", "security", "phonenumber", "expert", "website", "agreement", "support", "compatibility", "advanced", "search", "triathlon", "immediately", "encyclopedia", "endurance", "distance", "nature", "history", "organization", "international", "championship", "government", "popularity", "thousand", "feature", "wetsuit", "fitness", "legendary", "variation", "equal", "approximately", "segment", "priority", "physics", "branche", "science", "mathematics", "lightning", "dispersion", "accelerator", "detector", "terminology", "design", "operation", "foundation", "application", "prediction", "reference", "measurement", "concept", "perspective", "overview", "position", "airplane", "symmetry", "dimension", "toxic", "algebra", "illustration", "classic", "verification", "citation", "unusual", "resource", "analysis", "license", "comedy", "screenplay", "production", "release", "emphasis", "director", "trademark", "vehicle", "aircraft", "experiment");

@guessed_so_far = ();
$Count = 0;
$WinCnter = 0;
@guessed_letter = ();

$n = @wordlist;
$randVal = int(rand($n));
$curWord = @wordlist[int($randVal)-1];
$len = length($curWord);
for($i = 0 ; $i<$len ; $i++)
{
    $guessed_so_far[$i] = '_';
}
while(!$WinCnter)
{
    print "@guessed_so_far \n";
    print("\n");
    print("Enter a letter\n");
    $letter= <STDIN>;
    chomp($letter);
    Insert($letter);
    Hangman_Rep();
    if($Count==6)
    {
        last;
    }
    $WinCnter = CheckWin();
}
if($WinCnter)
{
    print "@guessed_so_far \n";
    print "Congratulations! You Won! \n";
}

sub Insert
{
    ($let) = @_;
    $ind = index($curWord,$let);
    $indi = -1;
    $len1 = @guessed_letter;
    for($i = 0 ; $i<$len1 ; $i++)
    {
        if($let eq $guessed_letter[$i])
        {
            $indi = $i;
            last;
        }
    }
    if($indi==-1)
    {
        push @guessed_letter, $let;
        if($ind==-1)
        {
            $Count++;
            $left = 6 - $Count;
            if($left != 0)
            {
                print "Bad Guess! You Have $left Tries Left \n";
            }
            else
            {
                print "No More Tries Left! You Lost. \n";
                print "The Correct Word is : $curWord \n";
            }
        }
        else
        {
            print "Nice Guess! \n"; 
            for($i = 0 ; $i<$len; $i++)
            {
                $ch = substr($curWord,$i,1);
                if($let eq $ch)
                {
                    $guessed_so_far[$i] = $let;
                }
            }
        }
    }
    else
    {
        print "You Have Already Guessed this letter \n";
    }
}

sub CheckWin
{
    for($i = 0 ; $i<$len ; $i++)
    {
        if($guessed_so_far[$i] eq '_')
        {
            return 0;
        }
    }
    return 1;
}

sub Hangman_Rep
{
    if($Count == 0)
    {
        print " ___________ \n";
        print "|           | \n";
        print "|             \n";
        print "|             \n";
        print "|             \n";
        print "|             \n";
        print "|             \n";
        print "|             \n";
    }
    elsif($Count == 1)
    {
        print " ___________ \n";
        print "|           | \n";
        print "|           O \n";
        print "|             \n";
        print "|             \n";
        print "|             \n";            
        print "|             \n";
        print "|             \n";
    }
    elsif($Count == 2)
    {
        print " ___________ \n";
        print "|           | \n";
        print "|           O \n";
        print "|           | \n";
        print "|           | \n";
        print "|             \n";
        print "|             \n";
        print "|             \n";
    }
    elsif($Count == 3)
    {
        print " ___________ \n";
        print "|           | \n";
        print "|           O \n";
        print "|          \\| \n";
        print "|           | \n";
        print "|             \n";
        print "|             \n";
        print "|             \n";
    }
    elsif($Count == 4)
    {
        print " ___________ \n";
        print "|           | \n";
        print "|           O \n";
        print "|          \\|/ \n";
        print "|           | \n";
        print "|             \n";
        print "|             \n";
        print "|             \n";
    }
    elsif($Count == 5)
    {
        print " ___________ \n";
        print "|           | \n";
        print "|           O \n";
        print "|          \\|/ \n";
        print "|           | \n";
        print "|          /  \n";
        print "|             \n";
        print "|             \n";
    }
    elsif($Count == 6)
    {
        print " ___________ \n";
        print "|           | \n";
        print "|           O \n";
        print "|          \\|/ \n";
        print "|           | \n";
        print "|          / \\ \n";
        print "|             \n";
        print "|             \n";
    }
}