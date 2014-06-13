<?php

class devutils_moduledata extends oxAdminView
{

    protected $_tpl = 'vt_devutils_moduledata.tpl';

    public function render()
    {
        parent::render();
        $cfg = oxRegistry::getConfig();



        return $this->_tpl;
    }

    public function getModuleEvents()
    {
        return oxRegistry::getConfig()->getConfigParam('aModuleEvents');
    }

    public function getModuleFiles()
    {
        return oxRegistry::getConfig()->getConfigParam('aModuleFiles');
    }

    public function getModuleTemplates()
    {
        return oxRegistry::getConfig()->getConfigParam('aModuleTemplates');
    }

    public function getTplBlocks()
    {
        $ret = oxDb::getDb(oxDb::FETCH_MODE_ASSOC)->getAll("select * from oxtplblocks order by oxmodule asc");

        if(!count($ret)) return false;

        $aBlocks = array();
        foreach($ret AS $value)
        {
            $block = (object) array_change_key_case($value);
            $aBlocks[$block->oxmodule][] = $block;
        }

        return $aBlocks;
    }

}