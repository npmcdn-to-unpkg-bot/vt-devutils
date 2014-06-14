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

	class devutils_console extends oxAdminView
	{

		protected $_tpl = 'vt_devutils_console.tpl';

		public function init()
		{
			parent::init();
			$GLOBALS["me"] = $user = oxRegistry::getConfig()->getUser();
			$GLOBALS["session"] = $user->getSession();
			$GLOBALS["order"] = array_shift($user->getOrders(1)->getArray());
			$GLOBALS["basket"] = $user->getSession()->getBasket();
		}

		public function render()
		{
			parent::render();

			return $this->_tpl;
		}

		public function doTest()
		{
			global $me,  $session, $order, $basket;

			$cfg = oxRegistry::get("oxConfig");
			$code = $cfg->getParameter("codeinput");
			$this->_aViewData["codeinput"] = $code;

			ob_start();


			//echo "$code";
			$ex = eval($code);

			//$encoder = oxRegistry::get("oxSeoEncoder");

			$this->_aViewData["codeoutput"] = ob_get_contents();
			$this->_aViewData["codeerror"] = $ex;
			ob_end_clean();
		}

	}