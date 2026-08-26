var s=["Domingo","Segunda-Feira","Terça-Feira","Quarta-Feira","Quinta-Feira","Sexta-Feira","Sábado"];
var m=["Janeiro","Fevereiro","Março","Abril","Maio","Junho","Julho","Agosto","Setembro","Outubro","Novembro","Dezembro"];
var d=[31,28,31,30,31,30,31,31,30,31,30,31];

global.data[0]++;
global.data[1]=s[(array_get_index(s,global.data[1])+1)%7];
var i=array_get_index(m,global.data[3]);

if(global.data[0]>d[i]){
    global.data[0]=1;
    global.data[3]=m[(i+1)%12];
    if(i==11)global.data[4]++;
}

global.data[2]=string(global.data[0]);

messageArray = [
    "Os pássaros cantam.",
    "Hoje é outro dia.",
    "Suas costas doem.",
    "O cheiro de lama preenche suas narinas.",
    "Você se sente mais fraco.",
    "Os macacos da floresta encaram o fundo da sua alma.",
    "Uma picada de mosquito não para de coçar.",
    "Sua cabeça dói.",
    "Você teve um pesadelo noite passada.",
    "Você sente saudade de sua família.",
    "O seringal acorda.",
    "Parece que você sequer dormiu.",
    "Está tudo cada vez mais caro.",
    "A umidade parece ter entrado nos seus ossos.",
    "O café de hoje está mais fraco que o de ontem.",
    "Você conta os dias, mas eles parecem não passar.",
    "O silêncio da floresta parece pesado.",
    "Você sente que está sendo observado.",
    "O caminho parece mais longo hoje.",
    "O barulho dos insetos está ensurdecedor.",
    "Você limpa o suor do rosto e ele volta imediatamente.",
    "Seus pés estão cheios de lama.",
    "A borracha grudou nas suas mãos.",
    "Você sente falta de um banho quente.",
    "A comida parece ter menos gosto a cada dia.",
    "Você olha para o céu. As nuvens estão muito baixas.",
    "Uma mosca insiste em pousar no seu rosto.",
    "Você escuta galhos quebrando ao longe.",
    "Você tenta lembrar quando foi a última vez que dormiu bem.",
    "O cheiro da floresta está diferente hoje.",
    "Você sente uma coceira no braço. Não encontra nada.",
    "A chuva deixou o chão quase impossível de atravessar.",
    "O rádio está cheio de chiado.",
    "Por um instante, você acha que ouviu alguém chamar seu nome.",
    "Você olha para trás. Não há ninguém.",
    "Os mosquitos parecem especialmente agressivos hoje.",
    "Você começa a sentir fome antes mesmo do almoço.",
    "A floresta parece mais escura do que deveria.",
    "Você sente um arrepio, mesmo com o calor.",
    "Talvez seja melhor terminar o trabalho antes de escurecer.",
    "Você não sabe há quanto tempo está aqui.",
	"Medo."
];

messaged = messageArray[irandom(array_length(messageArray) - 1)];

dialogo = criar_dialogo([
$"Dia {global.dia}.\n{global.data[1]}, {global.data[2]} de {global.data[3]} de {global.data[4]}.",$"{messaged}\nHora do trabalho."], 0, 0, , , 0.2, 1);
