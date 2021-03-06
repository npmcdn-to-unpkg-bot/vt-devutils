<?php

/**
 * vt dev utilities - modules
 * The MIT License (MIT)
 *
 * Copyright (C) 2015  Marat Bedoev
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 * Author:     Marat Bedoev <m@marat.ws>
 */
class vtdevmodule_metadata extends oxAdminDetails
{
    protected $_sThisTemplate = 'vt_dev_module_metadata.tpl';

    public function render()
    {
        $sModuleId = $this->getEditObjectId();
        $oModule = oxNew('oxModule');
        if ($sModuleId && $oModule->load($sModuleId))
        {
            $this->addTplParam("oModule",$oModule);
        }
        return parent::render();
    }

    public function getModule()
    {
        $oModule = oxNew('oxModule');
        $id = $this->getEditObjectId();
        var_dump($id);
        if( $this->getEditObjectId() && $oModule->load($this->getEditObjectId())) return $oModule;
        return false;
    }
    /*
        public function render()
        {
            $ret = parent::render();
            $preview = oxRegistry::getConfig()->getRequestParameter('preview');
            return ($preview) ? "vt_dev_mails_preview.tpl" : $ret;
        }
        */

    public function getModuleExtensions()
    {
        $m = $this->getModule();
        var_dump($m);
        exit;
        //->getExtensions()
        oxRegistry::get("devutils")->success();
    }

    public function aModuleFiles()
    {
        $cfg = oxRegistry::getConfig();
        echo json_encode($cfg->getConfigParam("aModuleFiles"));
        exit;
    }

    public function aModuleTemplates()
    {
        $cfg = oxRegistry::getConfig();
        echo json_encode($cfg->getConfigParam("aModuleTemplates"));
        exit;
    }

    public function aModulePaths()
    {
        $cfg = oxRegistry::getConfig();
        echo json_encode($cfg->getConfigParam("aModulePaths"));
        exit;
    }

    public function aModuleVersions()
    {
        $cfg = oxRegistry::getConfig();
        echo json_encode($cfg->getConfigParam("aModuleVersions"));
        exit;
    }

    public function aModuleEvents()
    {
        $cfg = oxRegistry::getConfig();
        echo json_encode($cfg->getConfigParam("aModuleEvents"));
        exit;
    }



}