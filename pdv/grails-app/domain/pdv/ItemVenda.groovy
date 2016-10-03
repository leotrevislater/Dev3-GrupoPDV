package pdv

import static java.math.BigDecimal.ZERO

class ItemVenda {

    static constraints = {
        produto nullable: false
        quantidade min: 0, nullable: false
        valorDesconto min: 0, defaultValue: ZERO, nullable: false
    }

    Produto produto

    Integer quantidade

    BigDecimal valorDesconto

}
