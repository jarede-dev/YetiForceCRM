{*<!--
/*********************************************************************************
** The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 ********************************************************************************/
-->*}
{strip}
	<div class="">
		<form id="leadsMapping" method="POST">
			<div class="row settingsHeader padding1per">
				<span class="col-md-8">
					<span class="font-x-x-large">{vtranslate('LBL_CONVERT_LEAD_FIELD_MAPPING', $QUALIFIED_MODULE)}</span>
				</span>
				<span class="col-md-4 paddingRightZero">
					<span class="pull-right">
						<button type="submit" class="btn btn-success"><strong>{vtranslate('LBL_SAVE', $QUALIFIED_MODULE)}</strong></button>
						<button class="cancelLink btn btn-warning" type="reset" onclick="javascript:window.history.back();">{vtranslate('LBL_CANCEL', $QUALIFIED_MODULE)}</button>
					</span>
				</span>
			</div><hr>
			<div class="contents" id="detailView">
				<table class="table customTableRWD table-bordered">
					<thead>
						<tr class="blockHeader">
							<th class="blockHeader" width="20%">{vtranslate('LBL_FIELD_LABEL', $QUALIFIED_MODULE)}</th>
							<th class="blockHeader" width="20%">{vtranslate('LBL_FIELD_TYPE', $QUALIFIED_MODULE)}</th>
							<th data-hide='phone' class="blockHeader textAlignCenter" colspan="3" width="60%">{vtranslate('LBL_MAPPING_WITH_OTHER_MODULES', $QUALIFIED_MODULE)}</th>
						</tr>
					</thead>
				</table>
				<table class="table customTableRWD table-bordered" width="100%" id="convertLeadMapping">
					<thead>
						<tr>
							{foreach key=key item=LABEL from=$MODULE_MODEL->getHeaders()}
								<th {if $smarty.foreach.index.iteration > 2}data-hide='phone'{/if} width="20%"><b>{vtranslate($LABEL, $LABEL)}</b></th>
							{/foreach}
						</tr>
					</thead>
					<tbody>
						{foreach key=MAPPING_ID item=MAPPING_ARRAY from=$MODULE_MODEL->getMapping()  name="mappingLoop"}
							<tr class="listViewEntries" sequence-number="{$smarty.foreach.mappingLoop.iteration}">
								<td width="20%">
									<input type="hidden" name="mapping[{$smarty.foreach.mappingLoop.iteration}][mappingId]" value="{$MAPPING_ID}"/>
									<select class="leadsFields select2" style="width:180px" name="mapping[{$smarty.foreach.mappingLoop.iteration}][lead]">
										{foreach key=FIELD_TYPE item=FIELDS_INFO from=$LEADS_MODULE_MODEL->getFields()}
											{foreach key=FIELD_ID item=FIELD_OBJECT from=$FIELDS_INFO}
												<option data-type="{$FIELD_TYPE}" {if $FIELD_ID eq $MAPPING_ARRAY['Leads']['id']} selected {/if} label="{vtranslate($FIELD_OBJECT->get('label'), $LEADS_MODULE_MODEL->getName())}" value="{$FIELD_ID}">
														{vtranslate($FIELD_OBJECT->get('label'), $LEADS_MODULE_MODEL->getName())}
													</option>
											{/foreach}
										{/foreach}
									</select>
								</td>
								<td width="20%" class="selectedFieldDataType">{vtranslate($MAPPING_ARRAY['Leads']['fieldDataType'], $QUALIFIED_MODULE)}</td>
								<td width="20%">
									<select class="accountsFields select2" style="width:180px" name="mapping[{$smarty.foreach.mappingLoop.iteration}][account]">
										<option data-type="{vtranslate('LBL_NONE', $QUALIFIED_MODULE)}" value="0" label="{vtranslate('LBL_NONE', $QUALIFIED_MODULE)}">{vtranslate('LBL_NONE', $QUALIFIED_MODULE)}</option>
										{foreach key=FIELD_TYPE item=FIELDS_INFO from=$ACCOUNTS_MODULE_MODEL->getFields()}
											{foreach key=FIELD_ID item=FIELD_OBJECT from=$FIELDS_INFO}
												{if $MAPPING_ARRAY['Leads']['fieldDataType'] eq $FIELD_TYPE}
													<option data-type="{$FIELD_TYPE}" {if $FIELD_ID eq $MAPPING_ARRAY['Accounts']['id']} selected {/if} label="{vtranslate($FIELD_OBJECT->get('label'), $ACCOUNTS_MODULE_MODEL->getName())}" value="{$FIELD_ID}">
														{vtranslate($FIELD_OBJECT->get('label'), $ACCOUNTS_MODULE_MODEL->getName())}
													</option>
												{/if}
											{/foreach}
										{/foreach}
									</select>
								</td>
								<td width="20%">
									<select class="contactFields select2" style="width:180px" name="mapping[{$smarty.foreach.mappingLoop.iteration}][contact]">
										<option data-type="{vtranslate('LBL_NONE', $QUALIFIED_MODULE)}" value="0" label="{vtranslate('LBL_NONE', $QUALIFIED_MODULE)}">{vtranslate('LBL_NONE', $QUALIFIED_MODULE)}</option>
										{foreach key=FIELD_TYPE item=FIELDS_INFO from=$CONTACTS_MODULE_MODEL->getFields()}
											{foreach key=FIELD_ID item=FIELD_OBJECT from=$FIELDS_INFO}
												{if $MAPPING_ARRAY['Leads']['fieldDataType'] eq $FIELD_TYPE}
													<option data-type="{$FIELD_TYPE}" {if $FIELD_ID eq $MAPPING_ARRAY['Contacts']['id']} selected {/if} label="{vtranslate($FIELD_OBJECT->get('label'), $CONTACTS_MODULE_MODEL->getName())}" value="{$FIELD_ID}">
														{vtranslate($FIELD_OBJECT->get('label'), $CONTACTS_MODULE_MODEL->getName())}
													</option>
												{/if}
											{/foreach}
										{/foreach}
									</select>
								</td>
								<td width="20%">
									<select class="potentialFields select2" style="width:180px" name="mapping[{$smarty.foreach.mappingLoop.iteration}][potential]">
										<option data-type="{vtranslate('LBL_NONE', $QUALIFIED_MODULE)}" value="0" label="{vtranslate('LBL_NONE', $QUALIFIED_MODULE)}">{vtranslate('LBL_NONE', $QUALIFIED_MODULE)}</option>
										{foreach key=FIELD_TYPE item=FIELDS_INFO from=$POTENTIALS_MODULE_MODEL->getFields()}
											{foreach key=FIELD_ID item=FIELD_OBJECT from=$FIELDS_INFO}
												{if $MAPPING_ARRAY['Leads']['fieldDataType'] eq $FIELD_TYPE}
													<option data-type="{$FIELD_TYPE}" {if $FIELD_ID eq $MAPPING_ARRAY['Potentials']['id']} selected {/if} label="{vtranslate($FIELD_OBJECT->get('label'), $POTENTIALS_MODULE_MODEL->getName())}" value="{$FIELD_ID}">
														{vtranslate($FIELD_OBJECT->get('label'), $POTENTIALS_MODULE_MODEL->getName())}
													</option>
												{/if}
											{/foreach}
										{/foreach}
									</select>
									{if $MAPPING_ARRAY['editable'] eq 1}
										{foreach item=LINK_MODEL from=$MODULE_MODEL->getMappingLinks()}
											<div class="pull-right actions">
												<span class="actionImages">
													<a><span title="{vtranslate($LINK_MODEL->getLabel(), $MODULE)}" class="glyphicon glyphicon-trash alignMiddle deleteMapping"></span></a>
												</span>
											</div>
										{/foreach}
									{/if}
								</td>
							</tr>
						{/foreach}
						<tr class="hide newMapping listViewEntries">
							<td width="15%">
								<select class="leadsFields newSelect" style="width:180px">
									<option data-type="{vtranslate('LBL_NONE', $QUALIFIED_MODULE)}" value="0" label="{vtranslate('LBL_NONE', $QUALIFIED_MODULE)}">{vtranslate('LBL_NONE', $QUALIFIED_MODULE)}</option>
									{foreach key=FIELD_TYPE item=FIELDS_INFO from=$LEADS_MODULE_MODEL->getFields()}
										{foreach key=FIELD_ID item=FIELD_OBJECT from=$FIELDS_INFO}
												<option data-type="{$FIELD_TYPE}" label="{vtranslate($FIELD_OBJECT->get('label'), $LEADS_MODULE_MODEL->getName())}" value="{$FIELD_ID}">
													{vtranslate($FIELD_OBJECT->get('label'), $LEADS_MODULE_MODEL->getName())}
												</option>
										{/foreach}
									{/foreach}
								</select>
							</td>
							<td width="15%" class="selectedFieldDataType"></td>
							<td width="13%">
								<select class="accountsFields newSelect" style="width:180px">
									<option data-type="{vtranslate('LBL_NONE', $QUALIFIED_MODULE)}" label="{vtranslate('LBL_NONE', $QUALIFIED_MODULE)}" value="0">{vtranslate('LBL_NONE', $QUALIFIED_MODULE)}</option>
									{foreach key=FIELD_TYPE item=FIELDS_INFO from=$ACCOUNTS_MODULE_MODEL->getFields()}
										{foreach key=FIELD_ID item=FIELD_OBJECT from=$FIELDS_INFO}
												<option data-type="{$FIELD_TYPE}" label="{vtranslate($FIELD_OBJECT->get('label'), $ACCOUNTS_MODULE_MODEL->getName())}" value="{$FIELD_ID}">
													{vtranslate($FIELD_OBJECT->get('label'), $ACCOUNTS_MODULE_MODEL->getName())}
												</option>
										{/foreach}
									{/foreach}
								</select>
							</td>
							<td width="13%">
								<select class="contactFields newSelect" style="width:180px">
									<option data-type="{vtranslate('LBL_NONE', $QUALIFIED_MODULE)}" label="{vtranslate('LBL_NONE', $QUALIFIED_MODULE)}" value="0">{vtranslate('LBL_NONE', $QUALIFIED_MODULE)}</option>
									{foreach key=FIELD_TYPE item=FIELDS_INFO from=$CONTACTS_MODULE_MODEL->getFields()}
										{foreach key=FIELD_ID item=FIELD_OBJECT from=$FIELDS_INFO}
												<option data-type="{$FIELD_TYPE}" label="{vtranslate($FIELD_OBJECT->get('label'), $CONTACTS_MODULE_MODEL->getName())}" value="{$FIELD_ID}">
													{vtranslate($FIELD_OBJECT->get('label'), $CONTACTS_MODULE_MODEL->getName())}
												</option>
										{/foreach}
									{/foreach}
								</select>
							</td>
							<td width="13%">
								<select class="potentialFields newSelect" style="width:180px">
									<option data-type="{vtranslate('LBL_NONE', $QUALIFIED_MODULE)}" label="{vtranslate('LBL_NONE', $QUALIFIED_MODULE)}" value="0">{vtranslate('LBL_NONE', $QUALIFIED_MODULE)}</option>
									{foreach key=FIELD_TYPE item=FIELDS_INFO from=$POTENTIALS_MODULE_MODEL->getFields()}
										{foreach key=FIELD_ID item=FIELD_OBJECT from=$FIELDS_INFO}
												<option data-type="{$FIELD_TYPE}" label="{vtranslate($FIELD_OBJECT->get('label'), $POTENTIALS_MODULE_MODEL->getName())}" value="{$FIELD_ID}">
													{vtranslate($FIELD_OBJECT->get('label'), $POTENTIALS_MODULE_MODEL->getName())}
												</option>
										{/foreach}
									{/foreach}
								</select>
								{foreach item=LINK_MODEL from=$MODULE_MODEL->getMappingLinks()}
									<div class="pull-right actions">
										<span class="actionImages">
											<a><span title="{vtranslate($LINK_MODEL->getLabel(), $MODULE)}" class="glyphicon glyphicon-trash alignMiddle deleteMapping"></span></a>
										</span>
									</div>
								{/foreach}
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="row pushDown">
				<span class="col-md-4">
					<button id="addMapping" class="btn btn-info addButton" type="button">
						<span class="glyphicon glyphicon-plus"></span>&nbsp;<strong>{vtranslate('LBL_ADD_MAPPING', $QUALIFIED_MODULE)}</strong>
					</button>
				</span>
				<span class="col-md-8">
					<span class="pull-right">
						<button type="submit" class="btn btn-success"><strong>{vtranslate('LBL_SAVE', $QUALIFIED_MODULE)}</strong></button>
						<button class="cancelLink btn btn-warning" type="reset" onclick="javascript:window.history.back();">{vtranslate('LBL_CANCEL', $QUALIFIED_MODULE)}</button>
					</span>
				</span>
			</div>
		</form>
	</div>
{/strip}
