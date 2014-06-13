<?php

    $sLangName = 'Deutsch';

    $css = '<style type="text/css">
    .groupExp {padding: 0; border: 1px solid #ff3600; margin-bottom: 10px;}
    .groupExp > div {padding: 0 !important;}
    .groupExp .exp a.rc,
    .groupExp a.rc { display: block; background:#ff3600; margin: 0; padding: 3px 5px;}
    .groupExp a.rc b { background: none; font-size: medium; color: #fff !important;}
    .groupExp dl { display: block !important; padding-left: 5px;}
    .groupExp dt input.txt { width: 400px !important}
    input.confinput {position: fixed; top: 20px; right: 70px; background: #008B2D; padding: 10px 30px; color: white; border: 1px solid black; cursor:pointer; font-size: 135%; }
    input.confinput:hover {background: #00AA00; }
    </style>';

    $aLang     = array(
        'charset'                              => 'UTF-8',
        // debug settings
        'SHOP_MODULE_GROUP_vtduDebug'          => $css.'Debug Options',
        'SHOP_MODULE_bShowCl'                  => 'aktive Klasse in der Console ausgeben',
        'SHOP_MODULE_bShowTpl'                 => 'aktives Template in der Console ausgeben',
        'SHOP_MODULE_bKeepBasket'              => 'Warenkorb nach der Bestellung nicht löschen',
        // log settings
        'SHOP_MODULE_GROUP_vtduExLog'          => 'Exception Log',
        'SHOP_MODULE_bExLog'                   => 'Exception Log anzeigen',
        'SHOP_MODULE_iExLog'                   => 'Anzahl der angezeigten Log-Einträge',
        'SHOP_MODULE_GROUP_vtduSrvErrLog'      => 'Webserver Error Log',
        'SHOP_MODULE_bSrvErrLog'               => 'Webserver Error Log anzeigen',
        'SHOP_MODULE_sSrvErrLog'               => 'Pfad zur Log Datei',
        'SHOP_MODULE_iSrvErrLog'               => 'Anzahl der angezeigten Log-Einträge',
        'SHOP_MODULE_GROUP_vtduSQLLog'         => 'Datenbank Error Log',
        'SHOP_MODULE_bSqlLog'                  => 'Mysql Log anzeigen',
        'SHOP_MODULE_sSqlLog'                  => 'Pfad zur Log Datei',
        'SHOP_MODULE_iSqlLog'                  => 'Anzahl der angezeigten Log-Einträge',
        'SHOP_MODULE_GROUP_vtduMailLog'        => 'Mail Error Log',
        'SHOP_MODULE_bMailLog'                 => 'Mail Log anzeigen',
        'SHOP_MODULE_sMailLog'                 => 'Pfad zur Log Datei',
        'SHOP_MODULE_iMailLog'                 => 'Anzahl der angezeigten Log-Einträge',
    );