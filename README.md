## What is Inception ?
Inception is a 42 School project that introduces us to containers with Docker and Docker-compose.


## How to launch it ?
1) Clone the repo

2) Create a /home/yourusername/data directory and two files inside, data/wordpress and data/mariadb, where the volumes are going to be stored
```
mkdir -p /home/yourusername/data/wordpress /home/yourusername/data/mariadb
```

3) Give yourself read, write and execution permissions on /home/username and what follows with
```
   chmod -R u+rwx /home/yourusername
```

5) Replace my own username (llepiney) with yours everywhere in the repo, it is important for paths
  (If you type "pwd" in your terminal, what is the next directory after "/home" ? It should be your username)
  
6) Type ```make```, wait for it to be done

7) Now you can visit the site, it should be the default Wordpress page :
   https://localhost

You are going to encounter a warning "Warning: Potential Security Risk Ahead", click on "advanced" and continue.
It is perfectly normal since the site is self-signed (not officially recognized).

>[!NOTE]
>The .env here is pushed for testing, otherwise you should NEVER publish your .env as it could >contain sensitive information about your application !!

## Checking the information about the images/containers/networks/volumes
```
make info
```

## Stopping the containers
```
make clean
```

## Deleting everything including the volumes
```
make fclean
```
