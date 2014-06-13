<?php

class navigation_vtdu extends navigation_vtdu_parent
{

    public function render()
    {
        $ret = parent::render();

        //if (oxRegistry::getConfig()->getRequestParameter("ajax")) return "vtdu_ajax.tpl";
        return ($ret == "header.tpl") ? "header_vtdu.tpl" : $ret;
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
