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

class devutilsnavigation extends devutilsnavigation_parent
{

    public function render()
    {
        $ret = parent::render();

        //if (oxRegistry::getConfig()->getRequestParameter("ajax")) return "vtdu_ajax.tpl";
        return ($ret == "header.tpl") ? "vt_devutils_admin_header.tpl" : $ret;
    }

    public function getDebugSettings()
    {
        $vtdu = oxRegistry::get("vtdu");

        return $vtdu->getDebugSettings();
    }


    public function clearTmp()
    {
        $vtdu = oxRegistry::get("vtdu");
        $this->addTplParam("content", $vtdu->clearTmp());
    }

    public function clearTpl()
    {
        $vtdu = oxRegistry::get("vtdu");
        $this->addTplParam("content", $vtdu->clearTpl());
    }

    public function clearPhp()
    {
        $vtdu = oxRegistry::get("vtdu");
        $this->addTplParam("content", $vtdu->clearPhp());
    }

    public function clearLang()
    {
        oxRegistry::get("oxUtils")->resetLanguageCache();
        $this->addTplParam("content", "lang cache clear!");
    }

    public function toggleDebugSetting()
    {
        $cfg      = oxRegistry::getConfig();
        $vtdu     = oxRegistry::get("vtdu");
        $sVarName = $cfg->getRequestParameter("setting");
        $this->addTplParam("content", $vtdu->toggleDebugSetting($sVarName));
    }

    public function setDebugLvl()
    {
        $cfg = oxRegistry::getConfig();
        //$iDebug = intval($cfg->getRequestParameter("vtdebuglvl"));
        $iDebug = 7;

        $sCustConfig = getShopBasePath() . '/cust_config.inc.php';

        if (file_exists($sCustConfig) && is_readable($sCustConfig))
        {
            include $sCustConfig;
            $sData = '$this->iDebug = ' . $iDebug . ';';
            file_put_contents($sCustConfig, $sData, FILE_APPEND | LOCK_EX);
        }
        else
        {

            $sData = '<?php $this->iDebug = ' . $iDebug . ';';
            file_put_contents($sCustConfig, $sData);
        }

        $this->cleartmp();
    }

}
