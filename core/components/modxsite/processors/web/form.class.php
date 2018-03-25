<?php

/*
    Process web forms
*/

require_once dirname(dirname(__FILE__)) . '/site/web/form.class.php';

class modWebFormProcessor extends modSiteWebFormProcessor
{
    public function initialize()
    {
        if (empty($this->modx->smarty)) {
            $this->modx->invokeEvent('OnHandleRequest');
        }

        if ($template = $this->getProperty('template')) {
            $this->manager_message_tpl = "emails/manager/{$template}.tpl";
        }
        
        return parent::initialize() && !$this->hasErrors();
    }

    protected function getManagerMailSubject(){
        $site_name = $this->modx->getOption('site_name');
        $subject = "Сообщение с сайта {$site_name}";
        return $subject;
    }
    
}
return 'modWebFormProcessor';
