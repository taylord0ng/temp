# curl https://raw.githubusercontent.com/taylord0ng/temp/refs/heads/master/quil.sh|bash -

release_os="linux"
release_arch="amd64"
cd ~/ceremonyclient/node
# rm rm -rf node-*-$release_os-$release_arch*
# echo "... deleted node (binaries, dgst and sig) files from node folder"
files=$(curl https://releases.quilibrium.com/release | grep $release_os-$release_arch)
for file in $files; do
    version=$(echo "$file" | cut -d '-' -f 2)
    if ! test -f "./$file"; then
        curl "https://releases.quilibrium.com/$file" > "$file"
        echo "... downloaded $file"
    fi
done
chmod +x ./node-$version-$release_os-$release_arch
# cd ..
# echo "... download of required node files done"

# deleting qclient (binary, dgst and sig) files and re-download the same (but latest) required qclient files in the client folder
# echo "4. deleting qclient (binary, dgst and sig) files and re-download the same (but latest) required qclient files in the client folder..."
# cd ~/ceremonyclient/client
# rm rm -rf qclient*
echo "... deleted qclient (binaries, dgst and sig) files from node folder"
files=$(curl https://releases.quilibrium.com/qclient-release | grep $release_os-$release_arch)
for file in $files; do
    clientversion=$(echo "$file" | cut -d '-' -f 2)
    if ! test -f "./$file"; then
        curl "https://releases.quilibrium.com/$file" > "$file"
        echo "... downloaded $file"
    fi
done
chmod +x ./qclient-$clientversion-$release_os-$release_arch
cp ./qclient-$clientversion-$release_os-$release_arch ./qclient
# cd ..
echo node-$version-$release_os-$release_arch
echo qclient-$clientversion-$release_os-$release_arch
