package pdv

import java.time.LocalDate

import static java.lang.Boolean.FALSE

class Venda {

    static constraints = {
        dataVenda nullable: false
        itens minSize: 1, nullable: false
        formaPagamento nullable: false
        isPreVenda defaultValue: FALSE, nullable: false
    }

    LocalDate dataVenda

    List<ItemVenda> itens

    FormaPagamento formaPagamento

    Boolean isPreVenda

}
