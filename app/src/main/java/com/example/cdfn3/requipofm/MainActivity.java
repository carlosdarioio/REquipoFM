package com.example.cdfn3.requipofm;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.Button;
import android.widget.GridView;
import android.widget.ListAdapter;
import android.widget.Spinner;
import android.widget.TabHost;
import android.widget.TextView;

import org.w3c.dom.Text;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {
    private Button btnShow;
    private Spinner tipo;
    private TextView nombre;
    private Spinner ubicacion;
    private Spinner estado;
    private TabHost tabHost;



    static final String[] numbers = new String[] {
            "PC", "LNOVO", "025", "NUEVO",
            "MONI", "MOT", "045", "MAL ESTADO",
            "TECL", "WEI", "002", "USADO",
            "IMPR", "LINK", "053", "VIEJO",
            "PC", "GO", "053", "VIEJO",
            "PC", "LNOVO", "007", "USADO"};


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        tabHost=(TabHost)findViewById(R.id.tabHostMenu);
        tabHost.setup();
        newTab("tab1",R.id.Registro,"Registros");
        newTab("tab2",R.id.Lista,"Listas");
        tabHost.setCurrentTab(0);

        btnShow=(Button)findViewById(R.id.btnShow);
        tipo=(Spinner)findViewById(R.id.Tipo);
        nombre=(TextView) findViewById(R.id.Nombre);
        ubicacion=(Spinner)findViewById(R.id.ubicacion);
        estado=(Spinner)findViewById(R.id.estado);
        //gridlista=(GridView)findViewById(R.id.GridLista);

        final GridView grid = (GridView) findViewById(R.id.GridLista);



        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this,
        android.R.layout.simple_list_item_1, numbers);
       grid.setAdapter(adapter);








        btnShow.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                //Enviar datos entre actiivty
                Intent intent = new Intent(MainActivity.this,Main2Activity.class);
                intent.putExtra("tipo",tipo.getSelectedItem().toString());
                intent.putExtra("nombre",nombre.getText().toString());
                intent.putExtra("ubicacion",ubicacion.getSelectedItem().toString());
                intent.putExtra("estado",estado.getSelectedItem().toString());
                startActivity(intent);


            }
        });



    }

    private void newTab(String tag,int idContent,String title){
        TabHost.TabSpec spec = tabHost.newTabSpec(tag);
        spec.setContent(idContent);
        spec.setIndicator(title);
        tabHost.addTab(spec);


    }



}
