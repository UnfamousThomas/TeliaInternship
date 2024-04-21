### Telia Praktika Koduülesanne


1. CLEAN.SH peaks töötama, kuigi vahepeal Windowsis jamas aga linxuis töötas. Eeldan et on okei. Üldine loogika tegelikult ainult üks command findiga.

2. Loodan et siin tagge vms ei pidanud lisama, muudatused uues branchis "muudatused".

3. ImagePullBackOff tähendab seda et K8s ei saa miskipärast imageit registrist kätte. Selle taga võivad olla erinevad põhjused, aga isiklikult alustaksin mina sellest et vaataksin kas image on õigesti kirjas (olgu see siis helm v muu deklaratsiooni fail).
Kui on õigesti kirjas siis kontrolli üle et repositooriumis on tolle versiooniga image olemas.

Kubernetes iga node tõmbab ise imageid alla, ehk vaata üle et iga node saaks repositooriumile ligi, et ei ole network probleeme.
Juhul kui ei kasuta avaliku repositooriumit siis kontrolli ka üle et oleme seadistanud Kuberneteses ligipääsu andmed privaatsele repositooriumile.

Avalikel repositooriumitel on tihti ka rate limitid, niiet peaks üle kontrollima et nendeni ei jõua.

Väga ebatavaline, aga on ka võimalik et keegi on seadistanud imagePullPolicy: Never ja siis Kubelet ei ürita ka imageit tõmmata.

See on kõrge taseme üle vaade, praktikas peaks alustama kõige tavalisemast:
kubectl describe pod PODINIMI

Seal tasuks vaadata Events sektsiooni, kus peaksid mingid täpsed sõnumid tulema, e.g Authorization failed jne. See peaks andma täpsema probleemi poole suuna.

