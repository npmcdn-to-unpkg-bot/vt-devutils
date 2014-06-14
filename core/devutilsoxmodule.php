<?php

class devutilsoxmodule extends devutilsoxmodule_parent {

   public function addModuleSettings() {
      $this->_addModuleSettings($this->getInfo("settings"));
   }

   public function addModuleFiles() {
      $this->_addModuleFiles($this->getInfo("files"));
   }

   public function addModuleTemplates() {
      $this->_addTemplateFiles($this->getInfo("templates"));
   }

   public function addTemplateBlocks() {
      $this->_addTemplateBlocks($this->getInfo("blocks"));
   }

}
