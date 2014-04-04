<?php

class vtdu_tplblocks extends oxAdminView
{

    protected $_tpl = 'vtdu_tplblocks.tpl';

    public function render()
    {
        parent::render();
        $cfg = oxRegistry::getConfig();



        return $this->_tpl;
    }

    public function getTplBlocks()
    {
        $ret = oxDb::getDb(oxDb::FETCH_MODE_ASSOC)->getAll("select * from oxtplblocks order by oxmodule asc");

        foreach($ret AS $key => $value)
        {
            $ret[$key] = (object) array_change_key_case($value);
        }
        //var_dump($ret);

        return $ret;
    }

}