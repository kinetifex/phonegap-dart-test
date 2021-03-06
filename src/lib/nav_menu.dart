// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library nav_menu;

import 'dart:html';
import 'package:hybrid_dart_test/router.dart';

bool _menuOpen = false;

initNavMenu() {
    var navdrawerContainer = querySelector('.navdrawer-container');
    var appbarElement = querySelector('.app-bar');
    var menuBtn = querySelector('.menu');
    var main = querySelector('main');

    closeMenu(Event evt) {
        if( !_menuOpen ) return;
        document.body.classes.remove('open');
        appbarElement.classes.remove('open');
        navdrawerContainer.classes.remove('open');
        _menuOpen = false;
    }

    toggleMenu(Event evt) {
        if( _menuOpen ) return;
        document.body.classes.toggle('open');
        appbarElement.classes.toggle('open');
        navdrawerContainer.classes.toggle('open');
        navdrawerContainer.classes.add('opened');
        _menuOpen = true;
    }

    main
        ..onClick.listen(closeMenu)
        ..onTouchStart.listen(closeMenu);
    menuBtn
        ..onClick.listen(toggleMenu)
        ..onTouchStart.listen(toggleMenu);
    navdrawerContainer
        ..onClick.listen((event) {
        if (event.target.nodeName == 'A' || event.target.nodeName == 'LI') {
            closeMenu(event);
        }
    })
        ..onTouchStart.listen((event) {
        if (event.target.nodeName == 'A' || event.target.nodeName == 'LI') {
            closeMenu(event);
        }
        if(event.target is AnchorElement){
            var href = (event.target as AnchorElement).getAttribute("href");
            router.gotoUrl(href);
        }
    });

    document.body
        ..onTouchStart.listen((evt){

            /// If touch target is a input element, set it to be the focus
            if (evt.target is InputElement || evt.target is TextAreaElement) {
                (evt.target as HtmlElement).focus();
            }

            evt.stopPropagation();
            evt.preventDefault();
    });
}
