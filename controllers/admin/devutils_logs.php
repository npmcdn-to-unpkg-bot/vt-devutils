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

    class devutils_logs extends oxAdminDetails
    {
        protected $_sExLog    = null;
        protected $_sErrLog   = null;
        protected $_sSqlLog   = null;
        protected $_sMailsLog = null;


        public function init()
        {
            parent::init();

            $cfg = oxRegistry::getConfig();

            $this->_sExLog    = ( $cfg->getConfigParam( 'bExLog' ) ) ? $cfg->getConfigParam( 'sShopDir' ) . 'log/EXCEPTION_LOG.txt' : false;
            $this->_sErrLog   = ( $cfg->getConfigParam( 'bSrvErrLog' ) ) ? $cfg->getConfigParam( 'sSrvErrLog' ) : false;
            $this->_sSqlLog   = ( $cfg->getConfigParam( 'bSqlLog' ) ) ? $cfg->getConfigParam( 'sSqlLog' ) : false;
            $this->_sMailsLog = ( $cfg->getConfigParam( 'bMailLog' ) ) ? $cfg->getConfigParam( 'sMailLog' ) : false;

            if ( substr( $this->_sErrLog, 0, 1 ) !== "/" ) $this->_sErrLog = $cfg->getConfigParam( 'sShopDir' ) . $this->_sErrLog; // relative path 4 apache error log?
        }

        public function render()
        {
            parent::render();
            $cfg = oxRegistry::getConfig();

            $this->addTplParam( 'exLog', $this->getExceptionLog() );
            $this->addTplParam( 'errLog', $this->getErrorLog() );
            $this->addTplParam( 'SqlLog', false );
            $this->addTplParam( 'MailLog', false );

            //var_dump("<h2>".$this->_sExLogPath."</h2>");
            //$this->getExceptionLog();
            //echo "<hr/>";
            //var_dump("<h2>".$this->_sErrorLog."</h2>");
            //$this->addTplParam('ErrorLog'] = $this->getErrorLog();
            //echo "<hr/>";
            //var_dump("<h2>".$this->_sDbLog."</h2>");
            //echo "<hr/>";
            //var_dump("<h2>".$this->_sMailLog."</h2>");
            //$this->addTplParam('ExceltionLog'] = "logs";


            return 'vt_devutils_logs.tpl';
        }

        public function getExceptionLog()
        {
            if ( !file_exists( $this->_sExLog ) || !is_readable( $this->_sExLog ) )
            {
                $this->addTplParam( "exLogMsg", (object) array( "type" => "warning", "text" => "EXCEPTION_LOG.txt does not exist" ) );

                return false;
            }
            $cfg    = oxRegistry::getConfig();
            $iExLog = intval( $cfg->getConfigParam( "iExLog" ) );
            $iExLog = $iExLog ? $iExLog : 10;

            if ( $sData = file_get_contents( $this->_sExLog ) )
            {
                $aData = explode( "---------------------------------------------", $sData );
                $aData = array_slice( $aData, -( $iExLog + 1 ) );
                array_pop( $aData ); // cut last empty array element
                array_walk( $aData, array( $this, '_prepareExLog' ) );

                return $aData;
            }

            $this->addTplParam( "exLogMsg", (object) array( "type" => "success", "text" => "no exceptions, good job sir!" ) );

            return false;
        }

        private function _prepareExLog( &$item, $key )
        {
            $aEx  = explode( "Stack Trace:", trim( $item ) );
            $item = (object) array(
                "header" => str_replace( "[0]:", "<br/><small>", $aEx[0] ) . "</small>",
                "text"   => htmlentities( trim( $aEx[1] ) )
            );
        }

        public function restartExceptionLog()
        {
            $oldname = basename( $this->_sExLog );
            $newname = substr( $oldname, 0, -4 ) . "_" . date( "Y-m-d" ) . substr( $oldname, -4 );

            file_put_contents( str_replace( $oldname, $newname, $this->_sExLog ), file_get_contents( $this->_sExLog ), FILE_APPEND ); // backup actual content
            file_put_contents( $this->_sExLog, '' ); // reset log file

            $this->addTplParam( "exLogMsg", (object) array( "type" => "success", "text" => "exception log restarted, old logs were moved into $newname" ) );
        }


        public function getErrorLog()
        {
            if ( !$this->_sErrLog ) return false;
            if ( !file_exists( $this->_sErrLog ) || !is_readable( $this->_sErrLog ) )
            {
                $this->addTplParam( "errLogMsg", (object) array( "type" => "warning", "text" => "file does not exist or is not readable" ) );

                return false;
            }

            $cfg        = oxRegistry::getConfig();
            $iSrvErrLog = intval( $cfg->getConfigParam( "iSrvErrLog" ) );
            $iSrvErrLog = $iSrvErrLog ? $iSrvErrLog : 10;
            $aData      = file( $this->_sErrLog );
            $aData      = array_slice( $aData, -$iSrvErrLog );
            array_walk( $aData, array( $this, '_prepareErrLog' ) );

            return $aData;
        }

        private function _prepareErrLog( &$item, $key )
        {
            //$aEx = preg_split ("(\[client [\d\.]+\])",$item);
            //$aEx = preg_split ("(\sin\s)",$item);
            $aLog = explode( "] ", $item, 4 );
            //preg_match("([a-zA-Z0-9\s\.\:]+)", $item, $date);
            $aSearch  = array( " in ", " referer:" );
            $aReplace = array( "<br/>in ", "<br/>referer:<small>" );
            $aEx      = array(
                "date"   => trim( substr( $aLog[0], 1 ) ),
                "type"   => trim( substr( $aLog[1], 1 ) ),
                "client" => trim( substr( $aLog[2], 1 ) ),
                "text"   => str_replace( $aSearch, $aReplace, trim( $aLog[3] ) ) . "</small>"
            );

            $item = (object) $aEx;
        }

        public function restartErrorLog()
        {
            if ( !$this->_sErrLog ) return false;
            if ( is_writable( $this->_sErrLog ) )
            {
                file_put_contents( $this->_sErrLog . "_" . date( "Y-m-d" ), file( $this->_sErrLog ), FILE_APPEND ); // backup actual log
                file_put_contents( $this->_sErrLog, '' ); // reset log file
                $this->addTplParam( "errLogMsg", (object) array(
                        "type" => "success",
                        "text" => "error log restarted, old logs were moved into " . basename( $this->_sErrLog ) . "_" . date( "Y-m-d" )
                    ) );
            }

            $this->addTplParam( "errLogMsg", (object) array( "type" => "warning", "text" => "log restart failed, file is nor writable!" ) );
        }
    }