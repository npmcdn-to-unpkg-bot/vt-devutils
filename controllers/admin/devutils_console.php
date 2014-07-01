<?php

/** The MIT License (MIT)
 *  vt Dev Utils
 *  Copyright (C) 2014  Marat Bedoev
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 */
class devutils_console extends oxAdminView
{

    protected $_tpl = 'vt_devutils_console.tpl';

    public function init()
    {
        parent::init();

    }

    public function render()
    {
        parent::render();

        return $this->_tpl;
    }

    public function doTest()
    {
        $cfg = oxRegistry::get("oxConfig");
        $code = $cfg->getParameter("codeinput");
        $this->_aViewData["codeinput"] = $code;

        $me = $user = oxRegistry::getConfig()->getUser();
        $session = $user->getSession();
        $order = array_shift($user->getOrders(1)->getArray());
        $basket = $user->getSession()->getBasket();

        $c = (class_exists("blCopernicaApi")) ? oxRegistry::get("blCopernicaApi") : false;

        $fnc = function($code) use ($cfg, $me,$session,$order,$basket,$c) {
            return eval($code);
        };

        ob_start();
        $this->addTplParam("codeerror", $fnc($code));
        $this->addTplParam("codeoutput",ob_get_clean());


    }

}