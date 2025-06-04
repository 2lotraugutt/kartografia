
print('''digraph G {
	ranksep=3
	ratio=autio
''')
with open("./mapa.tsv") as mapa:
    mapa = mapa.read()
    mapa = map(lambda x: x.split('\t'), mapa.strip().split('\n'))
    mapa = list(filter(lambda x: len(x)>1, mapa))
    for device in mapa:
        desc= "" if len(device)<4 else f":{device[3]}"
        if device[2] == "Kamera" or device[2] == "Kamery":
            device[2] = f"Kamera {device[3]}"
        print(f'"{device[0]}" -> "{device[2]}" [label="{device[1]}{desc}"]')
print("}")
