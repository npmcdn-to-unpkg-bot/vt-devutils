<?php

class devutilsoxviewconfig extends devutilsoxviewconfig_parent
{

    public function getSelfFncLink($fnc = '')
    {
        return $this->getSelfLink().'cl='.$this->getActiveClassName().'&fnc='.$fnc;
    }

    public function getVTdebugSetting( $sSetting = null )
    {
        switch ($sSetting)
        {
            case "bShowCl":
                return oxRegistry::getConfig()->getConfigParam( "bShowCl" );
                break;
            case "bShowTpl":
                return oxRegistry::getConfig()->getConfigParam( "bShowTpl" );
                break;
            case "bKeepBasket":
                return oxRegistry::getConfig()->getConfigParam( "bKeepBasket" );
                break;
        }

        return false;
    }
}
