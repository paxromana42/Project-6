# Part 4

At this point, you should have been successful at backing up and scheduling protection for your most critical Windows infrastructure. While this class is not inherently a Linux class, there are many parallels between the content in this section, and it is prudent for you to practice some of the same skills in both infrastructures.  

---

In your Ubuntu environment, create a BASH scripts that will perform either full or incremental backups of a given source directory and store the backed-up files in a given target directory.  Justify why you felt a full or incremental backup was appropriate for this directory. How can you show that the script you’ve included is incrementally or fully backing up the data?  Make sure to include a copy of any scripts you write with your final submission, as well as clear screenshots showing that the backup was successful. 

Once your script is working in the Ubuntu environment, use the `cron` command to schedule the script. You should choose which days of the week would be appropriate for the data to be backed up.  Make sure that your final submission shows clear documentation that the schedule works, and your data is being backed up at those times.