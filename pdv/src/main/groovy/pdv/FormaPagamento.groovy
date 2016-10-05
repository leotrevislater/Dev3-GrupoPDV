package pdv

import org.springframework.context.MessageSourceResolvable

/**
 * Created by Jackelyn on 10/2/2016.
 */
enum FormaPagamento implements MessageSourceResolvable {

    DEBITO('DB')

    private String id

    private FormaPagamento(String id) {
        this.id = id
    }


    @Override
    String[] getCodes() {
        return [ "forma-pagamento.${name().toLowerCase()}" ]
    }

    @Override
    Object[] getArguments() {
        return new Object[0]
    }

    @Override
    String getDefaultMessage() {
        return name()
    }
}