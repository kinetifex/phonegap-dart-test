import "dart:html" as html;
import 'package:rikulo_gap/device.dart';




void initDevice() {
    var initOutput = html.querySelector("#inialize-output")
        ..text = "initializing";
    Device.init()
    ..then((device) {
        initOutput.text = "success";
        var parentElement = html.querySelector("#deviceready-dart");
        var listeningElement = parentElement.querySelector(".listening")
            ..setAttribute('style', 'display:none;');
        var receivedElement = parentElement.querySelector(".received")
            ..setAttribute('style', 'display:block;');
    })
    ..catchError((e){
        initOutput.text = "error";
        print("$e");
    });
}

/*
var app = {
    // Application Constructor
    initialize: function() {
        this.bindEvents();
    },
    // Bind Event Listeners
    //
    // Bind any events that are required on startup. Common events are:
    // 'load', 'deviceready', 'offline', and 'online'.
    bindEvents: function() {
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },
    // deviceready Event Handler
    //
    // The scope of 'this' is the event. In order to call the 'receivedEvent'
    // function, we must explicitly call 'app.receivedEvent(...);'
    onDeviceReady: function() {
        app.receivedEvent('deviceready');
    },
    // Update DOM on a Received Event
    receivedEvent: function(id) {
        var parentElement = document.getElementById(id);
        var listeningElement = parentElement.querySelector('.listening');
        var receivedElement = parentElement.querySelector('.received');

        listeningElement.setAttribute('style', 'display:none;');
        receivedElement.setAttribute('style', 'display:block;');

        console.log('Received Event: ' + id);
    }
};
*/