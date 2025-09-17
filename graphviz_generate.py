
print('''digraph G {
	ranksep=3
	splines="false"
''')
with open("./mapa.tsv") as mapa:
    mapa = mapa.read()
    mapa = map(lambda x: x.split('\t'), mapa.strip().split('\n'))
    mapa = list(filter(lambda x: len(x)>1, mapa))
    for device in mapa:
        desc= "" if len(device)<4 else f":{device[3]}"
        if device[2] == "?":
            continue
        if device[2] in ["Kamera", "Kamery", "AP"]:
            device[2] = f"Kamera {device[3]}"
        print(f'\t"{device[0]}" -> "{device[2]}"')
print("}")
