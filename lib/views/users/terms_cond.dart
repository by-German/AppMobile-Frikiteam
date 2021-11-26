import 'package:flutter/material.dart';

class TermsCond extends StatelessWidget {
  const TermsCond({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Terms and conditions"), backgroundColor: Colors.deepPurple,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _title(text: "INFORMACIÓN RELEVANTE"),
            _content(text: "Es requisito necesario para la adquisición de los productos que se ofrecen en este sitio, que lea y acepte los siguientes Términos y Condiciones que a continuación se redactan. El uso de nuestros servicios así como la compra de nuestros productos implicará que usted ha leído y aceptado los Términos y Condiciones de Uso en el presente documento. Todas los productos  que son ofrecidos por nuestra app pudieran ser creadas, cobradas, enviadas o presentadas por una app o web tercera y en tal caso estarían sujetas a sus propios Términos y Condiciones. En algunos casos, para adquirir un producto, será necesario el registro por parte del usuario, con ingreso de datos personales fidedignos y definición de una contraseña."),
            _content(text: "El usuario puede elegir y cambiar la clave para su acceso de administración de la cuenta en cualquier momento, en caso de que se haya registrado y que sea necesario para la compra de alguno de nuestros productos. findevents no asume la responsabilidad en caso de que entregue dicha clave a terceros."),
            _content(text: "Todas las compras y transacciones que se lleven a cabo por medio de esta app, están sujetas a un proceso de confirmación y verificación, el cual podría incluir la verificación del stock y disponibilidad de producto, validación de la forma de pago, validación de la factura (en caso de existir) y el cumplimiento de las condiciones requeridas por el medio de pago seleccionado. En algunos casos puede que se requiera una verificación por medio de correo electrónico."),
            _content(text: "Los precios de los productos ofrecidos en esta Tienda Online es válido solamente en las compras realizadas en este sitio web."),
            _title(text: "LICENCIA"),
            _content(text: "frikiteam  a través de su app concede una licencia para que los usuarios utilicen  los productos y servicios que son vendidos en este sitio web de acuerdo a los Términos y Condiciones que se describen en este documento."),
            _title(text: "USO NO AUTORIZADO"),
            _content(text: "En caso de que aplique (para venta de software, templetes, u otro producto de diseño y programación) usted no puede colocar uno de nuestros productos, modificado o sin modificar, en un CD, sitio web o ningún otro medio y ofrecerlos para la redistribución o la reventa de ningún tipo."),
            _title(text: "PROPIEDAD"),
            _content(text: "Usted no puede declarar propiedad intelectual o exclusiva a ninguno de nuestros productos, modificado o sin modificar. Todos los productos son propiedad  de los proveedores del contenido. En caso de que no se especifique lo contrario, nuestros productos se proporcionan  sin ningún tipo de garantía, expresa o implícita. En ningún esta compañía será  responsables de ningún daño incluyendo, pero no limitado a, daños directos, indirectos, especiales, fortuitos o consecuentes u otras pérdidas resultantes del uso o de la imposibilidad de utilizar nuestros productos."),
            _title(text: "COMPROBACIÓN ANTIFRAUDE"),
            _content(text: "La compra del cliente puede ser aplazada para la comprobación antifraude. También puede ser suspendida por más tiempo para una investigación más rigurosa, para evitar transacciones fraudulentas."),
            _title(text: "PRIVACIDAD"),
            _content(text: "Frikiteam garantiza que la información personal que usted envía cuenta con la seguridad necesaria. Los datos ingresados por usuario o en el caso de requerir una validación de los pedidos no serán entregados a terceros, salvo que deba ser revelada en cumplimiento a una orden judicial o requerimientos legales."),
            _content(text: "Frikiteam reserva los derechos de cambiar o de modificar estos términos sin previo aviso."),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }

  Widget _title({required String text}) => Center(
    child: Container(
      padding: EdgeInsets.only(top: 20, bottom: 10),
      child: Text(text, style: TextStyle(
        fontSize: 20, 
        fontWeight: FontWeight.bold
      ),)
      )
    );

  _content({required String text}) => Container(
    padding: EdgeInsets.all(10),
    child: Text(
      text, 
      style: TextStyle(fontSize: 15,),
      textAlign: TextAlign.justify, 
    ),
  );

}
