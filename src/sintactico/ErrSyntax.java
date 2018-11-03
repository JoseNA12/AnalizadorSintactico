package sintactico;

public enum ErrSyntax {

    RETORNO_FUNCION("No se esperaba " );

    private String descripcion;
    private String numLinea;
    private String numColumna;

    ErrSyntax(String pDescripcion)
    {
        this.descripcion = pDescripcion;
    }

    public String getDescripcion()
    {
        return this.descripcion;
    }
}
