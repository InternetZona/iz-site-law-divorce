<?php
/**
 *
 * Package: law-divorce.
 * User: magr0s
 * Date: 25.03.2018
 *
 */

require_once dirname(dirname(dirname(__FILE__))) . '/site/web/public/action.class.php';

class modWebPublicActionProcessor extends modSiteWebPublicActionProcessor
{
    public static function getInstance(modX &$modx, $className, $properties = array())
    {
        if(!empty($properties['action']) && !self::$actualClassName){
            switch ($properties['action']) {
                case 'form':
                    require_once __DIR__ . '/../form.class.php';
                    self::$actualClassName = "modWebFormProcessor";
                    break;
                default: ;
            }
        }
        return parent::getInstance($modx, $className, $properties); // TODO: Change the autogenerated stub
    }
}
return 'modWebPublicActionProcessor';