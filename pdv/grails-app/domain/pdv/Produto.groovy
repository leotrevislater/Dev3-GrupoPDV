package pdv

class Produto {

    static constraints = {
        descricao blank: false, nullable: false
        valor min: 0, nullable: false
        moeda nullable: false
    }

    String descricao

    BigDecimal valor

    Moeda moeda

}
