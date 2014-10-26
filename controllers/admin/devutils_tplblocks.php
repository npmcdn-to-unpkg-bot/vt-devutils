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
class devutils_tplblocks extends oxAdminView
{

    protected $_tpl = 'vt_devutils_tplblocks.tpl';

    public function render()
    {
        parent::render();
        $this->addTplParam( "aBlocks", $this->getTplBlocks());
        return $this->_tpl;
    }

    public function validateFile( $sFile, $sModule = false )
    {
        if (!pathinfo( $sFile, PATHINFO_EXTENSION )) $sFile .= ".php";

        $sFile = ( $sModule ) ? oxRegistry::get( "oxmodule" )->getModuleFullPath( $sModule ).$sFile : oxRegistry::getConfig()->getModulesDir().$sFile;

        return is_readable( $sFile );
    }

    public function getTplBlocks()
    {
        $ret = oxDb::getDb( oxDb::FETCH_MODE_ASSOC )->getAll( "select * from oxtplblocks order by oxtemplate asc" );
        if (!count( $ret )) return false;

        $aBlocks = array();
        foreach ($ret AS $block)
        {
            $block = (object) array_change_key_case( $block );
            $aBlocks[( $block->oxmodule )][] = $block;
        }
        return $aBlocks;
    }

    public function updateBlock()
    {

    }

    public function deleteBlock()
    {
        $cfg = oxRegistry::getConfig();
        $params = $cfg->getRequestParameter("editval");


    }
}