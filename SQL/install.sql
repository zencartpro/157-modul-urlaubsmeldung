##################################################################
# Urlaubsmeldung 1.3.0 Install - 2022-02-27 - webchills
##################################################################

INSERT INTO configuration_group (configuration_group_title, configuration_group_description, sort_order, visible) VALUES
('Urlaubsmeldung', 'Holiday Notice Settings', '1', '1');
SET @gid=last_insert_id();
UPDATE configuration_group SET sort_order = last_insert_id() WHERE configuration_group_id = last_insert_id();

INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES 

('Holiday Notice - Enable', 'URLAUBSMELDUNG_STATUS', 'false', 'Do you want to activate the holiday notice?', @gid, 1, NOW(), NULL, 'zen_cfg_select_option(array(\'true\', \'false\'), '),
('Holiday Notice -  Text German', 'URLAUBSMELDUNG_TEXT_DE', 'Bitte beachten Sie, dass wir uns in der Zeit vom XXX bis XXX im Betriebsurlaub befinden und in diesem Zeitraum eingehende Bestellungen erst nach unserer Rückkehr bearbeiten können. Die bei unseren Artikeln angegebenen Lieferzeiten verlängern sich daher jeweils um XXX Tage. Wir danken für Ihr Verständnis.', 'Enter your text for the holiday notice in the German version.', @gid, 3, NOW(), NULL, 'zen_cfg_textarea('),
('Holiday Notice -  Text English', 'URLAUBSMELDUNG_TEXT_EN', 'We are on holiday during XXX and XXX. Orders are possible but will not be shipped before XXX.', 'Enter your text for the holiday notice in the English version.', @gid, 4, NOW(), NULL, 'zen_cfg_textarea(');

##############################
# Add values for German admin
##############################

INSERT INTO configuration_group (configuration_group_id, language_id, configuration_group_title, configuration_group_description, sort_order, visible ) VALUES 
(@gid, 43, 'Urlaubsmeldung', 'Einstellungen zur Urlaubsmeldung', '1', '1');


REPLACE INTO configuration_language (configuration_title, configuration_key, configuration_description, configuration_language_id) VALUES
('Urlaubsmeldung aktivieren?', 'URLAUBSMELDUNG_STATUS', 'Wollen Sie die Urlaubsmeldung mit dem Hinweis auf die längeren Lieferzeiten aktivieren?',	43),
('Urlaubsmeldung Text Deutsch', 'URLAUBSMELDUNG_TEXT_DE', 'Geben Sie hier den Text für Ihre Urlaubsmeldung der deutschen Version mit dem Hinweis auf die längeren Versandzeiten ein.',	43),
('Urlaubsmeldung Text Englisch', 'URLAUBSMELDUNG_TEXT_EN', 'Geben Sie hier den Text für Ihre Urlaubsmeldung der englischen Version mit dem Hinweis auf die längeren Versandzeiten ein.',	43);


###################################
# Register for Admin Access Control
###################################

INSERT INTO admin_pages (page_key,language_key,main_page,page_params,menu_key,display_on_menu,sort_order)
VALUES ('configUrlaubsmeldung','BOX_CONFIGURATION_URLAUBSMELDUNG','FILENAME_CONFIGURATION',CONCAT('gID=',@gid),'configuration','Y',@gid);