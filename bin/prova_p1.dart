import 'package:prova_p1/prova_p1.dart' as prova_p1;
import 'dart:math';
import 'dart:io';

void main() {
  print("\n***********************************************************");
  print('---->Bem-vindo ao Jogo!<----\n');
  bool jogarNovamente = true;

  while (jogarNovamente) {
    int vitoriasUsuario = 0;
    int vitoriasComputador = 0;
    int empates = 0;
    int dadoMagico = 0;

    int rodadas = int.parse(leitura('Quantas rodadas você deseja jogar? '));

    List<int> numerosDado = [1, 2, 3, 4, 5, 6];
    print("***********************************************************");

    List<List<int>> dadosUsuario = [];
    List<List<int>> dadosComputador = [];
    List<int> pontosRodadaUsuario = [];
    List<int> pontosRodadaComputador = [];

    for (int i = 1; i <= rodadas; i++) {
      print('\n--- Rodada $i ---\n');
      List<int> dadosUsuarioRodada = rolarDados(numerosDado);
      List<int> dadosComputadorRodada = rolarDados(numerosDado);

      dadosUsuario.add(dadosUsuarioRodada);
      dadosComputador.add(dadosComputadorRodada);

      int somaPontosUsuario = dadosUsuarioRodada.reduce((a, b) => a + b);
      int somaPontosComputador = dadosComputadorRodada.reduce((a, b) => a + b);

      pontosRodadaUsuario.add(somaPontosUsuario);
      pontosRodadaComputador.add(somaPontosComputador);

      print(
          '\nResultados dos dados do usuário: $dadosUsuarioRodada (Total: $somaPontosUsuario)');
      print(
          'Resultados dos dados do computador: $dadosComputadorRodada (Total: $somaPontosComputador)');

      if (dadoMagico < 1) {
        if (leitura('\nDeseja usar o dado mágico? (s/n): ').toLowerCase() ==
            's') {
          double teste = Random().nextDouble();
          if (teste < 0.5) {
            somaPontosUsuario = (somaPontosUsuario / 2).round();
            print(
                '\nA pontuação total do usuário foi reduzida pela metade! Nova pontuação: $somaPontosUsuario');
          } else {
            somaPontosUsuario = somaPontosUsuario * 2;
            print(
                '\nA pontuação total do usuário foi dobrada! Nova pontuação: $somaPontosUsuario');
          }
          dadoMagico++;
        }
      }

      if (somaPontosUsuario > somaPontosComputador) {
        print('\nVocê venceu a rodada!');
        vitoriasUsuario++;
      } else if (somaPontosComputador > somaPontosUsuario) {
        print('\nO computador venceu a rodada!');
        vitoriasComputador++;
      } else {
        print('\nEmpate na rodada!');
        empates++;
      }
      print('---------------------------------------------------------');
    }
    print('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
    print('\n--- Resultados finais ---');
    print('Vitórias do usuário: $vitoriasUsuario');
    print('Vitórias do computador: $vitoriasComputador');
    print('Empates: $empates');

    if (vitoriasUsuario > vitoriasComputador) {
      print('\nParabéns, você venceu o jogo!');
    } else if (vitoriasComputador > vitoriasUsuario) {
      print('\nO computador venceu o jogo!');
    } else {
      print('\nO jogo terminou em empate!');
    }

    for (int i = 0; i < rodadas; i++) {
      print('\n--- Rodada ${i + 1} ---');
      print('Resultados dos dados do usuário: ${dadosUsuario[i]} ');
      print('Resultados dos dados do computador: ${dadosComputador[i]} ');
      print(
          '-----------------------------------------------------------------');
    }
    print('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');

    String jogarNovamenteInput =
        leitura('\nDeseja jogar novamente? (s/n): ').toLowerCase();
    jogarNovamente = jogarNovamenteInput == 's';
  }
  print("***********************************************************");
  print('Obrigado por jogar!\n');
}

List<int> rolarDados(List<int> numerosDado) {
  Random random = Random();
  return [
    numerosDado[random.nextInt(6)],
    numerosDado[random.nextInt(6)],
    numerosDado[random.nextInt(6)]
  ];
}

String leitura(String prompt) {
  print(prompt);
  return stdin.readLineSync()!;
}
