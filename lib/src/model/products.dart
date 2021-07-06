import 'package:market_easy/src/model/message.dart';

class Products {
  final String? code;
  final String? description;
  final String? unitValue;
  final String? barCode;

  Products(this.code, this.description, this.unitValue, this.barCode);

  Products.fromJson(Map<String, dynamic> json)
      : code = json["Codigo"] ?? "",
        description = json["Descricao"] ?? "",
        unitValue = json["Preco"] ?? "",
        barCode = json["CodigoBarras"] ?? "";
}


/* codigoInterno: Deve receber o valor "Codigo" do produto da API.
  descricao: Deve receber o valor "Descricao" do produto da API.
  valorUnitario: Deve receber o valor "Preco" do produto da API.
  codigoBarras: Deve receber o valor "CodigoBarras" do produto da API. */


/* {
  "response": {
    "status": "ok",
    "messages": [
      {
        "message": "Dados carregados"
      }
    ],
    "produtos": [
      {
        "Codigo": 10162,
        "SKU": 10162,
        "CodigoBarras": "0000040084107",
        "CodigoNCM": "18069000",
        "Descricao": "Kinder Ovo",
        "Complemento": "",
        "Marca": "Dorizon",
        "Estoque": 0.0,
        "Preco": 3.89,
        "Grupo": "10000",
        "Oferta": "N",
        "DataOferta": "",
        "PrecoNormal": 0.0,
        "CodigoUnidade": "001",
        "CodigoDepartamento": "999",
        "Departamento": "Geral",
        "Ativo": true,
        "CodigoTributario": "905",
        "Estoque1": -873.0,
        "Estoque2": 0.0,
        "Estoque3": 0.0,
        "Estoque4": 0.0,
        "Estoque5": 0.0,
        "PrecoLista": 0.0,
        "PrecoPDV": 3.89,
        "PrecoPDV3": 0.0,
        "PrecoPDV4": 0.0,
        "PrecoPDV5": 0.0,
        "PrecoEtiqueta": 3.89,
        "PrecoCartaz": 0.0,
        "PrecoVenda2": 0.0,
        "PrecoVenda3": 0.0,
        "PrecoVenda4": 0.0,
        "PrecoVenda5": 0.0,
        "FatorPr3": 0,
        "FatorPr4": 0,
        "FatorPr5": 0,
        "CodEstoque": 0,
        "EstoqueMinimo": 0.0,
        "EstoqueMaximo": 0.0,
        "VendaMediaDiaria": 0.0,
        "Espaco": 0,
        "CodigoCaixa": "",
        "CustoCompra": 76.3639,
        "CustoEmpresa": 76.3639,
        "CustoFiscal": 76.3639,
        "CustoMedio": 76.3639,
        "CustoTranferencia": 76.3639,
        "SetorLoja": "",
        "SetorDeposito": "",
        "PrecoUnidadeMedida": 0.0,
        "DescricaoPDV": "Kinder Ovo",
        "Bloqueado": false,
        "Altura": 0,
        "Largura": 0,
        "Profundidade": 0,
        "Peso": 0.0,
        "PesoLiquido": 0.0,
        "DescricaoCliente": "",
        "Temperatura": 0.0,
        "TipoEmbalagem": "UN",
        "QuantidadeEmbalagem": 0
      }, ...
    ]
  }
} */