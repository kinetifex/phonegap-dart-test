
library app_router;

import "dart:html" show querySelector;
import 'package:route_hierarchical/client.dart';



void showAbout(RouteEvent e) {
    // Extremely simple and non-scalable way to show different views.
    querySelector('#home').style.display = 'none';
    querySelector('#about').style.display = '';
}

void showHome(RouteEvent e) {
    querySelector('#home').style.display = '';
    querySelector('#about').style.display = 'none';
}

// Webapps need routing to listen for changes to the URL.
final Router router = new Router();

void initRoutes(){
    router.root
        ..addRoute(name:'about', path: '/about', enter: showAbout)
        ..addRoute(name:'home',  path: '/', defaultRoute: true, enter: showHome);

    router.listen();
}