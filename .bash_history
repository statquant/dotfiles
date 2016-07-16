    myStr2 <- parse(text=paste(lastKey,":=as.POSIXct(-",lastKey,",origin=origin)",sep=""));
    A <- A[,eval(myStr2)]; setkeyv(A,keys);
    return(A);
}

lj <- function(X, Y, ...){
#USAGE: Perform a left-join but keeping keys of X
keyYInX <- intersect(key(Y),colnames(X))
if(length(keyYInX)>0)
setnames(Y, keyYInX, paste0(keyYInX,'_Y_FAKE_SUFFIXE'))
LJ <- Y[X,...];
nbKey <- min(length(key(LJ)), length(key(X)))
setnames(LJ, key(LJ)[1:nbKey], key(X)[1:nbKey]);
if(length(keyYInX)>0)
setnames(Y, paste0(keyYInX,'_Y_FAKE_SUFFIXE'), keyYInX)
return(LJ);
}

dt.unique <- function(DT, bykey=key(DT)){
##########################################################
#USAGE: return data.table without dups based on keys 
#defined by bykey 
#WARNING: bykey should be a begining of key(DT) like if 
#key(DT)={"x","y","t"} keyby should be key(DT)[1:i]
#TEST: TODO
##########################################################
keys <- key(DT);
if(any(bykey %notin% keys[1:length(bykey)]))
stop("ERROR in dt.unique keyby should be key(DT)[1:i]")
setattr(DT,"sorted",bykey);
uDT <- unique(DT);
#we set back the sorted attributes of DT (it is done by reference)
setattr(DT,"sorted",keys);
return(uDT);
}

setIdx <- function(DT){ 
keys <- key(DT);
DT[,IDX:=.I]; 
if('IDX' %in% keys){
if('IDX' != keys[1L]){
warning('Dans setIdx IDX est d�j� une cl� de DT mais pas la premi�re !')
}else{ #2013-08-27: data.table is loosing the keys when reassigning (it makes sense) 
setattr(DT,'sorted',keys);
}
}else{ #we add IDX to the keys
setattr(DT,'sorted',c('IDX',keys));
}
}

check_args <- function(arg, any_of, none_of, all_of){
#args values can be any values within any_of
if( !missing(any_of) && any(arg %notin% any_of) ){
argName <- deparse(substitute(arg));
allowedValues <- paste0('{',paste(any_of,collapse=','),'}')
argFault <- arg[arg %notin% any_of][1L]
errorMsg <- paste0(argName,' holds ',argFault,' which is not within accepted values: ',
   allowedValues);
stop(errorMsg)
}
#args values should contain none of none_of values
if( !missing(none_of) && any(arg %in% none_of) ){
argName <- deparse(substitute(arg));
forbidenValues <- paste0('{',paste(none_of,collapse=','),'}')
argFault <- arg[arg %in% none_of][1L]
errorMsg <- paste0(argName,' holds ',argFault,' which is within forbidden values: ',
   forbidenValues);
stop(errorMsg)
}
#args values should contain all of all_of values
if( !missing(all_of) && any(all_of %notin% arg) ){
argName <- deparse(substitute(arg));
neededValues <- paste0('{',paste(all_of,collapse=','),'}')
argFault <- all_of[all_of %notin% arg][1L]
errorMsg <- paste0(argName,' do not hold ',argFault,' which is one of the mandatory values: ',
   neededValues);
stop(errorMsg)
}
}

forcekey <- function(DT,...){
keys <- data.table:::getdots();
forcekeyv(DT,keys)
}

forcekeyv <- function(DT, keys){
data.table:::setattr(DT,'sorted',keys)
}

addkey <- function(DT,..., psn='front'){ 
keys <- data.table:::getdots();
forcekeyv(DT,keys,psn)
}

addkeyv <- function(DT, keys, psn='front'){ 
check_args(psn, any_of=c('front','queue'))
if(psn=='front'){ 
setattr(DT,'sorted',c(keys,key(DT)));
}else if(psn=='queue'){
setattr(DT,'sorted',c(key(DT),keys));
}
}

summ <- function(DT, field){
s <- DT[,list(.N),by=field]
setkeyv(s, field)
return(s)
}
#########################
# RORACLE PACKAGE UTILS #
#########################

openConnexion <- function(){
require(DBI); require(ROracle);
Login <- "cumansky";sntj9z";
drv <- dbDriver("Oracle");
con <<- dbConnect(drv, username = Login, password = Pwd, dbname = "SESAM", prefetch=TRUE, bulk_read=1e6);
rs <- dbSendQuery(con, "ALTER SESSION SET CURRENT_SCHEMA=SMF"); 
}

oracleToDate <- function(dateTime, oracleFormat="YYYY-MM-DD HH24:MI:SS"){ 
dateQuery <- paste("to_date('",dateTime,"','",oracleFormat,"')",sep="") 
return(dateQuery)
}

oracleQt <- function(stuff){return(paste0("'",stuff,"'"))}

oracleInQt <- function(stuff){
qte <- ifelse(is.numeric(stuff),'',"'");
return( paste0( '(', paste(paste0(qte,stuff,qte),collapse=",") ,')') )
}

getIdvm <- function(isins){
if(!exists("con")) openConnexion();
idvm.query <- paste0("SELECT DISTINCT V6XIDVM, V6XLBVM, V6XCDTD FROM VHVX WHERE V6XCDTD IN",oracleInQt(isins));
idvm <- dbGetQuery(con, idvm.query)
return(idvm)
}

#########################
#  GRAPHICAL UTILITIES  #
#########################
plotGrid <- function(...){
yaxp <- par()$yaxp;
H <- seq(from=yaxp[1], to=yaxp[2], length=yaxp[3]+1L)
xaxp <- par()$xaxp;
V <- seq(from=xaxp[1], to=xaxp[2], length=xaxp[3]+1L)
.grid(H,V,...)
}

.grid <- function(H,V, ...){
if(!missing(H)){
for(i in seq_along(H)){
abline(h=H[i], ...)
}
}
if(!missing(V)){
for(j in seq_along(V)){
abline(v=V[j], ...)
}
}
}
















reset


echo $TERM
cat ~/.bashrc 
grep "^#" ~/.bashrc 
grep -v "#" ~/.bashrc 
grep -v "#| " ~/.bashrc 
man grep 
which grep
grep -v # ~/.bashrc 
grep -v '#' ~/.bashrc 
grep -v "#" ~/.bashrc 
man grep
grep -v "#|^$" ~/.bashrc 
grep -v "#" -e "|^$" ~/.bashrc 
grep -v "|^$" ~/.bashrc 
grep -v -e "|^$" ~/.bashrc 
grep -e -v '^[[:space:]]*$' foo.txt
grep -e -v '^[[:space:]]*$' ~/.bashrc
grep -e -v "^[[:space:]]*$" ~/.bashrc
grep -v "^[[:space:]]*$" ~/.bashrc
grep -v "^$" ~/.bashrc
grep -v "^$|#" ~/.bashrc
grep -v "^[$|#]" ~/.bashrc
grep "^$" ~/.bashrc
grep "^$|^#" ~/.bashrc
grep -v '^#' | grep -v '^$' ~/.bashrc
grep -v '^#' ~/.bashrc | grep -v '^$'
grep -V
vim
grep -v "^#\|^$" ~/.bashrc 
vim
tmux
vim
tmux
sudo -s
cd Downloads/
cd films/
ll
ffmpeg -i "Star Wars Episode VII - The Force Awakens.mkv" -c copy -metadata:s:a:0 language=eng "Star Wars Episode VII - The Force Awakens.mp4"
cd /media
ll
ssh 192:168.1.47
ssh admin@192:168.1.47
ll
cd
ll
mount -t nfs euclide:/video /mnt
sudo -s mount -t nfs euclide:/video /mnt
sudo -s mount -t nfs 192.148.1.47:/video /mnt
sudo -s mount -t nfs 192.168.1.47:/video /mnt
sudo -s mount -t nfs 192.168.1.47 /mnt
sudo -s mount -t nfs 192.168.1.47:/backup /mnt
sudo -s mount -t nfs 192.168.1.47:/ /mnt
sudo -s mount -t nfs 192.168.1.47:/video /mnt
sudo -s mount -t nfs 192.168.1.47::video /mnt
sudo -s mount -t nfs 192.168.1.47/video /mnt
sudo -s mount -t nfs 192.168.1.47:video /mnt
cd /media/
ll
ls
ls -lrtha
cd /mnt
ll
cd sysimage/
ll
cd home/
ll
cd
ll
cd Euclide
 sudo mount -t cifs //192.168.1.47/video /media/mdrive -o user=statquant,pass=11Decembre82
 sudo mount -t cifs //192.168.1.47/video /media/ -o user=statquant,pass=11Decembre82
cd /media
ll
cd movie
ll
cd /media
ll
cd movie
sudo dnf update
ll
mv ../Star\ Wars\ Episode\ VII\ -\ The\ Force\ Awakens.mkv .
ll | grep Star
mv ../Star\ Wars\ Episode\ VII\ -\ The\ Force\ Awakens.mkv .
cp ../Star\ Wars\ Episode\ VII\ -\ The\ Force\ Awakens.mkv .
rm Star\ Wars\ Episode\ VII\ -\ The\ Force\ Awakens.mp4 
mv ../Star\ Wars\ Episode\ VII\ -\ The\ Force\ Awakens.mkv .
mv ../Star\ Wars\ Episode\ VII\ -\ The\ Force\ Awakens.mkv ./
mv ../"Star Wars Episode VII - The Force Awakens.mkv" .
mv "../Star Wars Episode VII - The Force Awakens.mkv" .
cd ..
ll
mv Star\ Wars\ Episode\ VII\ -\ The\ Force\ Awakens.mkv ./movie/
cd movie/
ll
cd Documents/
ll
vim HowToMountSharedDirOnNAS.txt
mkvinfo
ll
cd Scripts/
ll
git clone git://github.com/JakeWharton/mkvdts2ac3.git
ll
cd mkvdts2ac3/
ll
vim mkvdts2ac3.sh 
./mkvdts2ac3.sh --help
sudo dnf install mkvtoolnix
cd ~Download
cd ~/Downloads/
ll
cd films/
ll
rm Star\ Wars\ Episode\ VII\ -\ The\ Force\ Awakens.mp4 
ll
~/Scripts/mkvdts2ac3/mkvdts2ac3.sh -n Star\ Wars\ Episode\ VII\ -\ The\ Force\ Awakens.mkv 
mkvinfo
 sudo rpm -Uhv https://mkvtoolnix.download/fedora/bunkus-org-repo-2-3.noarch.rpm 
 sudo dnf install mkvtoolnix 
sudo dnf install mkvtoolnix-gui-9.1.0-1.fc23.x86_64 
mkvinfo
~/Scripts/mkvdts2ac3/mkvdts2ac3.sh -n Star\ Wars\ Episode\ VII\ -\ The\ Force\ Awakens.mkv 
cd /tmp
ll
rm -rf /tmp/*
duso dnf remove docky
sudo dnf remove docky
cd Downloads/films
ll
mkdir convert
ll
~/Scripts/mkvdts2ac3/mkvdts2ac3.sh -n --new -w ./convert/ Star\ Wars\ Episode\ VII\ -\ The\ Force\ Awakens.mkv 
cd /media/
ll
cd ~/Documents/
ll
vim HowToCOnvertDTSToAAC.txt
ffmpeg --help
# ffmpeg -i in.mkv -vcodec copy -acodec ac3 -ac 6 out.mkv
cat ~/Documents/HowToConvertMp4Clips.txt 
# ffmpeg -i in.mkv -vcodec copy -acodec ac3 -ac 6 out.mkv
cd ~/Downloads/films/
ll
ffmpeg -i Star\ Wars\ Episode\ VII\ -\ The\ Force\ Awakens\ -\ DTS.mkv -c:v libx264 -c:a libfaac Star\ Wars\ Episode\ VII\ -\ The\ Force\ Awakens.mp4
ll
ffmpeg -i Star\ Wars\ Episode\ VII\ -\ The\ Force\ Awakens\ -\ DTS.mkv -c copy -metadata:s:a:0 language=eng -c:a libfaac "Star Wars Episode VII - The Force Awakens.mp4"
$ cat ~/Documents/HowToConvertMp4Clips.txt 
cat ~/Documents/HowToConvertMp4Clips.txt 
for f in *.mp4; do  ffmpeg -i "${f%}" -f mp3 -ab 192000 -vn "${f%.*}".mp3;done
#for f in *.mp4; do  ffmpeg -i "${f%}" -f mp3 -ab 192000 -vn "${f%.*}".mp3;done
#for f in *.mkv; do  ffmpeg -i "${f%}" -f mp3 -ab 192000 -vn "${f%.*}".mp3;done
#ffmpeg -i Star\ Wars\ Episode\ VII\ -\ The\ Force\ Awakens\ -\ DTS.mkv -c copy -metadata:s:a:0 language=eng -c:a libfaac "Star Wars Episode VII - The Force Awakens.mp4"
#for f in *.mkv; do  ffmpeg -i "${f%}" -c copy "${f%.*}".mp4;done
#for f in *.mkv; do echo "${f%}";done
for f in *.mkv; do echo "${f%}";done
cd /media/movie/
for f in *.mkv; do echo "${f%}";done
for f in *.mkv; do  ffmpeg -i "${f%}" -c copy "${f%.*}".mp4;done
cd /media/movie/
ll
cd /media/movie/
cat ~/Documents/HowToConvertMp4Clips.txt 
#for f in *.mp4; do  ffmpeg -i "${f%}" -f mp3 -ab 192000 -vn "${f%.*}".mp3;done
for f in *.mkv; do  echo"${f%.*}";done
for f in *.mkv; do echo "${f%.*}";done
for f in *.mkv; do echo "${f%.*}"; echo "{f%}"; done
for f in *.mkv; do echo "${f%.*}"; echo "${f%}"; done
for f in *.mkv; do echo "Converting the following file: ${f%.*}"; echo "${f%}"; done
#for f in *.mkv; do echo "Converting the following file: ${f%.*}"; ffmeg -i "${f%}" -c copy "${%f}".mp4; done
for f in *.mkv; do echo "Converting the following file: ${f%.*}"; do echo "ffmeg -i ${f%} -c copy ${%f}.mp4"; done
for f in *.mkv; do echo "Converting the following file: ${f%.*}"; echo "ffmeg -i ${f%} -c copy ${%f}.mp4"; done
for f in *.mkv; do echo "Converting the following file: ${f%.*}"; echo "ffmeg -i ${f%} -c copy ${f%}.mp4"; done
for f in *.mkv; do echo "Converting the following file: ${f%.*}"; echo "ffmeg -i ${f%} -c copy ${f%.*}.mp4"; done
cd
cat ~/Documents/HowToMountSharedDirOnNAS.txt 
sudo mount -t cifs //192.168.1.47/video /media/ -o user=xxx,pass=xxx
sudo mount -t cifs //192.168.1.47/video /media/ -o user=statquant,pass=11Decembre82
cd /media/
ll
cd movie/
ll
rm Star\ Wars\ Episode\ VII\ -\ The\ Force\ Awakens.mkv 
ll
mv The.Intern.2015.720p.BRRip.x264.AAC-ETRG.mp4 The\ intern.mp4
ll
mv Les\ Tontons\ Flingueurs\ \[1963\]\ DvDrip\ FRA.avi Les\ Tontons\ Flingueurs.avi
ll
mv The\ Hobbit\:\ The\ Desolation\ of\ Smaug.mp4 The\ Hobbit\ -\ The\ Desolation\ of\ Smaug.mp4 
mv The\ Hobbit\:\ The\ Desolation\ of\ Smaug.mp4 The\ Hobbit\ \-\ The\ Desolation\ of\ Smaug.mp4 
ll
ll | grep *.mkv
ll *.mkv
cat ~/Documents/HowToConvertMp4Clips.txt 
ll
ps aux 
ps aux | grep  ff*
ps aux | grep  ff*meg
ll
rm Cyrano\ de\ Bergerac.mp4 
cat ~/Documents/HowToConvertMp4Clips.txt 
#for f in *.mp4; do  ffmpeg -i "${f%}" -f mp3 -ab 192000 -vn "${f%.*}".mp3;done
#for f in *.mkv; do  ffmpeg -i "${f%}" -c copy "${f%.*}".mp4;done
for f in *.mkv; do echo "${f%}";done
ffmeg -i Cyrano\ de\ Bergerac.mkv -c copy Cyrano\ de\ Bergerac.mp4
ffmpeg -i Cyrano\ de\ Bergerac.mkv -c copy Cyrano\ de\ Bergerac.mp4
htop
htop --sort-key 1
htop --sort-key 12
kill -9 firefox
ps  aux Z frep firefox
ps  aux | frep firefox
ps  aux | grep firefox
kill -9 5421
kill -9 5539
ps  aux | grep firefox
R
sudo dnf install medl
sudo dnf install meld
cd ~/CodeProjects/R/msCentralePortfolio/Report/
ll
vimdiff prez/prez.tex prez2/prez2.tex 
vimdiff report/report.tex reportbis/reportbis.tex
which nautilus
nautilus --version
which nemo
which caja
sudo dnf install python-nautilus
sudo dnf install "python-nautilus"
cd ~/Sources/
ll
cd nautilus-pyextensions-3.4.1/
ll
./nautilus-pyextensions 
dnf install gobject-introspection
sudo dnf install gobject-introspection
sudo dnf install gir1.2-gconf-2.0
./nautilus-pyextensions 
ll
cd ~/Sources/
ls
cd nautilus-pyextensions-3.4.1/
ll
./nautilus-pyextensions 
sudo dnf install notify-osd
xdg-user-dir TEMPLATES
cd /home/Templates
cd /home/statquant/Templates
touch New\ File
cd ~/Documents/
vim HowToAllowNewFileCreation.txt
cd ~/.local/share/nautilus/scripts/
ll
chmod 777 Test\ script 
ll
nautilus --help
ll
sudo -s
nautilus -q
chmod statquant Test\ script 
chown statquant Test\ script 
sudo -s 
ll
nautilus -q
nautilus --version
cd ~/Documents/
cd ~/Downloads/
ll
cd MISC_INTERNET/
ll
pdftk Umansky\ C\,\ Payslip\ 2016.pdf burst
sudo dnf install pdftk
pdftk
pdfseparate Umansky\ C\,\ Payslip\ 2016.pdf 
pdfseparate Umansky\ C\,\ Payslip\ 2016.pdf paysplip
pdfseparate Umansky\ C\,\ Payslip\ 2016.pdf paysplip*pdf
pdfseparate paysplips.pdf paysplip*pdf
    sudo yum install libgcj
man pdfseparate
qpdf 
man qpdf 
qpdf --help
qpdf --password=111282 paysplips.pdf 
qpdf --password=111282 paysplips.pdf output
ll
qpdf --password=111282 --decript paysplips.pdf output.pdf
qpdf --password=111282 --decrypt paysplips.pdf output.pdf
qpdf --password=111282 --decrypt --pages paysplips.pdf 1 output1.pdf 2 output2.pdf
qpdf --password=111282 --decrypt --linearize paysplips.pdf --pages paysplips.pdf 1-1 output1.pdf
qpdf --password=111282 --decrypt --linearize --pages paysplips.pdf 1-1 output1.pdf
qpdf --empty --pages paysplips.pdf 1-2 -- outfile.pdf
qpdf --password=111282 --decrypt --empty --pages paysplips.pdf 1-2 -- outfile.pdf
qpdf --empty --pages --password=111282 paysplips.pdf 1-2 -- outfile.pdf
qpdf --empty --pages paysplips.pdf 1-2 --password=111282 -- outfile.pdf
qpdf --empty --pages paysplips.pdf --password=111282 1-2 -- outfile.pdf
qpdf --empty --pages paysplips.pdf --password=111282 1-1 -- payslip1.pdf
qpdf --empty --pages paysplips.pdf --password=111282 2-2 -- payslip1.pdf
qpdf --empty --pages paysplips.pdf --password=111282 2-2 -- payslip2.pdf
qpdf --empty --pages paysplips.pdf --password=111282 1-1 -- payslip1.pdf
qpdf --empty --pages payslips.pdf --password=111282 1-1 -- payslip1.pdf
qpdf --empty --pages payslips.pdf --password=111282 2-2 -- payslip2.pdf
qpdf --empty --pages ./2016_p60.pdf --password=111282 2-2 -- 2016_p60.pdf 
qpdf --empty --pages ./2016_p60.pdf --password=111282 1-1 -- 2016_p60.pdf 
qpdf --empty --pages P60_2016.pdf --password=111282 1-1 -- 2016_p60.pdf 
mosek --version
R
which R
sudo dnf remove R-core
dnf upgrade R --enablerepo=updates-testing
sudo dnf upgrade R --enablerepo=updates-testing
sudo dnf remove R-core
sudo dnf install R-core
sudo dnf install R
sudo dnf upgrade R --enablerepo=updates-testing
sudo dnf clean packages 
sudo dnf upgrade R --enablerepo=updates-testing
R
mosek --version
R
tmux
which mosek
mosek --version
cd ~/Downloads/clips/
for f in *.mp4; do  ffmpeg -i "${f%}" -f mp3 -ab 192000 -vn "${f%.*}".mp3;done
cd Documents/
cat HowToConvertMp4Clips.txt 
cd ~/Documents/
vim HowToInstallWithoutCheck.txt
cat ~/Documents/
sudo dnf update --nogpgcheck
R
R --vanilla
mosek -f
tree -3 ~/Sources/mosek
tree -n 3 ~/Sources/mosek
tree -n 2 ~/Sources/mosek
tree -n 1 ~/Sources/mosek
man tree
tree -L 1 ~/Sources/mosek
tree -L 2 ~/Sources/mosek
tree -L 3 ~/Sources/mosek
mosek -f
tree -L 3 ~/Sources/mosek
mosek -f
which mosek
k
mosek -f
tree -L 3 ~/Sources/mosek
mosek -f
which mosudo dnf update
R
cd Documents/
ll
cat HowToSetupGithub.txt 
lpr HowToSetupGithub.txt
cd /home/.local/share
cd .local/share/nautilus/scripts/
ll
vim printAllFiles 
ll
./printAllFiles 
which lpr
ll
cp ~/Documents/HowToUpgradeROnFedora.txt .
ll
./printAllFiles HowToUpgradeROnFedora.txt 
cd ~/.local/share/nautilus/scripts/
ll
cat Test\ script 
cd Documents/
ll
dnf copr list
dnf copr list *
sudo dnf update
htop
cd CodeProjects/
ll
cd C==
cd C++
ll
mkdir armadillo
cd armadillo/
tmux vim
tmux
cd CodeProjects/C++/armadillo/
 g++ example.cpp -o example -O2 -larmadillo 
sudo dnf install armadillo
 g++ example.cpp -o example -O2 -larmadillo 
#cmake, openblas-devel, lapack-devel, arpack-devel, SuperLU-devel
g++
ll
 g++ example.cpp -o example -O2 -larmadillo 
sudo dnf remove armadillo
sudo dnf remove armadillo-devel
sudo dnf remove armadillo
#cmake, openblas-devel, lapack-devel, arpack-devel, SuperLU-devel
sudo dnf install cmake
sudo dnf install openblas-devel
#cmake, openblas-devel, lapack-devel, arpack-devel, SuperLU-devel
sudo dnf install lapack-devel
sudo dnf install arpack-devel
#cmake, openblas-devel, lapack-devel, arpack-devel, SuperLU-devel
sudo dnf install SuperLU-devel
yum install fedora-repos-rawhide
sudo dnf install fedora-repos-rawhide
dnf install --enablerepo rawhide armadillo
sudo dnf install --enablerepo rawhide armadillo
sudo dnf install /home/statquant/Sources/armadillo-7.100.3-2.fc25.src.rpm 
sudo dnf update
sudo dnf install /home/statquant/Sources/armadillo-7.100.3-2.fc25.src.rpm 
sudo dnf install /home/statquant/Sources/armadillo-7.100.3-2.fc25.x86_64.rpm 
sudo dnf install SuperLU
vim
cd Docum
cd ~/Documents/
ll
cd CodeProjects/C++
cd armadillo/
ll
tmux
vim
cd ~/CodeProjects/C++/armadillo/
ll
g++ ./example.cpp 
g++ ./example.cpp g++ example.cpp -o example -O2 -larmadillo
g++ ./example.cpp -o example -O2 -larmadillo
clang++ ./example.cpp 
clang++ ./example.cpp -larmadillo
find armadillo
locate armadillo
g++ ./example.cpp -o example -O2 -larmadillo
which R
/usr/bin/R --version
sudo dnf list R
sudo dnf remove R
sudo dnf install R
sudo dnf list R
sudo dnf install R
sudo dnf remove R
R
sudo dnf install R
R --vanilla
reset
R --vanilla
R
which R
R --vanilla
cd ~/Sources/
ll
sudo dnf install ./armadillo-7.100.3-2.fc25.x86_64.rpm 
sudo dnf install libsuperlu
sudo dnf install armadillo
which superlu
dnf install superLU-devel
sudo dnf install superLU-devel
sudo dnf install superLU
sudo dnf install SuperLU
sudo dnf list armadillo
dnf list armadillo
sudo dnf list armadillo
sudo dnf 
sudo dnf update-info armadillo
sudo dnf updateinfo armadillo
sudo dnf list armadillo
sudo dnf list armadillo*
    yum install --enablerepo rawhide armadillo
dnf install --enablerepo rawhide armadillo
sudo dnf install --enablerepo rawhide armadillo
sudo dnf install fedora-repos-rawhide
sudo dnf install --enablerepo rawhide armadillo
cat ~/Documents/HowToUpgradeROnFedora.txt 
cd ~/CodeProjects/R
ll
cd optimSP/
ll
vim optim.r
R --vanilla
g++ --version
vim ~/CodeProjects/R/optimSP/lo1.r 
R
sudo dnf install fedora-repos-rawhide
dnf update --enablerepo rawhide armadillo
sudo dnf update --enablerepo rawhide armadillo
g++ --version
R --vanilla
cat ~/CodeProjects/R/optimSP/lo1.r 
ll
cd ~/CodeProjects/C++
ll
cd armadillo/
ll
vim example.cpp
cd ~/CodeProjects/C++/armadillo/
g++ example.cpp -o example -O2 -larmadillo
ll
./example 
sudo dnf remove docky
sudo dnf install armadillo-devel
sudo dnf remove hplip
ls
ll
sudo dnf update
sudo gedit /etc/dnf/dnf.conf
cd ~/Documents/
gedit HowToRemoveOldKernels.txt
sudo dnf update
sudo dnf install wine
udo dnf install winetricks-20160109-2.1.noarch 
udo dnf install winetricks
sudo dnf install winetricks
which winetricks
/usr/bin/winetricks 
cd /home/statquant/.wine/
ll
cd drive_c/
ll
cd users/statquant/My\ Documents/
ll
cd My\ Digital\ Editions/
ll
cp Spin.epub /home/statquant/Calibre\ Library/
winetricks
winetricks adobe_diged
ll /home/statquant/.wine/
cd drive_c/
ll
cd users/
ll
cd statquant/
ll
cd My\ Documents/
ll
cd My\ Digital\ Editions/
ll
cd ../..
ll
cd ..
ll
cd statquant/
cd ../../..
ll
cd drive_c/
ll
ll Program\ Files\ \(x86\)/
wget http://download.epubee.com/ePUBeeePUBDRMRemoval.exe
ll
mv ePUBeeePUBDRMRemoval.exe ~/Sources/
ll ~/.local/share/wineprefixes/adobe_diged/
cd /home/statquant/
ll
cd ~/Sources/
ll
wine ./ePUBeeePUBDRMRemoval.exe 
winetricks
wine ePUBeeePUBDRMRemoval.exe
wine adobe_diged
winetricks adobe_diged
wine ePUBeeePUBDRMRemoval.exe
winetricks
winetricks ePUBeeePUBDRMRemoval.exe
wine control
cd ~/Desktop/
ll
vim ePUBee\ Magic.desktop 
sudo dnf update
sudo dnf updae
sudo dnf update
sudo dnf remove winetricks
sudo dnf remove wine
cd ~/Documents/
ll
cd Travail/
ll
cd ..
cd Administration/
cd Salaire/
cd 2016
ll
qpdf --empty --pages 20160506.pdf --password=111282 1-1 -- 201605_MS.pdf
ll
qpdf --empty --pages 20160506.pdf --password=111282 2-2 -- 201606_MS.pdf
ll
sudo dnf update
sudo dnf install testdisk
sudo photorec
cd ~
source .bash_profile
pwd
ll
cat .editR 
mkdir .dotfiles
cp /home/statquant/.bash/dotfiles/.bash_history .dotfiles/
unlink .bash_history
ln -s .dotfiles/.bash_history .bash_history
ll
ll .bash
mv .bash/* .dotfiles/
ll .bash/
cd .dotfiles/
ll
mv dotfiles/* .
rm -r dotfiles/
ll
cd ..
mv .vim/dotfiles/* .dotfiles/
mv .vim/dotfiles/.vim* .dotfiles
ll .vim/dotfiles/
rm -r .vim/dotfiles/
ll
ll .tmux
mv .tmux/dotfiles/.tmux.conf .dotfiles/
rm -r .tmux
mv .R/dotfiles/.R* .dotfiles/
ll .R
rm -r .R/dotfiles/
ll
ln -s .dotfiles/.bashrc .bashrc
unlink .bashrc; ln -s .dotfiles/.bashrc .bashrc
unlink .bash_history; ln -s .dotfiles/.bash_history .bash_history 
ll .dotfiles/
ll
ll .bash
rm -r .bash
ll .bash_history 
cat .bash_history 
ll
mv .viminfo .dotfiles/
diskll
ll
mv .bashrc .dotfiles/
mv .bash_profile .dotfiles/
ll
ln -s .dotfiles/.bashrc .bashrc
ln -s .dotfiles/.bash_profile .bash_profile
ll .dotfiles/
unlink .Rprofile; ln -s .dotfiles/.Rprofile .Rprofile 
unlink .Rhistory; ln -s .dotfiles/.Rhistory .Rhistory 
unlink .Renviron; ln -s .dotfiles/.Renviron .Renviron 
unlink .tmux.conf; ln -s .dotfiles/.tmux.conf .tmux.conf 
unlink .vimrc; ln -s .dotfiles/.vimrc .vimrc
unlink .vimrc_1; ln -s .dotfiles/.vimrc_1 .vimrc_1
unlink .vimrc_plugin; ln -s .dotfiles/.vimrc_plugin .vimrc_plugin 
ll
unlink .bash_logout; ln -s .dotfiles/.bash_logout .bash_logout 
mv .Xresources .dotfiles/
ln -s .dotfiles/.Xresources .Xresources
ll
cat .ICEauthority 
:q
ll
cat .ICAClient/
cat .gitconfig 
mv .gitconfig .dotfiles/
ln -s .dotfiles/.gitconfig .gitconfig
ll
ln -s .dotfiles/.viminfo .viminfo
ll
cd .dotfiles/
git init
git add .
git commit -m "first commit"
git remote add origin https://github.com/statquant/dotfiles.git
git push -u origin master
cd ~/CodeProjects/R/squarr
ll
git init
git add .
git commit -m "first commit"
git remote add origin https://github.com/statquant/squarr.git
git push -u origin master 
less ~/Documents/HowToSetupGithub.txt 
ll
sudo dnf update 
cd ~/Build/
ll
cd citrix/
ll
./wfica
./wfica ~/Dpw
./wfica ~/Downloads/launch.ica 
gvim
cd ~
cd .vim/bundle/
ll
cd fonts/
ll
cat install.
cat install.sh 
xset q
ll /etc/X11/fontpath.d/
./install.sh 
gvim
tree /home/statquant/.local/share/fonts
sudo dnf install powerline
sudo dnf install tmux-powerline
vim
exit
cd ~/Build/
ls
gedit
tmux
vim 
exit
vim ~/.bashrc 
vim ~/.tmux.conf 
vim ~/.bashrc 
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cd ~/.tmux
ll
vim ~/.tmux.conf 
tmux source ~/.tmux.conf
vim ~/.tmux.conf 
tmux source ~/.tmux.conf
vim ~/.tmux.conf 
tmux source ~/.tmux.conf
vim ~/.tmux.conf 
tmux source ~/.tmux.conf
vim ~/.tmux.conf 
tmux source ~/.tmux.conf
vim ~/.tmux.conf 
exit
#qwrwrbvqwer
#qerbqwer
#qerbqetjwrt
#qethrqweth
#qerhqe5h
#qerbqwer
#qerbqetjwrt
#colin rhvwlkrvlkwehgliuwgerlui
#qerbqetjwrt
 #colin rhvwlkrvlkwehgliuwgerlui
exit
vim
set-window-option -g mode-keys vi
bind k select-pane -U
bind -t vi-coy v begin-selection
#bind -t vi-coy v begin-selection
bind -t vi-coy v begin-selection
source "/usr/share/tmux/owerline.conf"
# htts://fedoramagazine.org/add-ower-terminal-owerline/
tmux ls
rg
er
qe
w
#erhqerhqearh
#etrnqeatrnqe
#qetqnetnnqetn
#qetnqetnwrst
#qethqetnqet
#qtnqrtmnwrsynwrs
#qetnwrytmwrymnwaetd
#tnwrtmwrsyngwrat
#rtnwrymwrsyngwr
#qethqetnqet
#qtnqrtmnwrsynwrs
#qetnwrytmwrymnwaetd
#tnwrtmwrsyngwrat
#rtnwrymwrsyngwr
#erhqerhqea
#etrnqeatrn
#qetqnetnnq
#qetnqetnwr
#qethqetnqe
which parcellite
su -s dnf install parcellite
dnf install parcellite
sudo -s dnf install parcellite
parcellite 
vim 
mv ~/test/vimAndTmuxPbs.txt ~/Documents/HowToCopyInVimTmux.txt
exit
reset
#' test if mosek is working correctly (moslty license) by running lo1
#' @examples
#' examples examples examples 
#' test if mosek is working correctly (moslty license) by running lo1
#' examples examples examples
xclip
xsel
Install package 'xsel' to provide command 'xsel'? [N/y] N
xclip
locate xclip
which xclipboard
sudo -s dnf install xclip
which xclipboard
which xclip
man xclip
 man xclip
 which xclipboard
clear
#qerhqethq
#qerhqeth
#qethqethqe
clear
#qerhqethq
#qerhqethqrhqer
#qerhqethqrhqerqerhqer
hqrhqerqerhqer
 #qerhqethqrhqerqerhqer
#bind -t vi-copy v begin-selection
sudo -s dnf remove parcellite
exit
gedit
tmux ls
vim --version
exit
tmux
reset
tmux source-file ~/.tmux.conf
tmux
exit
vim
exit
vim ~/.tmux.conf 
tmux fill session
tmux kill session
tmux kill-session
tmux
exit
