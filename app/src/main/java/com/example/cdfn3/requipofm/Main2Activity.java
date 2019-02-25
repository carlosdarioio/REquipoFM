package com.example.cdfn3.requipofm;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.Toast;

public class Main2Activity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main2);

        Toast.makeText(getApplicationContext(),"Insertaria Datos y Regresaria",Toast.LENGTH_LONG).show();

        //Recibiendo datos
        Bundle bundle=getIntent().getExtras();
        //separando datos recibidos

        if(bundle!=null)
        {
            String tipo=bundle.getString("tipo","tipo vacio");
            String nombre=bundle.getString("nombre","nombre vacio");
            String ubicacion=bundle.getString("ubicacion","ubicacion vacio");
            String estado=bundle.getString("estado","estado vacio");

            //Mostrar datos en Toas(algo asi como un message.show pequeño en la parte de abajo)
            Toast.makeText(getApplicationContext(),"tipo: "+tipo+" age "+nombre+" ubicacion "+ubicacion+" estado "+estado,Toast.LENGTH_LONG).show();
        }


    }
}
