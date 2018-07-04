<?php

/*
    Process web forms
*/

require_once dirname(dirname(__FILE__)) . '/site/web/form.class.php';

class modWebFormProcessor extends modSiteWebFormProcessor
{
    protected $contragentEmailTpl = 'emails/client.tpl';
    protected $manager_group_ids = array(2);

    public function initialize()
    {
        $this->setDefaultProperties(array(
            'contragentEmailSubject'    => 'Спасибо за обращение!',
            'emailsenderName'           => 'Юрпрофит Разводы'
        ));

        if (empty($this->modx->smarty)) {
            $this->modx->invokeEvent('OnHandleRequest');
        }

        if ($template = $this->getProperty('template')) {
            $this->manager_message_tpl = "emails/manager/{$template}.tpl";
        }
        
        return parent::initialize() && !$this->hasErrors();
    }

    protected function getManagerMailSubject()
    {
        switch ($this->getProperty('template')) {
            case 'order':
                $subject = "Заказ услуги на сайте Разводы.";
                break;
            case 'feedback':
                $subject = "Вопрос с сайта Разводы.";
                break;
            case 'ask':
                $subject = "Вопрос юристу с сайта Разводы.";
                break;
            default:
                $site_name = $this->modx->getOption('site_name');
                $subject = "Сообщение с сайта {$site_name}";
        }
        return $subject;
    }

    protected function sendNotification()
    {
        parent::sendNotification();

        if ($contragentEmail = $this->getProperty('email', false)
            AND filter_var($contragentEmail, FILTER_VALIDATE_EMAIL)
        ) {
            $this->sendContragentEmail($contragentEmail);
        }
        return ;
    }

    protected function sendContragentEmail($to)
    {
        if ($message = $this->getMessage($this->contragentEmailTpl)) {
            $this->modx->getService('mail', 'mail.modPHPMailer');
            $this->modx->mail->set(modMail::MAIL_BODY, $message);
            $this->modx->mail->set(modMail::MAIL_FROM, $this->modx->getOption('emailsender'));
            $this->modx->mail->set(modMail::MAIL_FROM_NAME, $this->getProperty('emailsenderName'));
            $this->modx->mail->set(modMail::MAIL_SUBJECT, $this->getProperty('contragentEmailSubject'));
            $this->modx->mail->address('to', $this->getProperty('email'));
            $this->modx->mail->setHTML(true);
            if (!$this->modx->mail->send()) {
                $this->modx->log(modX::LOG_LEVEL_ERROR,'Ошибка отправки уведомления о заказе: '.$this->modx->mail->mailer->ErrorInfo);
            }
            $this->modx->mail->reset();
        }
    }
    
}
return 'modWebFormProcessor';
