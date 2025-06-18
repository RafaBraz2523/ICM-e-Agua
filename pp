<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>Calculadora de IMC e Água Diária</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #f0f4f8;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }

    .container {
      background: white;
      padding: 30px;
      border-radius: 15px;
      box-shadow: 0 0 15px rgba(0,0,0,0.1);
      max-width: 400px;
      width: 100%;
    }

    h1 {
      text-align: center;
      margin-bottom: 20px;
    }

    label {
      display: block;
      margin-top: 15px;
    }

    input {
      width: 100%;
      padding: 10px;
      margin-top: 5px;
      border-radius: 8px;
      border: 1px solid #ccc;
    }

    button {
      margin-top: 20px;
      width: 100%;
      padding: 12px;
      background: #007bff;
      color: white;
      border: none;
      border-radius: 8px;
      font-size: 16px;
      cursor: pointer;
    }

    button:hover {
      background: #0056b3;
    }

    .resultado {
      margin-top: 20px;
      padding: 15px;
      background: #f8f9fa;
      border-radius: 10px;
      border: 1px solid #ddd;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>IMC e Água Ideal</h1>
    <label for="peso">Peso (kg):</label>
    <input type="number" id="peso" placeholder="Ex: 70">

    <label for="altura">Altura (cm):</label>
    <input type="number" id="altura" placeholder="Ex: 170">

    <button onclick="calcular()">Calcular</button>

    <div class="resultado" id="resultado"></div>
  </div>

  <script>
    function calcular() {
      const peso = parseFloat(document.getElementById("peso").value);
      const alturaCm = parseFloat(document.getElementById("altura").value);

      if (isNaN(peso) || isNaN(alturaCm) || peso <= 0 || alturaCm <= 0) {
        alert("Por favor, insira valores válidos para peso e altura.");
        return;
      }

      const alturaM = alturaCm / 100;
      const imc = peso / (alturaM * alturaM);
      const aguaMl = peso * 35;

      let classificacao = "";
      let recomendacao = "";

      if (imc < 18.5) {
        classificacao = "Abaixo do peso";
        recomendacao = "📌 Considere aumentar a ingestão calórica com acompanhamento nutricional. Verifique possíveis causas com um médico.";
      } else if (imc < 24.9) {
        classificacao = "Peso normal";
        recomendacao = "✅ Parabéns! Mantenha hábitos saudáveis com alimentação balanceada e atividade física regular.";
      } else if (imc < 29.9) {
        classificacao = "Sobrepeso";
        recomendacao = "⚠️ Reveja sua dieta e inicie uma rotina leve de exercícios. Pequenas mudanças fazem grande diferença!";
      } else if (imc < 34.9) {
        classificacao = "Obesidade grau 1";
        recomendacao = "❗ Procure um profissional de saúde. Reeducação alimentar e atividades físicas são essenciais.";
      } else if (imc < 39.9) {
        classificacao = "Obesidade grau 2";
        recomendacao = "🚨 Busque apoio médico e nutricional. Adotar um plano de saúde individualizado é essencial.";
      } else {
        classificacao = "Obesidade grau 3";
        recomendacao = "🛑 Situação crítica. Procure orientação médica urgente para reduzir riscos graves à saúde.";
      }

      const resultado = `
        <strong>IMC:</strong> ${imc.toFixed(2)} (${classificacao})<br>
        <strong>Água ideal por dia:</strong> ${aguaMl.toFixed(0)} ml (${(aguaMl / 1000).toFixed(2)} litros)<br><br>
        <strong>Dica de Saúde:</strong><br>${recomendacao}
      `;

      document.getElementById("resultado").innerHTML = resultado;
    }
  </script>
</body>
</html>
