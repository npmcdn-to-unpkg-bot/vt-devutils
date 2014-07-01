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
            $cfg = oxRegistry::getConfig();
            $this->addTplParam( "aFiles", $this->getModuleFiles() );


            return $this->_tpl;
        }

        public function validateFile( $sFile )
        {
            if ( !pathinfo( $sFile, PATHINFO_EXTENSION ) ) $sFile .= ".php";

            return is_readable( $sFile );
        }

        public function getModuleEvents()
        {
            return oxRegistry::getConfig()->getConfigParam( 'aModuleEvents' );
        }

        public function getModuleFiles()
        {
            $aModules = oxRegistry::getConfig()->getConfigParam( 'aModuleFiles' );
            $aFiles   = false;

            if ( !$aModules ) return $aFiles;

            $cfg    = oxRegistry::getConfig();
            $aFiles = array();
            foreach ( $aModules as $sModuleId => $aModuleFiles )
            {
                $aFiles[$sModuleId] = array();
                foreach ( $aModuleFiles as $key => $value )
                {
                    $aFiles[$sModuleId][] = (object) array(
                        "class" => $key,
                        "file"  => $value,
                        "valid" => $this->validateFile( $cfg->getModulesDir() . $value )
                    );
                }
            }


            return $aFiles;
        }

        public function getModuleTemplates()
        {
            return oxRegistry::getConfig()->getConfigParam( 'aModuleTemplates' );
        }

        public function getTplBlocks()
        {
            $ret = oxDb::getDb( oxDb::FETCH_MODE_ASSOC )->getAll( "select * from oxtplblocks order by oxmodule asc" );

            if ( !count( $ret ) ) return false;

            $aBlocks = array();
            foreach ( $ret AS $value )
            {
                $block                       = (object) array_change_key_case( $value );
                $aBlocks[$block->oxmodule][] = $block;
            }

            return $aBlocks;
        }

    }