package sintactico;

public enum Errores_Syntax {

    RETORNO_FUNCION("No se esperaba" );

    private String descripcion;
    private String numLinea;
    private String numColumna;

    Errores_Syntax(String pDescripcion)
    {
        this.descripcion = pDescripcion;
    }

    public String getDescripcion()
    {
        return this.descripcion;
    }
}
