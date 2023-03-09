<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:import href="library/general.xsl"/>
<xsl:include href="library/quick_purchase.xsl"/>
  <xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />
  <xsl:template match="/">
    <html>
      <head>
        <title>BANKRUPTCY SCREENING
		</title>
        <style type="text/css">
			body {width: 100%; font-family: arial,san-serif; font-size: 10px;}
			.no-margin {margin: 0;}
			.liteblue {	color: #17365D;}
			.red {color: #E44249;}
			.bold {font-weight: bold;}
			.wrapper {width: 660px; margin-left: auto; margin-right: auto;}
			.italic-bold {font-weight: bold; font-style: italic;}
			table.full_border {	border-collapse:collapse;}
			table.full_border tr th, table.full_border tr td { border-width: 1px; border-style:solid; border-color:#C4C1C0; padding: 5px;}
			table.full_border tr th {font-size: 12px; background-color: #DAEEF3;}
			.h1 { font-family: arial,san-serif; font-size: 20px; font-weight: bold; margin-bottom: 5px; color: #1F497D; text-transform:uppercase;}	
			.h3 {font-size: 11px; font-weight: bold; margin-bottom: 5px;}
			.small { font-size: 9px; font-weight: normal;}
			table.nobottom { border: 1px solid #C4C1C0; padding: 0; border-collapse:collapse;}
			.nobottom th { border: 1px solid #C4C1C0; background-color: #DAEEF3; font-size: 12px; padding: 5px; margin: 0px;}
			.nobottom td {border-left: 1px solid #C4C1C0; border-right: 1px solid #C4C1C0; padding: 3px; margin: 0px; }
			.nobottom td.show_border { border: 1px solid #C4C1C0; padding: 3px; margin: 0px;}
			.normal-text { font-family: arial,san-serif; font-size: 10px;}
			table.woborder tr td { border: 0;}
        </style>
      </head>
      <body>
		<div class="wrapper">
			<table width="100%">
				<tr>
					<td align="left"><img src="http://img.experian.com.my/ExperianLogo.png" width="176px" height="59px" /></td>
					<td align="right" valign="bottom" class="italic-bold"><p>CrediTrack by Experian</p><p><xsl:value-of select="xml/report_date"/></p></td>
				</tr>
			</table>
            <p class="h1">BANKRUPTCY SCREENING</p>
				<table border="0" width="100%" class="full_border">
					<tr>
						<th colspan="2" align="left">PARTICULARS OF THE SUBJECT PROVIDED BY YOU</th>
					</tr>
					<tr>
						<td width="20%" class="bold">Name Of Subject</td>
						<td width="80%"><xsl:value-of select="xml/input_request/search_name"/></td>
					</tr>
					<xsl:if test="xml/input_request/old_ic">
						<tr>
							<td width="20%" class="bold">IC / PP No</td>
							<td width="80%"><xsl:value-of select="xml/input_request/old_ic"/></td>
						</tr>
					</xsl:if>
					<xsl:if test="xml/input_request/new_ic">
						<tr>
							<td width="20%" class="bold">New IC No</td>
							<td width="80%"><xsl:value-of select="xml/input_request/new_ic"/></td>
						</tr>
					</xsl:if>
				</table>
				<br />
				<table border="0" width="100%" class="nobottom">
					<tr>
						<th colspan="4" align="left" class="show_border">BANKRUPTCY ACTION<br /><span class="small">Note: The following information on legal / winding up / bankruptcy proceedings may not be current. This Suit(s) may have been dismissed, withdrawn or struck off (eg: it may have been held that the subject is not liable as alleged in the claim, if at all or the case against a Defendant may have been struck off or the alleged debt may have been settled after the entry of the information in our database). The person or company listed as the litigant in the suit may have a similar name as the subject whom/which you seek information on. Whilst the Subject&#39;s IC number (if available) or Company Number (if available) or other identification may indicate that the person named in the action is the Subject, we cannot determine or confirm that the litigant is in fact the subject on whom/which information is sought. Please check with subject(s) concerned for confirmation.</span></th>
					</tr>
					<tr>
						<td colspan="4" class="show_border">
							<table border="0" class="woborder" width="100%">
								<tr>
									<td class="italic-bold normal-text" align="right">Total: <xsl:value-of select="count(xml/bankruptcy_info/case/item)"/></td>
								</tr>
							</table>
						</td>
					</tr>
					<xsl:choose>
						<xsl:when test="(count(xml/bankruptcy_info/case/item)) > 0">
							<xsl:for-each select="xml/bankruptcy_info/case/item">
								<xsl:if test="defendant_name">
									<tr>
										<td width="20%" class="bold">Defendant Name</td>
										<td width="30%"><xsl:value-of select="defendant_name"/></td>
										<td width="20%">&#160;</td>
										<td width="30%">&#160;</td>
									</tr>
								</xsl:if>
								
								<tr>
									<td width="20%" class="bold">IC / PP No</td>
									<td width="30%"><xsl:value-of select="old_ic"/></td>
									<td width="20%" class="bold">New IC No.</td>
									<td width="30%"><xsl:value-of select="new_ic"/></td>
								</tr>
								
								<xsl:if test="case_no">
									<tr>
										<td width="20%" class="bold">Case No</td>
										<td width="30%"><xsl:value-of select="case_no"/></td>
										<td width="20%">&#160;</td>
										<td width="30%">&#160;</td>
									</tr>
								</xsl:if>
								
								<xsl:if test="receiving_date | receiving_ref">
									<tr>
										<td width="20%" class="bold">Receiving Order Date</td>
										<td width="30%"><xsl:value-of select="receiving_date"/></td>
										<td width="20%" class="bold">Receiving Order Date Ref</td>
										<td width="30%"><xsl:value-of select="receiving_ref"/></td>
									</tr>
								</xsl:if>
								<xsl:if test="adjudication_order_date | adjudication_order_ref">
									<tr>
										<td width="20%" class="bold">Adjudication Order Date</td>
										<td width="30%"><xsl:value-of select="adjudication_order_date"/></td>
										<td width="20%" class="bold">Adjudication Order Date Ref</td>
										<td width="30%"><xsl:value-of select="adjudication_order_ref"/></td>
									</tr>
								</xsl:if>
								
								<xsl:if test="solicitor_name | solicitor_code">
									<tr>
										<td width="20%" class="bold">Solicitor</td>
										<td width="30%"><xsl:value-of select="solicitor_name"/></td>
										<td width="20%" class="bold">Solicitor Code</td>
										<td width="30%"><xsl:value-of select="solicitor_code"/></td>
									</tr>
								</xsl:if>
								
								<xsl:if test="solicitor_tel | solicitor_fax">
									<tr>
										<td width="20%" class="bold">Solicitor Tel</td>
										<td width="30%"><xsl:value-of select="solicitor_tel"/></td>
										<td width="20%" class="bold">Solicitor Fax</td>
										<td width="30%"><xsl:value-of select="solicitor_fax"/></td>
									</tr>
								</xsl:if>
								
								<xsl:if test="discharge_date">
									<tr>
										<td width="20%" class="bold">Discharge Date</td>
										<td width="30%"><xsl:value-of select="discharge_date"/></td>
										<td width="20%">&#160;</td>
										<td width="30%">&#160;</td>
									</tr>
								</xsl:if>
								
								<xsl:if test="annulment_date">
									<tr>
										<td width="20%" class="bold">Annulment Date</td>
										<td width="30%"><xsl:value-of select="annulment_date"/></td>
										<td width="20%" class="bold">&#160;</td>
										<td width="30%">&#160;</td>
									</tr>
								</xsl:if>
								
								<xsl:if test="remark">
									<tr>
										<td width="20%" class="bold">Remark</td>
										<td width="30%">
											<xsl:for-each select="remark/item">
												<xsl:value-of select="."/><br />
											</xsl:for-each>
										</td>
										<td width="20%" class="bold">&#160;</td>
										<td width="30%">&#160;</td>
									</tr>
								</xsl:if>
								
								<xsl:if test="(count(creditors/creditor)) > 0">
									<tr>
										<td colspan="4" class="bold show_border">Creditor(s) mentioned in the case above: <xsl:value-of select="case_no"/></td>
									</tr>
									<tr>
										<td width="20%" class="bold">Name</td>
										<td width="30%" class="bold">IC/PP No/Local No/RegNo</td>
										<td width="20%">&#160;</td>
										<td width="30%">&#160;</td>
									</tr>
									
									<xsl:for-each select="creditors/creditor">
										<tr>
											<td width="20%"><xsl:value-of select="name"/></td>
											<td width="30%">
												<xsl:choose>
													<xsl:when test="string-length(new_ic) > 0 and string-length(old_ic) > 0">
														<xsl:value-of select="new_ic"/> / <xsl:value-of select="old_ic"/>
													</xsl:when>
													<xsl:when test="string-length(old_ic) > 0">
														<xsl:value-of select="old_ic"/>
													</xsl:when>
													<xsl:when test="string-length(new_ic) > 0">
														<xsl:value-of select="new_ic"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="reg_no" />
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td width="20%">&#160;</td>
											<td width="30%">&#160;</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								
								<xsl:if test="position() != last()">
									<tr>
										<td colspan="4" class="show_border">&#160;</td>
									</tr>
								</xsl:if>
							</xsl:for-each>
							<xsl:if test="xml/bankruptcy_info/remark">
								<tr>
									<td class="h3 red bold show_border" colspan="4"><xsl:value-of select="xml/bankruptcy_info/remark"/></td>
								</tr>
							</xsl:if>
							<xsl:if test="xml/bankruptcy_info/oa_date">
								<tr>
									<td class="h3 red bold show_border" colspan="4">
										<p class="h3">OFFICIAL ASSIGNEE SEARCH</p>
										<p>Official Assignee search last updated by Experian on <xsl:value-of select="xml/bankruptcy_info/oa_date" /> on
											<xsl:if test="oldic_oa_date"> NRIC: <xsl:value-of select="xml/bankruptcy_info/newic_oa_date" /></xsl:if>
											<xsl:if test="newic_oa_date"> OLD IC: <xsl:value-of select="xml/bankruptcy_info/oldic_oa_date" /></xsl:if>
										confirmed that subject is NOT a bankrupt.</p>
									</td>
								</tr>
							</xsl:if>
						</xsl:when>
						<xsl:otherwise>
							<tr>
								<td colspan="4" class="show_border">NO INFORMATION AVAILABLE</td>
							</tr>
						</xsl:otherwise>
					</xsl:choose>
				</table>
							
				
			<br /><br /><br />
			<xsl:call-template name="bottom_term" />	
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>