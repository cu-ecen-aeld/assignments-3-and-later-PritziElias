#include <stdio.h>
#include <string.h>
#include <syslog.h>

// Assume two inputs from command line
// writefile -> path
// writestring -> what to write
int main(int argc, char* argv[])
{
    openlog("demo_writer", LOG_PID, LOG_USER);

    if (argc != 3)
    {
        syslog(LOG_ERR, "Please provide two arguments");
        return 1;
    }

    char* writefile = argv[1];
    char* writestr = argv[2];

    FILE* fileToWrite = fopen(writefile, "w+");

    if (fileToWrite == NULL)
    {
        syslog(LOG_ERR, "Could not open file");
        return 1;
    }

    syslog(LOG_DEBUG, "Writing %s to %s", writestr, writefile);
    fwrite(writestr, sizeof(char), strlen(writestr), fileToWrite);

    fclose(fileToWrite);
    closelog();
    return 0;
}

// Check if two input variables have been applied

// Setup syslog

// Write also syslog message

// Write unexpected errors to LOG_ERR