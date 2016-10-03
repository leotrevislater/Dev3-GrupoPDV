package pdv

import org.springframework.context.MessageSourceResolvable

/**
 * Created by Jackelyn on 10/2/2016.
 */
enum Moeda implements MessageSourceResolvable {

    REAL('BRL')

    String id

    private Moeda(String id) {
        this.id = id
    }

    @Override
    String[] getCodes() {
        return [ "moeda.${name().toLowerCase()}" ]
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