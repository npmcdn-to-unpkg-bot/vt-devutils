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
class devutils_moduledata extends oxAdminView
{

    protected $_tpl = 'vt_devutils_moduledata.tpl';

    public function render()
    {
        parent::render();
        //$cfg = oxRegistry::getConfig();
        $this->addTplParam( "aExtensions", $this->getModuleExtensions() );
        $this->addTplParam( "aFiles", $this->getModuleFiles() );
        $this->addTplParam( "aTemplates", $this->getModuleTemplates() );

        $aBlocks = $this->getTplBlocks();
        $aBlocksByModule = array();
        if ($aBlocks)
        {
            foreach ($aBlocks AS $block)
            {
                $aBlocksByModule[( $block->oxmodule )][] = $block;
            }
        }
        $this->addTplParam( "aBlocks", $aBlocks );
        $this->addTplParam( "aBlocksByModule", $aBlocksByModule );

        $this->addTplParam( "aEvents", $this->getModuleEvents() );


        return $this->_tpl;
    }

    public function validateFile( $sFile, $sModule = false )
    {
        if (!pathinfo( $sFile, PATHINFO_EXTENSION )) $sFile .= ".php";

        $sFile = ( $sModule ) ? oxRegistry::get( "oxmodule" )->getModuleFullPath( $sModule ).$sFile : oxRegistry::getConfig()->getModulesDir().$sFile;

        return is_readable( $sFile );
    }

    public function getModuleExtensions()
    {
        return oxRegistry::getConfig()->getModulesWithExtendedClass();
    }

    public function getModuleFiles()
    {
        return oxRegistry::getConfig()->getConfigParam( 'aModuleFiles' );
    }

    public function getModuleTemplates()
    {
        return oxRegistry::getConfig()->getConfigParam( 'aModuleTemplates' );
    }

    public function getTplBlocks()
    {
        $ret = oxDb::getDb( oxDb::FETCH_MODE_ASSOC )->getAll( "select * from oxtplblocks order by oxtemplate asc" );
        if (!count( $ret )) return false;

        $aBlocks = array();
        foreach ($ret AS $block)
        {
            $aBlocks[] = (object) array_change_key_case( $block );
        }
        return $aBlocks;
    }

    public function getModuleEvents()
    {
        return oxRegistry::getConfig()->getConfigParam( 'aModuleEvents' );
    }

}