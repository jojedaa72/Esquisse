function trim(cadena) {
   return(ltrim(rtrim(cadena)));
}

function rtrim(cadena) {
   var i = cadena.length - 1;
   while ((cadena.charAt(i) == " ") || 
      (escape(cadena.charAt(i)) == "%0A") || 
      (escape(cadena.charAt(i)) == "%0D")){
      i--;
   }
   return(cadena.substr(0, i+1)); 
}

function ltrim(cadena) {
   var i = 0;
   while ((cadena.charAt(i) == " ") || 
      (escape(cadena.charAt(i)) == "%0A") || 
      (escape(cadena.charAt(i)) == "%0D")){
      i++;
   }
   return(cadena.substr(i)); 
}

function validar(){
   var foco = "";
   var falta = "";
   for (var i=0; i< (frmIngreso.length-1);i++){
      if (frmIngreso.elements[i].name.substring(0,3) != "hdn"){
         if (trim(frmIngreso.elements[i].value) == ""){
            falta = falta + "    " + frmIngreso.elements[i].name.substring(3)+"\n";
            if (foco == "")
               foco = frmIngreso.elements[i]
         }
      }
   }
   if (falta != ""){
      alert("Falta llenar los siguientes datos:\n"+falta);
      foco.focus()
      return false;
   }
   return true;
}

function validar_nota(){
   var foco2 = "";
   var cant = frmNotas.length-1;
   for (var z=0; z<cant; z++)
   {	
		if ((frmNotas.elements[z].name.substring(0,1) == "n") && (frmNotas.elements[z].value.length > 0))
		{	
			if ((trim(frmNotas.elements[z].value) < 0) || (trim(frmNotas.elements[z].value) > 20))
			{	foco2 = frmNotas.elements[z];       
				z = cant;
			}
		}
   }

   if (foco2 != ""){
      alert("Nota no admitida. \n Ingresar valores entre 0 y 20");
      foco2.focus()
      return false;
   }
   return true;
}