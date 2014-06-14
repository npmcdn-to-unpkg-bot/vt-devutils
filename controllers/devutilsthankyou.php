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
 *
 * @author: Joscha Krug<krug@marmalade.de>
 */

class devutilsthankyou extends devutilsthankyou_parent {

	/**
	 * We override the init-function so your basket will not be destroyed
	 * and you could reload the page several times to debug thankyou page or even order emails.
	 */
	public function init()
	{
		if(oxRegistry::getConfig()->getConfigParam("bKeepBasket"))
		{
			$oBasket = $this->getSession()->getBasket();
			$oImmortalBasket = clone $oBasket;
		}

		parent::init();

		if(oxRegistry::getConfig()->getConfigParam("bKeepBasket"))
		{
			$this->getSession()->setBasket($oImmortalBasket);
		}
	}
}