<?php

	class devutilsevents extends oxSuperCfg
	{

		public static function onActivate()
        {
            $vtdu = oxNew("devutils");
            $vtdu->clearTmp();
			/*
			$vtdu->resetModuleFiles("vt-devutils");
			$vtdu->resetModuleExtends("vt-devutils");
			$vtdu->resetModuleTemplates("vt-devutils");
			$vtdu->resetTemplateBlocks("vt-devutils");
			$vtdu->resetModuleSettings("vt-devutils");
			$vtdu->clearTmp();*/
			oxRegistry::getConfig()->getActiveView()->addTplParam("updatenav", "1");
        }
	}