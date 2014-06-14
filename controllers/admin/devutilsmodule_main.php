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
    class devutilsmodule_main extends devutilsmodule_main_parent
    {

        public function resetModuleSettings()
        {
            $sModuleId = $this->getEditObjectId();
            oxRegistry::get( "devutils" )->resetModuleSettings( $sModuleId );

            oxRegistry::get("oxUtilsView")->addErrorToDisplay( "reset settings for $sModuleId" );
        }

        public function resetModuleExtends()
        {
            $sModuleId = $this->getEditObjectId();
            oxRegistry::get( "devutils" )->resetModuleExtends( $sModuleId );

            oxRegistry::get("oxUtilsView")->addErrorToDisplay( "reset class extensions for $sModuleId" );
        }

        public function resetModuleFiles()
        {
            $sModuleId = $this->getEditObjectId();
            oxRegistry::get( "devutils" )->resetModuleFiles( $sModuleId );

            oxRegistry::get("oxUtilsView")->addErrorToDisplay( "reset module files for $sModuleId" );
        }

        public function resetModuleTemplates()
        {
            $sModuleId = $this->getEditObjectId();
            oxRegistry::get( "devutils" )->resetModuleTemplates( $sModuleId );

            oxRegistry::get("oxUtilsView")->addErrorToDisplay( "reset module templates for $sModuleId" );
        }

        public function resetTemplateBlocks()
        {
            $sModuleId = $this->getEditObjectId();
            oxRegistry::get( "devutils" )->resetTemplateBlocks( $sModuleId );

            oxRegistry::get("oxUtilsView")->addErrorToDisplay( "reset template blocks for $sModuleId" );
        }

    }