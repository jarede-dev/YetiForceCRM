<?php
/* {[The file is published on the basis of YetiForce Public License that can be found in the following directory: licenses/License.html]} */
$CONFIG = [
	// URL address characters limit for mailto links, 
	/*
	  Recommended configuration
	  Outlook = 2030
	  Thunderbird = 8036
	  GMAIL = 8036
	 */
	'MAILTO_LIMIT' => 2030,
	// List of of modules from which you can choose e-mail address in the mail
	'RC_COMPOSE_ADDRESS_MODULES' => ['Accounts', 'Contacts', 'OSSEmployees', 'Leads', 'Vendors', 'Partners', 'Competition'],
	// h - Horinzontal, v - vertical
	'ORIENTATION_PANEL_VIEW' => 'v',
	// 
	'HELPDESK_NEXT_WAIT_FOR_RESPONSE_STATUS' => 'Answered',
	//
	'HELPDESK_OPENTICKET_STATUS' => 'Open',
];
