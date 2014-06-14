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

    class module_metadata extends oxAdminDetails
    {

        public function render()
        {
            parent::render();

            $sModuleId = $this->getEditObjectId();

            /** @var oxModule $oModule */
            $oModule = oxNew( 'oxModule' );
            if ( $sModuleId && $oModule->load( $sModuleId ) )
            {
                $this->addTplParam( "oModule", $oModule );
                $this->addTplParam( "aExtensions", $this->checkExtensions( $oModule ) ); // extensions
                $this->addTplParam( "aFiles", $this->checkFiles( $oModule ) ); // files
                $this->addTplParam( "aTemplates", $this->checkTemplates( $oModule ) ); // templates
                $this->addTplParam( "aBlocks", $this->checkBlocks( $oModule ) ); // templates
                $this->addTplParam( "aSettings", $this->checkSettings( $oModule ) ); // settings
            }
            else
            {
                oxRegistry::get( "oxUtilsView" )->addErrorToDisplay( new oxException( 'EXCEPTION_MODULE_NOT_LOADED' ) );
            }

            return "vt_devutils_module_metadata.tpl";
        }

        public function validateFile( $sFile )
        {
            if ( !pathinfo( $sFile, PATHINFO_EXTENSION ) ) $sFile .= ".php";

            return is_readable( $sFile );
        }

        public function checkExtensions( oxModule $oModule )
        {
            /** @var oxConfig $cfg */
            $cfg = oxRegistry::getConfig();

            $aActiveModules    = $cfg->getAllModules();
            $aModuleExtensions = $oModule->getExtensions();
            $aExtensions       = false;

            if ( $aModuleExtensions )
            {
                $aExtensions = array();
                foreach ( $aModuleExtensions as $key => $value )
                {
                    $iStatus = 3; // 3 - alles gut
                    if ( !$aActiveModules[$key] ) $iStatus = 1; // 1 - kein Eintrag vorhanden
                    elseif ( !in_array( $value, $aActiveModules[$key] ) ) $iStatus = 2; // 2 - Eintrag vorhanden, aber anderer Pfad zur Datei hinterlegt

                    $aExtensions[] = (object) array(
                        "class"  => $key,
                        "file"   => $value,
                        "valid"  => $this->validateFile( $cfg->getModulesDir() . $value ),
                        "status" => $iStatus //( $aActiveModules[$key] && in_array( $value, $aActiveModules[$key] ) ? true : false )
                    );
                }
            }

            return $aExtensions;
        }

        public function checkFiles( oxModule $oModule )
        {
            $aActiveFiles = $oModule->getModuleFiles();
            $aModuleFiles = $oModule->getInfo( 'files' );
            $aFiles       = false;

            if ( $aModuleFiles )
            {
                $cfg = oxRegistry::getConfig();

                $aFiles = array();
                foreach ( $aModuleFiles as $key => $value )
                {
                    $key = strtolower($key); // fix case sensitive problems
                    $iStatus = 3; // 3 - alles gut
                    if ( !$aActiveFiles[$oModule->getId()] ) $iStatus = 0; // 0 - überhaupt keine Einträge für dieses Modul vorhanden
                    elseif ( !$aActiveFiles[$oModule->getId()][$key] ) $iStatus = 1; // 1 - kein Eintrag für dieses Template vorhanden
                    elseif ( $aActiveFiles[$oModule->getId()][$key] != $value ) $iStatus = 2; // 2 - Eintrag vorhanden, aber anderer Pfad zur Datei hinterlegt

                    $aFiles[] = (object) array(
                        "class"  => $key,
                        "file"   => $value,
                        "valid"  => $this->validateFile( $cfg->getModulesDir() . $value ),
                        "status" => $iStatus

                    );
                }
            }

            return $aFiles;
        }

        public function checkTemplates( oxModule $oModule )
        {
            $aActiveTemplates = $oModule->getModuleTemplates();
            $aModuleTemplates = $oModule->getInfo( 'templates' );
            $aTemplates       = false;

            if ( $aModuleTemplates )
            {
                $cfg = oxRegistry::getConfig();

                $aTemplates = array();
                foreach ( $aModuleTemplates as $key => $value )
                {
                    $iStatus = 3; // 3 - alles gut
                    if ( !$aActiveTemplates[$oModule->getId()] ) $iStatus = 0; // 0 - überhaupt keine Einträge für dieses Modul vorhanden
                    elseif ( !$aActiveTemplates[$oModule->getId()][$key] ) $iStatus = 1; // 1 - kein Eintrag für dieses Template vorhanden
                    elseif ( $aActiveTemplates[$oModule->getId()][$key] != $value ) $iStatus = 2; // 2 - Eintrag vorhanden, aber anderer Pfad zur Datei hinterlegt

                    $aTemplates[] = (object) array(
                        "title"  => $key,
                        "file"   => $value,
                        "valid"  => $this->validateFile( $cfg->getModulesDir() . $value ),
                        "status" => $iStatus
                    );
                }
            }

            return $aTemplates;
        }

        public function checkBlocks( oxModule $oModule )
        {
            $aModuleBlocks = $oModule->getInfo( 'blocks' );
            $aBlocks       = false;

            if ( $aModuleBlocks )
            {
                $aBlocks = array();
                foreach ( $aModuleBlocks as $item )
                {
                    $oDb = oxDb::getDb( oxDb::FETCH_MODE_ASSOC );

                    $sSql = "SELECT oxfile, oxactive FROM oxtplblocks " . "WHERE oxtemplate = " . $oDb->quote( $item["template"] ) . " AND oxblockname = " . $oDb->quote( $item["block"] ) . " AND oxmodule = " . $oDb->quote( $oModule->getId() );

                    $aBlock = $oDb->getOne( $sSql );

                    $iStatus = 3; // 3 - alles gut

                    $aBlocks[] = (object) array(
                        "template" => $item["template"],
                        "block"    => $item["block"],
                        "file"     => $item["file"],
                        "valid"    => $this->validateFile( $oModule->getModuleFullPath( $oModule->getId() ) . $item["file"] ),
                        "status"   => $iStatus //( $aActiveModules[$key] && in_array( $value, $aActiveModules[$key] ) ? true : false )
                    );
                }
            }

            return $aBlocks;
        }

        public function validateSetting($sSetting)
        {

        }

        public function checkSettings( oxModule $oModule )
        {
            $aModuleSettings = $oModule->getInfo( 'settings' );
            $aSettings       = false;


            if ( $aModuleSettings )
            {
                $cfg       = oxRegistry::getConfig();
                $aSettings = array();
                foreach ( $aModuleSettings as $item )
                {
                    $oDb = oxDb::getDb( oxDb::FETCH_MODE_ASSOC );

                    $sSql = "SELECT oxmodule, oxvartype FROM oxconfig WHERE oxvarname = " . $oDb->quote( $item["name"] );
                    $aSetting = $oDb->getRow( $sSql );

                    if(!$aSetting) $iStatus = 0;
                    elseif($aSetting['oxmodule'] != "module:".$oModule->getId()) $iStatus = 1;
                    elseif($aSetting['oxvartype'] != $item["type"]) $iStatus = 2;
                    else $iStatus = 3; // 3 - alles gut

                    $aSettings[] = (object) array(
                        "name"    => $item["name"],
                        "type"    => $item["type"],
                        "default" => $item["value"],
                        "value"   => $cfg->getConfigParam($item["name"]),
                        "valid"   => true, //$this->validateFile( $oModule->getModuleFullPath( $oModule->getId() ) . $item["file"] ),
                        "status"  => $iStatus //( $aActiveModules[$key] && in_array( $value, $aActiveModules[$key] ) ? true : false )
                    );
                }
            }

            return $aSettings;
        }

    }
