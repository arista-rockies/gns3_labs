# labs
this ansible script will instantiate a lab on a specified gns3 server.

the underlying python code is somewhat idepotent.  this means that if the script is run more than once for the same lab and type it will not shutdown/delete/remove any devices already in the lab during the second run.  it will, however add any new objects or links into the lab for subsequent runs.

## installation requirements
you'll need to install the colleciton with the following command

```
ansible-galaxy collection install -r requirements.yml
```

required python code will be installed as a part of the job.

you'll need to create a local.yml in the vars directory that contains details specific to your installation.  an example file has been provided in the repo

## execution

to execute the lab issue a command as follows:

```
ansible-playbook labs.yml -e execute=VERB -e lab=LABNAME -e imageType=IMAGETYPE -vvvv
```

where
* VERB is either create or delete depending on which operation you'd like to complete.  if not specified, defaults to create
* LABNAME is the name of the lab you'd like to operate on.  labs are provided in the labs subdirectory.  the LABNAME option should match the filename of the lab *without* the file extension
* IMAGETYPE default to "ceos".  viable options are defined in your local.yml file in a structure called "images".  if the specified value does not exist or is not present in local.yml the default is used.




